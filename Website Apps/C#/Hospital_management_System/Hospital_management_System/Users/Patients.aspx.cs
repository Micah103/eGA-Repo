using System;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Hospital_management_System.Users
{
    public partial class Patients : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindPatientData();
            }
            else 
            { 
                BindPatientData();
            }
        }

        private void BindPatientData()
        {
            // Set your connection string
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Hospital_management_System\Hospital_management_System\App_Data\Lukky.mdf;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT Date, Section, Name, Gender, Mobile, AID, status FROM dbo.AppontTab";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        int serialNumber = 1;

                        // Clear the existing rows in the table
                        PatientTable.Rows.Clear();

                        while (reader.Read())
                        {
                            // Check if the status is either "Complete" or "Missed"
                            string status = reader["status"] as string; // Assuming the status column is of type string
                            if (status != "Complete" && status != "Missed")
                            {
                                HtmlTableRow row = new HtmlTableRow();
                                HtmlTableCell cell;

                                // S/N
                                cell = new HtmlTableCell();
                                cell.InnerText = serialNumber.ToString();
                                row.Cells.Add(cell);

                                // Appointment
                                cell = new HtmlTableCell();
                                cell.InnerText = reader["Section"].ToString();
                                row.Cells.Add(cell);

                                // Name
                                cell = new HtmlTableCell();
                                cell.InnerText = reader["Name"].ToString();
                                row.Cells.Add(cell);

                                // Gender
                                cell = new HtmlTableCell();
                                cell.InnerText = reader["Gender"].ToString();
                                row.Cells.Add(cell);

                                // Phone
                                cell = new HtmlTableCell();
                                cell.InnerText = "0" + reader["Mobile"].ToString();
                                row.Cells.Add(cell);

                                // Date
                                cell = new HtmlTableCell();
                                // Assuming the Date column in the database is of DateTime type
                                cell.InnerText = Convert.ToDateTime(reader["Date"]).ToString("yyyy-MM-dd");
                                row.Cells.Add(cell);

                                // Status
                                cell = new HtmlTableCell();
                                string appointmentId = reader["AID"].ToString();
                                Button completeButton = new Button();
                                completeButton.Text = "Complete";
                                completeButton.CssClass = "status-button";
                                completeButton.CommandArgument = $"{appointmentId}|Complete";
                                completeButton.Click += StatusButton_Click;

                                Button missedButton = new Button();
                                missedButton.Text = "Missed";
                                missedButton.CssClass = "status-button";
                                missedButton.CommandArgument = $"{appointmentId}|Missed";
                                missedButton.Click += StatusButton_Click;

                                cell.Controls.Add(completeButton);
                                cell.Controls.Add(missedButton);
                                row.Cells.Add(cell);

                                // Add the row to the table
                                PatientTable.Rows.Add(row);
                            }

                            serialNumber++;
                        }
                    }
                }
            }
        }


        protected void StatusButton_Click(object sender, EventArgs e)
        {
            var statusButton = (Button)sender;
            string[] args = statusButton.CommandArgument.Split('|');
            string appointmentId = args[0];
            string status = args[1];

            // Update the status in the database
            UpdateAppointmentStatus(appointmentId, status);

            // Optionally, rebind your data after updating if needed
            BindPatientData();
        }

        private void UpdateAppointmentStatus(string appointmentId, string status)
        {
            // Set your connection string
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Hospital_management_System\Hospital_management_System\App_Data\Lukky.mdf;Integrated Security=True";

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    // Add debugging information
                    Console.WriteLine($"Updating status for appointmentId: {appointmentId}, status: {status}");

                    // Check if the column name matches the actual column name in the database
                    string query = "UPDATE dbo.AppontTab SET Status = @Status WHERE AID = @AID";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@AID", appointmentId);
                        cmd.Parameters.AddWithValue("@Status", status);

                        // Add debugging information
                        Console.WriteLine($"Executing query: {query}");

                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                // Log or print the exception details
                Console.WriteLine($"Error updating status: {ex.Message}");
            }
        }


    }
}
