<%@ Page Title="Loginpage" Language="C#" MasterPageFile="~/Users/usermaster.Master" AutoEventWireup="true" CodeBehind="Loginpage.aspx.cs" Inherits="Hospital_management_System.Users.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    
    <br>
    <br>
    <br>
    <br>

   <center>
        <h1 style="font-size: 36px; font-weight: bold; color: #02646F; text-align: center;">Sign In</h1>
    <div style="background-color: #02646F; border: #000000; border-radius: 15px; padding: 20px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); max-width: 400px;">
    <table style="width: 100%; font-size: 18px; font-weight: bold; color: #FFFFFF; ">
            <tr>
                <td style="width: 30%; text-align: right;">Username</td>
                <td style="width: 70%;">
                    <asp:TextBox ID="txt_login_username" runat="server" style="width: 100%; border-radius: 5px; padding: 5px;"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;">Password</td>
                <td>
                    <asp:TextBox ID="txt_login_pass" runat="server" TextMode="Password" style="width: 100%; border-radius: 5px; padding: 5px;"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <asp:CheckBox ID="CheckBox1" runat="server" style="color: #FFFFFF;" />Remember me
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <asp:Button ID="btn_login_b" runat="server" Text="Login" Font-Bold="True" OnClick="btn_login_b_Click" OnClientClick="return validateForm();" style="padding: 8px 20px; border-radius: 5px; background-color: #FFFFFF; color: #0000FF;" />&nbsp;&nbsp;<asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" Font-Underline="True" OnClick="LinkButton1_Click" style="color: #FFFFFF;">Sign Up</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
</center>

    <br>
    <br>
    <br>
    <br>

    
    <script type="text/javascript">
        function validateForm() {
            var username = document.getElementById('<%= txt_login_username.ClientID %>').value;
    var password = document.getElementById('<%= txt_login_pass.ClientID %>').value;

            if (username === "" || password === "") {
                alert("Please enter both username and password.");
                return false;
            }

            // Additional check for admin credentials
            if (username === "admin" && password === "admin123") {
                // Redirect to doctor.aspx
                window.location.href = "doctor.aspx";
                return false; // Prevent form submission
            }

            return true; // Continue with the normal form submission
        }
    </script>


</asp:Content>
