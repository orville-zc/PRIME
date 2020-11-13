﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateNewItem.aspx.cs" Inherits="PRIMEWeb.Inventory.CreateNewItem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>PRIME - Create New Inventory Item</title>
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
        .container {
            background-color: #fff;
            box-shadow: 2px 2px 10px 3px #a8a8a8;
            margin: 15px auto;
            padding: 15px;
        }
        #wrapper-inner, #pnlOrder {
            padding: 30px;
        }
        h1 {
            text-align: center;
            padding: 2rem 0;
        }
        .form-row [class*="col-"] {
            padding: 0 15px;
        }
        .form-group {
            margin-bottom: 2rem;
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
        .form-check-label {
            margin-right: 10px;
        }
        #pnlBtnSales, #divBtnOrder {
            text-align: center;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        #pnlBtnSales input, #pnlBtnSales a, #divBtnOrder input, #divBtnOrder a {
            margin: 0 10px;
        }
    </style>
    <script src="/Script/jquery-3.5.1.min.js"></script>
    <script src="/Script/bootstrap.min.js"></script>
</head>
<body>
    <form id="frmNewSale" runat="server">
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
                        <a class="nav-link" href="/Inventory/">Inventory</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/Equipments/">Equipments</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/Repairs/">Repairs</a>
                    </li>
                </ul>
                <ol class="navbar-collapse breadcrumb">
                    <li class="breadcrumb-item"><a href="/Landing.aspx">Home</a></li>
                    <li class="breadcrumb-item"><a href="/Inventory/">Inventory</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Create New Inventory Item</li>
                </ol>
            </div>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-outline-danger rounded-pill" PostBackUrl="/" />
        </nav>
        <div class="container rounded-lg row justify-content-sm-center">
            <div id="wrapper-inner" class="col-lg-9">
                <h1>Create New Inventory Item</h1>
                <div class="form-row">
                    <div class="col-md-4 form-group">
                        <label class="control-label">Select a product Name :</label>
                        <asp:DropDownList ID="ddlProductName" runat="server" CssClass="custom-select">
                            <asp:ListItem>Select a Product</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-4 form-group">
                        <label class="control-label">Select a Measure :</label>
                        <asp:DropDownList ID="ddlMeasure" runat="server" CssClass="custom-select">
                            <asp:ListItem>Select a Measure</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-4 form-group">
                        <label class="control-label">Description :</label>
                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    
                     <div class="col-md-4 form-group">
                         <label class="control-label">Brand :</label>
                        <asp:TextBox ID="txtBrand" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="col-md-4 form-group">
                        <label class="control-label">Quantity :</label>
                        <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" ></asp:TextBox>
                    </div>
                    <div class="col-md-4 form-group">
                        <label class="control-label">Size :</label>
                        <asp:TextBox ID="txtSize" runat="server" CssClass="form-control" ></asp:TextBox>
                    </div>
                </div>
                
                <div class="form-row">
                    <asp:Panel ID="pnlBtnSales" CssClass="col-md-12" runat="server">
                        <asp:Button ID="btnAddItem" runat="server" aria-label="Add an Order" CssClass="btn btn-outline-primary" Text="Add an Item" UseSubmitBehavior="False" OnClick="btnAddItem_Click" />
                        <a class="btn btn-outline-primary" href="/Inventory/CreateNewItem.aspx" role="button" aria-label="Clear Form">Clear Form</a>
                        <a class="btn btn-outline-primary" href="/Inventory/" role="button" aria-label="Cancel Creating Inventory Item">Cancel</a>
                    </asp:Panel>
                </div>
            </div>
            <asp:ScriptManager ID="smgOrder" runat="server"></asp:ScriptManager>
            
        </div>
    </form>
</body>
</html>