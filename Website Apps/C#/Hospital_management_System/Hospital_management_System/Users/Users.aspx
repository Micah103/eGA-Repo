<%@ Page Title="Users" Language="C#" MasterPageFile="~/Users/Custom.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Hospital_management_System.Users.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder100" runat="server">
    <div>
        <br>
        <br>
        <br>
        <br>

        <h1>Registered Users</h1>
         <br>
         <br>

        <table class="table" runat="server" id="UserTable" style="width: 50%; border-collapse: collapse; border: 1px solid #ddd; margin: auto;">
            <thead>
                <tr>
                    <th style="border: 1px solid #ddd;">S/N</th>
                    <th style="border: 1px solid #ddd;">UserID</th>
                    <th style="border: 1px solid #ddd;">Username</th>
                    <th style="border: 1px solid #ddd;">Phone</th>
                    <th style="border: 1px solid #ddd;">Email</th>
                    <th style="border: 1px solid #ddd;">Action</th>
                </tr>
            </thead>
            <tbody>
        
            </tbody>
        </table>


        <br>
        <br>
    </div>

    
</asp:Content>
