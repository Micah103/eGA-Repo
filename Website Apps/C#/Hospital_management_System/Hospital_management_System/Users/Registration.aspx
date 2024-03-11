<%@ Page Title="Registration" Language="C#" MasterPageFile="~/Users/usermaster.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Hospital_management_System.Users.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br>
    <br>
    <br>
    <br>

     <center>
        <h1 style="font-size: xx-large; font-weight: bold; color: #02646F">Sign Up</h1>
      <div style="background-color:#02646F; box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); border-radius: 15px; padding: 20px; max-width: 500px;">
       <table style="width: 400px; height: 200px; background-color: #02646F; font-size: large; font-weight: bold; color: #FFFFFF;" >
           <tr>
               <td style="width: 172px; display: none;" align="center">Username</td>
                <td style="width: 188px; display: none;">
                    <asp:Label ID="lbl_rid" runat="server" Text="Label"></asp:Label>
                </td>

                  <%-- <asp:TextBox ID="txt_signup_username" runat="server" Width="225px"></asp:TextBox>--%></td>
           </tr>

             <tr>
               <td style="width: 172px" align="center">Username</td>
               <td style="width: 188px">
                   <asp:TextBox ID="txt_signup_username" runat="server" style="width: 100%; border-radius: 5px; padding: 5px;"></asp:TextBox></td>
           </tr>

            <tr>
               <td style="width: 172px" align="center">Email</td>
               <td style="width: 188px">
                   <asp:TextBox ID="txt_signup_email" runat="server" style="width: 100%; border-radius: 5px; padding: 5px;"></asp:TextBox></td>
           </tr>

            <tr>
               <td style="width: 172px" align="center">Mobile No</td>
               <td style="width: 188px">
                   <asp:TextBox ID="txt_signup_mobile" runat="server" style="width: 100%; border-radius: 5px; padding: 5px;"></asp:TextBox></td>
           </tr>

            <tr>
               <td style="width: 172px" align="center" >Password</td>
               <td style="width: 188px">
                   <asp:TextBox ID="txt_signup_pass" TextMode="Password" runat="server" style="width: 100%; border-radius: 5px; padding: 5px;"></asp:TextBox></td>
           </tr>


             <tr>
               <td style="width: 172px" align="center" > Re-Password</td>
               <td style="width: 188px">
                   <asp:TextBox ID="txt_signup_cpass" TextMode="Password" runat="server" style="width: 100%; border-radius: 5px; padding: 5px;" ></asp:TextBox></td>
           </tr>



            <tr>
               <td  style="height: 54px" colspan="2" align="center">
                   <asp:CheckBox ID="CheckBox1" runat="server" />Remember me
                &nbsp&nbsp
                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" Font-Underline="True" OnClick="LinkButton1_Click" style="color: #FFFFFF;">Sign In</asp:LinkButton></td>
               
           </tr>

           <tr>
               <td  align="center" colspan="2">
                   <asp:Button ID="btn_login_b" runat="server" Text="Registration" Font-Bold="True" OnClick="btn_login_b_Click" OnClientClick="return validateRegistrationForm();"  style="padding: 8px 20px; border-radius: 5px; background-color: #FFFFFF; color: #0000FF;" />&nbsp&nbsp&nbsp<asp:LinkButton ID="LinkButton2" runat="server" Font-Bold="True" Font-Underline="True" OnClick="LinkButton2_Click" style="color: #FFFFFF;">Change Password</asp:LinkButton></td>
           </tr>
       </table>
</div>

   </center>
    <br>
    <br>
    <br>
    <br>


    <script type="text/javascript">
    function validateRegistrationForm() {
        var username = document.getElementById('<%= txt_signup_username.ClientID %>').value;
        var email = document.getElementById('<%= txt_signup_email.ClientID %>').value;
        var mobile = document.getElementById('<%= txt_signup_mobile.ClientID %>').value;
        var password = document.getElementById('<%= txt_signup_pass.ClientID %>').value;
        var confirmPassword = document.getElementById('<%= txt_signup_cpass.ClientID %>').value;

        if (username === "" || email === "" || mobile === "" || password === "" || confirmPassword === "") {
            alert("Please fill in all the fields.");
            return false;
        }

        if (password !== confirmPassword) {
            alert("Passwords do not match.");
            return false;
        }

        return true;
    }
    </script>

</asp:Content>
