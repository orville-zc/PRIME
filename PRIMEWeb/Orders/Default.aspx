﻿    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PRIMEWeb.Orders.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>PRIME - Orders</title>
    <link href="/CSS/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
        body {
            background-color: #e0e0e0;
            line-height: 1;
        }
        .breadcrumb, #navbar {
            margin: 10px;
        }
        #btnLogout {
            margin: 0 15px;
            padding: 10px 0;
            width: 130px;
        }
        label{
            width:100%;
        }
        .form-control, .custom-select {
            border: none;
            border-bottom: 2px solid #6c757d;
            -webkit-box-shadow: none;
            box-shadow: none;
            border-radius: 0;
            height: 45px;
            padding: 0.375rem 0.75rem;
        }
        .container {
            background-color: #fff;
            box-shadow: 2px 2px 10px 3px #a8a8a8;
            margin: 15px auto;
            padding: 15px;
        }
        h1 {
            text-align: center;
            padding: 10px 0;
        }
        .table {
            margin: 30px auto 0 auto;
        }
        .table td, .table th {
            text-align: center;
            vertical-align: middle;
        }
        td .btn {
            width: 80px;
        }
        .btn-dark
        {
            margin-right : 5px;
        }
    </style>
    <script src="/Script/jquery-3.5.1.min.js"></script>
    <script src="/Script/bootstrap.min.js"></script>
    <link href="/CSS/wcag.css" rel="stylesheet" />
    <script src="/Script/wcag.js"></script>
</head>
<body>
    <form id="frmOrders" runat="server">
        <nav class="navbar navbar-expand-lg navbar-light bg-light" aria-label="breadcrumb">
            <a class="navbar-brand" href="/Landing.aspx">PRIME</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav" id="navbar">
                    <li class="nav-item">
                        <a class="nav-link" href="/Customers/">Customers</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/Sales/">Sales</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/Repairs/">Repairs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/Inventory/">Inventory</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/Orders/">Orders</a>
                    </li>
                </ul>
                <ol class="navbar-collapse breadcrumb">
                    <li class="breadcrumb-item"><a href="/Landing.aspx">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Orders</li>
                </ol>
            </div>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-outline-danger rounded-pill" OnClick="btnLogout_Click" />
        </nav>
             <div class="container rounded-lg">
            <div id="wrapper" class="row justify-content-sm-center">
                <div id="wrapper-inner" class="col-lg-9 rounded-lg">
                    <h1>Orders</h1>
                    <div class="form-group form-control form-check form-check-inline">
                        &nbsp;
                        <input type="checkbox" onclick="SwitchCss(this)" class="form-check-input" id="chbSwitch" name="cnbSwitch" />
                        <label class="form-check-label" for="cnbSwitch">Check this to switch to high contrast design.</label>
                    </div>
                    <button id="btnFilter" class="btn btn-secondary" type="button" data-toggle="collapse" data-target="#collapseFilter" aria-expanded="false" aria-controls="collapseFilter" aria-label="Filter Customers">
                        Filter Orders
                    </button>
                    <asp:Button ID="btnCreate" runat="server" CssClass="btn btn-secondary" aria-label="Create New Order Form" Text="Create New Order Form" PostBackUrl="/Orders/NewOrderForm1.aspx" />
                  <asp:Button ID="btnArrivingOrders" runat="server" CssClass="btn btn-secondary btn-dependent-page" aria-label="Arriving Orders Page" Text="Arriving Orders" PostBackUrl="/Orders/ArrivedOrderDefaultPage.aspx" />
                    <div class="collapse" id="collapseFilter">
                        <div class="card card-body bg-light">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">Product Number:</label>
                                        <asp:TextBox ID="txtProdNumber" runat="server" CssClass="form-control"></asp:TextBox>
                                       
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">Date Ordered:</label>
                                        <asp:TextBox ID="txtDateOrdered" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                       
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-6 form-group">
                        
                         <asp:CheckBox ID="cbo_Paid" runat="server" CssClass="form-check-input" AutoPostBack="False"  />
                    
                        <label class="form-check-label" for="cboHelp">Check this to see what orders are paid</label>
                        <asp:Label ID="lblPaidHelp" runat="server" Text="Check this checkbox if order is paid" CssClass="lbl-help" Visible="False"></asp:Label>
                    </div>
                                 <div class="col-md-6 form-group">
                        
                         <asp:CheckBox ID="cbo_UnPaid" runat="server" CssClass="form-check-input" AutoPostBack="False"  />
                    
                        <label class="form-check-label" for="cboHelp">Check this to see what orders are unpaid</label>
                        <asp:Label ID="lblHelpUnPaid" runat="server" Text="Check this to see what orders are unpaid" CssClass="lbl-help" Visible="False"></asp:Label>
                    </div>
                                </div>
                                
                                <div class="auto-style1">
                                    <asp:Button ID="btnSearch" runat="server" aria-label="Apply Filter" CssClass="btn btn-outline-secondary" Text="Apply Filter" OnClick="btnSearch_Click" />
                                    <input id="btnClear" type="reset" value="Clear Filter" class="btn btn-outline-secondary" aria-label="Clear Filter"/>
                                </div>
                            </div>
                        </div>
                    
                    <br />
                    
                    <asp:ScriptManager ID="smgOrder" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="upnOrder" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lblStatus" runat="server"></asp:Label>
                            <asp:GridView ID="gvOrders" runat="server" CssClass="table" GridLines="None" OnRowDataBound="gvOrders_RowDataBound">
                            </asp:GridView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
