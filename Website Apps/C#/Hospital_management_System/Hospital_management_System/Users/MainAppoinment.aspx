﻿<%@ Page Title="Appointments" Language="C#" MasterPageFile="~/Users/usermaster.Master" AutoEventWireup="true" CodeBehind="MainAppoinment.aspx.cs" Inherits="Hospital_management_System.Users.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <div>

        
		
	<div class="about">
	<div class="abt-layer">
		<div class="container">
			<div class="about-main">
				<div class="about-right">
					<h3 class="subheading-w3-agile">Make Appointment</h3>

					<!-- stats -->
					<div class="stats">
						<div class="stats_inner">
							<form action="#" method="post">
								<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>&nbsp&nbsp&nbsp<asp:Label ID="lbl_Appontment_no" runat="server" Text="Label"></asp:Label>
								<asp:DropDownList ID="DropDownList_Section" class="form-control mb-3" runat="server">
									<asp:ListItem Value="Neurology">Neurology</asp:ListItem>
									<asp:ListItem Value="Dentistry">Dentistry</asp:ListItem>
									<asp:ListItem Value="Cardiology">Cardiology</asp:ListItem>
									<asp:ListItem Value="Pediatrics">Pediatrics</asp:ListItem>
									<asp:ListItem Value="Pulmonology">Pulmonology</asp:ListItem>
									<asp:ListItem Value="Ophthalmology"> Ophthalmology</asp:ListItem>
									<asp:ListItem Value="Diagnostics">Diagnostics</asp:ListItem>
								</asp:DropDownList>


								<asp:TextBox ID="txt_Appoint_name" placeholder="Name" class="form-control mb-3" runat="server"></asp:TextBox>
								

								<asp:DropDownList ID="DropDownList_gender" class="form-control mb-3" runat="server">
									<asp:ListItem Value="2">Gender</asp:ListItem>
									<asp:ListItem Value="Male">Male</asp:ListItem>
									<asp:ListItem Value="Female">Female</asp:ListItem>
								</asp:DropDownList>

								<asp:TextBox ID="txt_Apoint_Mobile" class="form-control mb-3" placeholder="Phone"  runat="server"></asp:TextBox>
								
								<asp:TextBox ID="txt_Apoint_Email" class="form-control mb-3" placeholder="Email"  runat="server"></asp:TextBox>
								
								<asp:TextBox ID="datepicke" class="form-control date mb-3"  placeholder="Select Date"  runat="server"></asp:TextBox>
								
								<asp:Button ID="btn_main_appointment_Submit" runat="server" class="btn btn-agile btn-block w-100" Text="Make An Appointment" OnClick="btn_main_appointment_Submit_Click" OnClientClick="return validateAppointmentForm();" />
								
							</form>
						</div>
					</div>
					<!-- //stats -->

				</div>
			</div>
			
		</div>
		</div>
	</div>
	<!--//about-->

    </div>

	<script type="text/javascript">
    function validateAppointmentForm() {
        var section = document.getElementById('<%= DropDownList_Section.ClientID %>').value;
        var name = document.getElementById('<%= txt_Appoint_name.ClientID %>').value;
        var gender = document.getElementById('<%= DropDownList_gender.ClientID %>').value;
        var mobile = document.getElementById('<%= txt_Apoint_Mobile.ClientID %>').value;
        var email = document.getElementById('<%= txt_Apoint_Email.ClientID %>').value;
        var datepicker = document.getElementById('<%= datepicke.ClientID %>').value;

        if (section === "" || name === "" || gender === "2" || mobile === "" || email === "" || datepicker === "") {
            alert("Please fill in all the fields.");
            return false;
        }

        return true;
    }
    </script>


</asp:Content>
