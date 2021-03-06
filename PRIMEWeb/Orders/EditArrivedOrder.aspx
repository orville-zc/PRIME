﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditArrivedOrder.aspx.cs" Inherits="PRIMEWeb.Orders.EditArrivedOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PRIME - Edit Arrived Order Form</title>
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
        .col-md-12 {
            text-align: center;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .container {
            background-color: #fff;
            box-shadow: 2px 2px 10px 3px #a8a8a8;
            margin: 15px auto;
            padding: 15px;
        }
        #wrapper-inner {
            padding: 30px;
        }
        h1 {
            text-align: center;
            padding: 2rem 0;
        }
        .form-row .col-md-6 {
            padding: 0 15px;
        }
        .form-group {
            margin-bottom: 3rem;
        }
        .lbl-help {
            display: inline-block;
            margin: 5px 0;
        }
        .form-control {
            border: none;
            border-bottom: 2px solid #6c757d;
            -webkit-box-shadow: none;
            box-shadow: none;
            border-radius: 0;
            height: 45px;
        }
        .col-md-12 {
            text-align: center;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .col-md-12 input, .col-md-12 a {
            margin: 0 10px;
        }
    </style>
    <link href="/CSS/wcag.css" rel="stylesheet" />
    <script src="/Script/wcag.js"></script>
</head>
<body style="height: 1582px">
    <form id="frmNewOrderForm" runat="server" class="was-validated">
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
                    <li class="breadcrumb-item"><a href="/Orders/">Orders</a></li>
                    <li class="breadcrumb-item"><a href="/Orders/ArrivedOrderDefaultPage.aspx">Arriving Orders</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Edit Arrived Order</li>
                </ol>
            </div>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-outline-danger rounded-pill" OnClick="btnLogout_Click" />
        </nav>
        <div class="container rounded-lg row justify-content-sm-center" style="height: 1258px">
            <div id="wrapper-inner" class="col-lg-9 rounded-lg">
                <h1>Edit Arrived Order</h1>
                <div class="form-group form-control form-check form-check-inline">
                    &nbsp;
                    <input type="checkbox" onclick="SwitchCss(this)" class="form-check-input" id="chbSwitch" name="cnbSwitch" />
                    <label class="form-check-label" for="cnbSwitch">Check this to switch to high contrast design</label>
                    &nbsp;&nbsp;|&nbsp;&nbsp;
                    <asp:CheckBox ID="cboHelp" runat="server" CssClass="form-check-input" AutoPostBack="True" OnCheckedChanged="cboHelp_CheckedChanged" />
                    <label class="form-check-label" for="cboHelp">Check this to display detailed instruction on this form</label>
                </div>
                <div class="form-row">
                    <div class="col-md-6 form-group">
                        <asp:Label class="context_help" runat="server">ID</asp:Label>
                        <asp:TextBox ID="txtID" runat="server" placeholder="ID" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        <asp:Label ID="lblIdHelp" runat="server" Text="ID from database. Cannot be changed." CssClass="lbl-help" Visible="False"></asp:Label>
                    </div>
                    </div>
                <div class="form-row">
                    <div class="col-md-6 form-group">
                        <asp:Label class="context_help" runat="server">Invoice Number: </asp:Label>
                        <asp:TextBox ID="txtInvoiceNumber" runat="server" placeholder="Eg. 5432" CssClass="form-control" required="required"></asp:TextBox>
                        <div class="invalid-feedback">Please input invoice number number</div>
                        <asp:Label ID="lblInvoiceNumlHelp" runat="server" Text="Invoice number from package" CssClass="lbl-help" Visible="False"></asp:Label>
                        </div>
                   <div class="col-md-6 form-group">
                        <asp:Label class="context_help" runat="server">Arrive Date:</asp:Label>
                        <asp:TextBox ID="txtArriveDate" runat="server" placeholder="Choose the date" CssClass="form-control" TextMode="Date" ReadOnly="false"></asp:TextBox>
                        <asp:Label ID="lblArriveDateHelp" runat="server" Text="Select the date from calendar" CssClass="lbl-help" Visible="False"></asp:Label>
                    </div>
                        </div>    
                <div class="form-row">
                        <div class="col-md-6 form-group">
                            <label class="control-label">Inventory ID:</label>
                            <asp:DropDownList ID="ddlInventoryID" runat="server" CssClass="custom-select"  DataTextField="ProductName" DataValueField="id" DataSourceID="ods_IDS">
                                <asp:ListItem>Select Inventory ID...</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label ID="lblInventoryIDHelp" runat="server" Text="Select the Inventory ID from Dropdown List" CssClass="lbl-help" Visible="False"></asp:Label>
                        </div>
                      <div class="col-md-6 form-group">
                        <asp:Label class="context_help" runat="server">Number in Order</asp:Label>
                        <asp:TextBox ID="txtNumberInOrder" runat="server" placeholder="eg. 55453" CssClass="form-control" ReadOnly="false"></asp:TextBox>
                        <asp:Label ID="lblNumberInOrderHelp" runat="server" Text="Number from old system" CssClass="lbl-help" Visible="False"></asp:Label>
                    </div>
                        </div>
                    
                    <div class="form-row">
                    <div class="col-md-6 form-group">
                        <asp:Label class="context_help" runat="server">Price: </asp:Label>
                        <asp:TextBox ID="txtPrice" runat="server" placeholder="Select date" CssClass="form-control"  required="required"></asp:TextBox>
                        <div class="invalid-feedback">Select Date: </div>
                        <asp:Label ID="lblDateHelp" runat="server" Text="Open the calendar by tapping the textbox and select the date" CssClass="lbl-help" Visible="False"></asp:Label>
                    </div>
                        
                         <div class="col-md-6 form-group">
                            <label class="control-label">Product Order:</label>
                            <asp:DropDownList ID="ddlProdOrderID" runat="server" CssClass="custom-select"  DataTextField="pordNumber" DataValueField="id" DataSourceID="ObjectDataSource1">
                                <asp:ListItem>Select Product Order ID...</asp:ListItem>
                            </asp:DropDownList>
                             <asp:Label ID="lblProdOrderIDHelp" runat="server" Text="Select the Product Order ID from Dropdown List  " CssClass="lbl-help" Visible="False"></asp:Label>
                        </div>
                        </div>
                <asp:Label ID="lblStatus" runat="server"></asp:Label>
                        <div class="form-row">
                    <div class="col-md-12">
                       <asp:Button ID="btnCreate" runat="server" aria-label="Update Order" CssClass="btn btn-outline-primary" Text="Update Order" OnClick="btnUpdate_Click"/>
                        <asp:Button ID="btnClearOrder" runat="server" aria-label="Clear Order Form" CssClass="btn btn-secondary btn-dependent-page" Text="Clear Form" UseSubmitBehavior="False" OnClick="btnClear_Click" />
                        &nbsp;<a class="btn btn-danger" href="/Orders/ArrivedOrderDefaultPage.aspx" role="button" aria-label="Cancel Editing Order">Cancel</a>
                        
                    </div>
                </div>
                </div>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PRIMELibrary.OrdersDataSetTableAdapters.prod_order1TableAdapter"></asp:ObjectDataSource>
                </div>
                <br />  
                
                
                <asp:Panel ID="pnlOrderHelp" runat="server" Visible="False">
                        <p>Notes:</p>
                        <p>Edit the Order form and click the "Update Order" button to apply changes to the database </p>
                        <p>Click the "Clear Form" button to remove all the text from textboxes.</p>
                        <p>Click the "Cancel" button to cancel creating the Order and go to the Order page.</p>
                </asp:Panel>
            
            <asp:ObjectDataSource ID="ods_IDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PRIMELibrary.OrdersDataSetTableAdapters.on_order1IDSTableAdapter"></asp:ObjectDataSource>
        
    </form>
</body>
</html>

