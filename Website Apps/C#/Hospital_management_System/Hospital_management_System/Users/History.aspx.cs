using System;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Hospital_management_System.Users
{
    public partial class History : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAppointmentHistory();
            }
        }

        public void BindAppointmentHistory()
        {
            // Set your connection string
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Hospital_management_System\Hospital_management_System\App_Data\Lukky.mdf;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT Date, Section, Name, Gender, Mobile, AID, Status FROM dbo.AppontTab";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        int serialNumber = 1;

                        while (reader.Read())
                        {
                            // Check if the status is either "Complete" or "Missed"
                            string status = reader["Status"] as string; // Assuming the status column is of type string
                            if (status == "Complete" || status == "Missed")
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
                                cell.InnerText = status;
                                row.Cells.Add(cell);

                                // Add the row to the table
                                HistoryTable.Rows.Add(row);

                                serialNumber++;
                            }
                        }
                    }
                }
            }
        }


    }
}
