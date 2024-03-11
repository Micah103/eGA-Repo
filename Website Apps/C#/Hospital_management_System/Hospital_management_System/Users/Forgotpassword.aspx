<%@ Page Title="ForgotPassword" Language="C#" MasterPageFile="~/Users/usermaster.Master" AutoEventWireup="true" CodeBehind="Forgotpassword.aspx.cs" Inherits="Hospital_management_System.Users.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
   <center>
        <h1 style="font-size: xx-large; font-weight: bold; color: #02646F">Forgot Password</h1>
           <div style="background-color: #02646F; border-radius: 15px; padding: 20px; max-width: 400px;">
       <table style="width: 377px; height: 200px; background-color: #02646F; font-size: large; font-weight: bold; color: #FFFFFF;" >
           <tr>
               <td style="width: 121px" align="center">Email</td>
               <td style="width: 188px">
                   <asp:TextBox ID="txt_fpass_Email" runat="server" Width="203px" style="width: 100%; border-radius: 5px; padding: 5px;"></asp:TextBox></td>
           </tr>

           <tr>
               <td style="width: 121px" align="center">Mobile</td>
               <td style="width: 188px">
                   <asp:TextBox ID="txt_fpass_mobile" runat="server" Width="203px" style="width: 100%; border-radius: 5px; padding: 5px;"></asp:TextBox></td>
           </tr>



            <tr>
               <td style="width: 121px" align="center"> Old Password</td>
               <td style="width: 188px">
                   <asp:TextBox ID="txt_fpass_oldpass" TextMode="Password" runat="server" style="width: 100%; border-radius: 5px; padding: 5px;"></asp:TextBox></td>
           </tr>

           
            <tr>
               <td style="width: 121px" align="center"> New Password</td>
               <td style="width: 188px">
                   <asp:TextBox ID="txt_fpass_newpass" TextMode="Password" runat="server" style="width: 100%; border-radius: 5px; padding: 5px;"></asp:TextBox></td>
           </tr>




           <tr>
               <td colspan="2" align="center">
                   <asp:Button ID="btn_fpass" runat="server" Text="Forgot Password" Font-Bold="True" OnClick="btn_fpass_Click" OnClientClick="return validateForgotPasswordForm();"   style="padding: 8px 20px; border-radius: 5px; background-color: #FFFFFF; color: #0000FF;"/>&nbsp&nbsp<asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" Font-Underline="True" OnClick="LinkButton1_Click" style="color: #FFFFFF;" >Sign In</asp:LinkButton></td>
           </tr>
       </table>
</div>
</center>

    <script type="text/javascript">
    function validateForgotPasswordForm() {
        var email = document.getElementById('<%= txt_fpass_Email.ClientID %>').value;
        var mobile = document.getElementById('<%= txt_fpass_mobile.ClientID %>').value;
        var oldPassword = document.getElementById('<%= txt_fpass_oldpass.ClientID %>').value;
        var newPassword = document.getElementById('<%= txt_fpass_newpass.ClientID %>').value;

        if (email === "" || mobile === "" || oldPassword === "" || newPassword === "") {
            alert("Please fill in all the fields.");
            return false;
        }

        return true;
    }
    </script>


</asp:Content>
