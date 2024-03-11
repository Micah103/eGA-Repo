<%@ Page Title="Doctor" Language="C#" MasterPageFile="~/Users/Custom.Master" AutoEventWireup="true" CodeBehind="Doctor.aspx.cs" Inherits="Hospital_management_System.Users.Doctor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder100" runat="server">

    <div>
        <br>
        <br>
        <br>
        <br>
        <h1> Admin Dashboard</h1>
        <br>        
        <!-- main image slider container -->
    
   
   <!-- plugins:css -->
   <link rel="stylesheet" href="template/vendors/ti-icons/css/themify-icons.css" />
   <link rel="stylesheet" href="template/vendors/base/vendor.bundle.base.css" />
   <!-- endinject -->

   <link rel="stylesheet" href="template/css/style.css" />
 
   <!-- partial -->
   <div class="main-panel">
     <div class="content-wrapper">
       <div class="row">
         <div class="col-md-4 grid-margin stretch-card">
           <div class="card">
             <a href="Patients.aspx"></a>
             <div class="card-body">
               <p class="card-title text-md-center text-xl-left">
                 Patients
               </p>
               <div
                 class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center"
               >
                 <h3 id="AppointCount" class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0" runat="server">
                 </h3>
                 <i
                   class="ti-calendar icon-md text-muted mr-md-3 mb-0 mb-md-3 mb-xl-0"
                 ></i>
               </div>
               
             </div>
           </div>
         </div>
         <div class="col-md-4 grid-margin stretch-card">
           <div class="card">
             <a href="Users.aspx"></a>
             <div class="card-body">
               <p class="card-title text-md-center text-xl-left">Users</p>
               <div
                 class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center"
               >
                 <h3 id="UserCount" class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0" runat="server">
                 </h3>
                 <i
                   class="ti-user icon-md text-muted mr-md-3 mb-0 mb-md-3 mb-xl-0"
                 ></i>
               </div>
               
             </div>
           </div>
         </div>
         <div class="col-md-4 grid-margin stretch-card">
           <div class="card">
             <a href="History.aspx"></a>
             <div class="card-body">
               <p class="card-title text-md-center text-xl-left">History</p>
               <div
                 class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center"
               >
                 <h3 id="HistoryCount" class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0" runat="server">
                 </h3>
                 <i
                   class="ti-agenda icon-md text-muted mr-md-3 mb-0 mb-md-3 mb-xl-0"
                 ></i>
               </div>
               
             </div>
           </div>
         </div>
       </div>
     </div>
   </div>

   <!-- plugins:js -->
   <script src="template/vendors/base/vendor.bundle.base.js"></script>
   <script src="template/vendors/chart.js/Chart.min.js"></script>
       <!-- main image slider container -->
   <!-- end of main image slider container -->

        <!-- Add your specific content for the doctor page here -->
    </div>
</asp:Content>
