using System;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Hospital_management_System.Users
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUserData();
                
            }
            else
            {
                // Rebind the data after a postback
                BindUserData();

            }
        }

        private void BindUserData()
        {
            // Set your connection string
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Hospital_management_System\Hospital_management_System\App_Data\Lukky.mdf;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT Id, Uname, Email, Mobile FROM dbo.UserTab";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        int serialNumber = 1;

                        while (reader.Read())
                        {
                            HtmlTableRow row = new HtmlTableRow();
                            HtmlTableCell cell;

                            // S/N
                            cell = new HtmlTableCell();
                            cell.InnerText = serialNumber.ToString();
                            row.Cells.Add(cell);

                            // User ID
                            cell = new HtmlTableCell();
                            cell.InnerText = reader["Id"].ToString();
                            row.Cells.Add(cell);

                            // Username
                            cell = new HtmlTableCell();
                            cell.InnerText = reader["Uname"].ToString();
                            row.Cells.Add(cell);

                            // Phone

                            cell = new HtmlTableCell();
                            cell.InnerText = "0" + reader["Mobile"].ToString();
                            row.Cells.Add(cell);

                            // Email
                            cell = new HtmlTableCell();
                            cell.InnerText = reader["Email"].ToString();
                            row.Cells.Add(cell);

                            // Action (Delete Button)
                            cell = new HtmlTableCell();
                            var deleteButton = new Button();
                            deleteButton.Text = "Delete";
                            deleteButton.CssClass = "delete-button";
                            deleteButton.CommandArgument = reader["Id"].ToString();
                            deleteButton.Click += DeleteButton_Click;
                            cell.Controls.Add(deleteButton);
                            row.Cells.Add(cell);





                            // Add the row to the table
                            UserTable.Rows.Add(row);

                            serialNumber++;
                        }
                    }
                }
            }
        }

        private void DeleteUser(string userId)
        {
            // Set your connection string
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Hospital_management_System\Hospital_management_System\App_Data\Lukky.mdf;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "DELETE FROM dbo.UserTab WHERE Id = @Id";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Id", userId);
                    cmd.ExecuteNonQuery();
                }
            }
        }


        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            var deleteButton = (Button)sender;
            string userId = deleteButton.CommandArgument;

            // Add debugging information
            Console.WriteLine($"Delete button clicked for userId: {userId}");

            try
            {
                if (!string.IsNullOrEmpty(userId))
                {
                    // Add debugging information
                    Console.WriteLine($"Deleting user with userId: {userId}");

                    DeleteUser("2");

                    // Optionally, add debugging information
                    Console.WriteLine($"User with userId {userId} deleted successfully.");

                    // Optionally, rebind your data after deletion if needed
                    //BindUserData();
                }
            }
            catch (Exception ex)
            {
                // Log or display the exception details
                Console.WriteLine($"Error deleting user: {ex.Message}");
            }
        }





    }
}
