using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Hospital_management_System.Users
{
    public partial class Doctor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int numberOfUsers = GetNumberOfUsers();
                int numberOfAppointments = GetNumberOfAppointmentsWithNullStatus();

                // Find controls in the Master Page's hierarchy
                ContentPlaceHolder contentPlaceHolder = (ContentPlaceHolder)Master.FindControl("ContentPlaceHolder100");
                if (contentPlaceHolder != null)
                {
                    HtmlGenericControl userCountElement = (HtmlGenericControl)contentPlaceHolder.FindControl("UserCount");
                    HtmlGenericControl appointCountElement = (HtmlGenericControl)contentPlaceHolder.FindControl("AppointCount");
                    HtmlGenericControl historyCountElement = (HtmlGenericControl)contentPlaceHolder.FindControl("HistoryCount");

                    if (userCountElement != null)
                    {
                        userCountElement.InnerText = numberOfUsers.ToString();
                    }
                    else
                    {
                        Response.Write("UserCount control not found.");
                    }

                    if (appointCountElement != null)
                    {
                        appointCountElement.InnerText = numberOfAppointments.ToString();
                    }
                    else
                    {
                        Response.Write("AppointCount control not found.");
                    }

                    if (historyCountElement != null)
                    {
                        historyCountElement.InnerText = GetNumberOfHistoryItemsWithNotNullStatus().ToString();
                    }
                    else
                    {
                        Response.Write("HistoryCount control not found.");
                    }
                }
                else
                {
                    Response.Write("ContentPlaceHolder100 control not found.");
                }
            }
            catch (Exception ex)
            {
                Response.Write("Exception: " + ex.Message);
            }
        }


        private int GetNumberOfUsers()
        {
            int count = 0;

            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Hospital_management_System\Hospital_management_System\App_Data\Lukky.mdf;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM dbo.UserTab", connection))
                {
                    count = (int)command.ExecuteScalar();
                }

                connection.Close();
            }

            return count;
        }

        private int GetNumberOfAppointmentsWithNullStatus()
        {
            int count = 0;

            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Hospital_management_System\Hospital_management_System\App_Data\Lukky.mdf;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM dbo.AppontTab WHERE Status IS NULL", connection))
                {
                    count = (int)command.ExecuteScalar();
                }

                connection.Close();
            }

            return count;
        }

        private int GetNumberOfHistoryItemsWithNotNullStatus()
        {
            int count = 0;

            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Hospital_management_System\Hospital_management_System\App_Data\Lukky.mdf;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM dbo.AppontTab WHERE Status IS NOT NULL", connection))
                {
                    count = (int)command.ExecuteScalar();
                }

                connection.Close();
            }

            return count;
        }
    }
}
