<%@ Page Title="History" Language="C#" MasterPageFile="~/Users/Custom.Master" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="Hospital_management_System.Users.History" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder100" runat="server">
    <div>
        <br>
        <br>
        <br>
        <br>

        <h1>Appointment History</h1>
         <br>
         <br>

         <table class="table" runat="server" id="HistoryTable" style="width: 80%; border-collapse: collapse; border: 1px solid #ddd; margin: auto;">
            <thead>
                <tr>
                    <th style="border: 1px solid #ddd;">S/N</th>
                    <th style="border: 1px solid #ddd;">Appointment</th>
                    <th style="border: 1px solid #ddd;">Name</th>
                    <th style="border: 1px solid #ddd;">Gender</th>
                    <th style="border: 1px solid #ddd;">Phone</th>
                    <th style="border: 1px solid #ddd;">Date</th>
                    <th style="border: 1px solid #ddd;">Status</th> 
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table>

        <br>
        <br>
    </div>
</asp:Content>
