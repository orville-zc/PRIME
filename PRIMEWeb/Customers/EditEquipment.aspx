﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditEquipment.aspx.cs" Inherits="PRIMEWeb.Customers.EditEquipment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PRIME - Create New Equipment</title>
    <link href="/CSS/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
        body {
            background-color: #e0e0e0;
            line-height: 1;
        }
        .breadcrumb, #navbar {
            margin: 10px;
        }
        label {
            width: 100%;
        }
        #btnLogout {
            margin: 0 15px;
            padding: 10px 0;
            width: 130px;
        }
        label{
            width:100%;
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
            margin-top:5px;
        }
        .form-check-label {
            margin-right: 10px;
        }
        #divBtnEquipments {
            text-align: center;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        #divBtnEquipments input, #divBtnEquipments a {
            margin: 0 10px;
        }
    </style>
    <link href="/CSS/wcag.css" rel="stylesheet" />
    <script>
        function SwitchCss(element) {
            var btnDangers = document.getElementsByClassName("btn-danger");
            var btnInfos = document.getElementsByClassName("btn-info");
            var btnInfos = document.getElementsByClassName("btn-info");
            var btnSearch = document.getElementById("btnSearch");
            var btnFilter = document.getElementById("btnFilter");
            var btnCreate = document.getElementById("btnCreate");
            var btnClear = document.getElementById("btnClear");
            var btnLogOut = document.getElementById("btnLogout");
            var btnDependents = document.getElementsByClassName("btn btn-secondary btn-dependent-page");
            var body = document.getElementsByTagName("body");
            var navigation = document.getElementsByTagName("nav");
            var ol = document.getElementsByTagName("ol");
            var container = document.getElementsByClassName("container");
            var table = document.getElementsByClassName("table");

            if (element.checked) {
                btnLogOut.classList.add("btn-logout-high");
                for (var i = 0; i < btnDangers.length; i++) {
                    btnDangers[i].classList.add("btn-danger-high");
                }

                for (var i = 0; i < btnInfos.length; i++) {
                    btnInfos[i].classList.add("btn-info-high");
                }

                for (var i = 0; i < btnDependents.length; i++) {
                    btnDependents[i].classList.add("btn-dependent-high");
                }

                for (var i = 0; i < body.length; i++) {
                    body[i].classList.add("body-high");
                }

                for (var i = 0; i < navigation.length; i++) {
                    navigation[i].classList.add("nav-high");
                }

                for (var i = 0; i < ol.length; i++) {
                    ol[i].classList.add("border-high");
                }

                for (var i = 0; i < container.length; i++) {
                    container[i].classList.add("border-high");
                }

                for (var i = 0; i < table.length; i++) {
                    table[i].classList.add("table-high");
                }

                btnSearch.classList.add("btn-search-high");
                btnFilter.classList.add("btn-search-high");
                btnCreate.classList.add("btn-create-high");
                btnClear.classList.add("btn-clear-high");

            }
            else {
                btnLogOut.classList.remove("btn-logout-high");
                for (var i = 0; i < btnDangers.length; i++) {
                    btnDangers[i].classList.remove("btn-danger-high");
                }

                for (var i = 0; i < btnInfos.length; i++) {
                    btnInfos[i].classList.remove("btn-info-high");
                }

                for (var i = 0; i < btnDependents.length; i++) {
                    btnDependents[i].classList.remove("btn-dependent-high");
                }

                for (var i = 0; i < body.length; i++) {
                    body[i].classList.remove("body-high");
                }

                for (var i = 0; i < navigation.length; i++) {
                    navigation[i].classList.remove("nav-high");
                }

                for (var i = 0; i < ol.length; i++) {
                    ol[i].classList.remove("border-high");
                }

                for (var i = 0; i < container.length; i++) {
                    container[i].classList.remove("border-high");
                }

                for (var i = 0; i < table.length; i++) {
                    table[i].classList.remove("table-high");
                }

                btnSearch.classList.remove("btn-search-high");
                btnFilter.classList.remove("btn-search-high");
                btnCreate.classList.remove("btn-create-high");
                btnClear.classList.remove("btn-clear-high");

            }
        }
    </script> 
    <%--<script src="/Script/wcag.js"></script>--%>
</head>
<body>
    <form id="frmNewSale" runat="server"  class="was-validated">
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
                    <li class="breadcrumb-item"><a href="/Customers/">Customers</a></li>
                    <li class="breadcrumb-item"><a href="/Customers/Equipments.aspx">Equipments</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Edit Equipment</li>
                </ol>
            </div>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-outline-danger rounded-pill" OnClick="btnLogout_Click" />
        </nav>
        <div class="container rounded-lg row justify-content-sm-center">
            <div id="wrapper-inner" class="col-lg-9">
                <h1><asp:Label ID="lblTitle" runat="server">Edit Equipment</asp:Label></h1>
                <asp:Panel ID="pnlDeleteConfirm" runat="server" CssClass="alert alert-danger" role="alert" Visible="False">
                    <h4 class="alert-heading">Do you really want to delete this equipment?</h4>
                    <hr />
                    <p>The equipment wont be deleted if it has repairs assigned deleted.</p>
                    <p>Check the repair page first.</p>
                    <p>You will not be able to undo the changes.</p>
                    <p>If you are sure, click the "Delete" button.</p>
                    <hr />
                    <a href="/Customers/Equipments.aspx" type="button" class="btn btn-secondary">Cancel</a>
                    <asp:Button ID="btnDeleteConfirm" runat="server" Text="Delete" CssClass="btn btn-danger" OnClick="btnDeleteConfirm_Click" />
                </asp:Panel>
                <asp:Label ID="lblStatus" runat="server"></asp:Label>
                <div class="form-group form-control form-check form-check-inline">
                    &nbsp;
                    <input type="checkbox" onclick="SwitchCss(this)" class="form-check-input" id="chbSwitch" name="cnbSwitch" />
                    <label class="form-check-label" for="cnbSwitch">Check this to switch to high contrast design.</label>
                    &nbsp;&nbsp;|&nbsp;&nbsp;
                    <asp:CheckBox ID="cboHelp" runat="server" CssClass="form-check-input" AutoPostBack="True" OnCheckedChanged="cboHelp_CheckedChanged" />
                    <label class="form-check-label" for="cboHelp">Check this to display detailed instruction on this form.</label>
                </div>
                <div class="form-row">
                    <div class="col-md-6 form-group">
                        <asp:Label class="context_help" runat="server">ID</asp:Label>
                        <asp:TextBox ID="txtID" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                        <asp:Label ID="lblIdHelp" runat="server" Text="The equpment's ID. It was automatically generated by the system. You cannot edit it" CssClass="lbl-help" Visible="False"></asp:Label>
                    </div>
                    <div class="col-md-6 form-group">
                        <asp:Label class="context_help" runat="server">Model</asp:Label>
                        <asp:TextBox ID="txtModel" runat="server" CssClass="form-control" placeholder="Model" required="required"></asp:TextBox>
                        <div class="invalid-feedback">Please input equipment's model</div>
                        <asp:Label ID="lblModelHelp" runat="server" Text="Input the equipment model (Eg. 20in Cordless)." CssClass="lbl-help" Visible="False"></asp:Label>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 form-group">
                        <asp:Label class="context_help" runat="server">Serial</asp:Label>
                        <asp:TextBox ID="txtSerialNum" runat="server" CssClass="form-control" placeholder="Serial Number" required="required"></asp:TextBox>
                        <div class="invalid-feedback">Please input equipment's serial number</div>
                        <asp:Label ID="lblSerialHelp" runat="server" Text="Input the equipment serial numer (Eg. 3971462)." CssClass="lbl-help" Visible="False"></asp:Label>
                    </div>
                    <div class="col-md-6 form-group">
                        <asp:Label class="context_help" runat="server">Manufacturer</asp:Label>
                        <asp:DropDownList ID="ddlManufacturer" runat="server" CssClass="custom-select" AppendDataBoundItems="True" DataSourceID="odsManufacturer" DataTextField="Manufacturer" DataValueField="ID">
                            <asp:ListItem >Select Manufacturer</asp:ListItem>
                        </asp:DropDownList>
                        <div class="invalid-feedback">Please select the manufacturer</div>
                        <asp:Label ID="lblManufacturer" runat="server" Text="Select the mafucturer of the equipment from drop down list." CssClass="lbl-help" Visible="False"></asp:Label>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 form-group">
                        <asp:Label class="context_help" runat="server">Type</asp:Label>
                        <asp:DropDownList ID="ddlType" runat="server" CssClass="custom-select" AppendDataBoundItems="True" DataSourceID="odsType" DataTextField="Type" DataValueField="ID">
                            <asp:ListItem >Select Type</asp:ListItem>
                        </asp:DropDownList>
                        <div class="invalid-feedback">Please select the equipment type</div>
                        <asp:Label ID="lblType" runat="server" Text="Select the equipment type from the drop down list." CssClass="lbl-help" Visible="False"></asp:Label>
                    </div>
                    <div class="col-md-6 form-group">
                        <asp:Label class="context_help" runat="server">Customer</asp:Label>
                        <asp:DropDownList ID="ddlCustomer" runat="server" CssClass="custom-select" AppendDataBoundItems="True" DataSourceID="odsCustomer" DataTextField="Customer" DataValueField="ID">
                            <asp:ListItem >Select Customer</asp:ListItem>
                        </asp:DropDownList>
                        <div class="invalid-feedback">Please select the customer</div>
                        <asp:Label ID="lblCustomer" runat="server" Text="Select the full name of the customer the equipment belongs to." CssClass="lbl-help" Visible="False"></asp:Label>
                    </div>
                </div>
                <br />
                <asp:Label ID="Label1" runat="server"></asp:Label>
                <div class="form-row">
                    <div runat="server" id="divBtnEquipments" class="col-md-12">
                        <asp:Button ID="btnCreate" runat="server" aria-label="Update Equipment" CssClass="btn btn-outline-primary" Text="Update Equipment" OnClick="btnUpdate_Click" />
                        <a class="btn btn-danger" href="/Customers/Equipments.aspx" role="button" aria-label="Cancel Editing Equipment">Cancel</a>
                    </div>
                </div>
                <asp:Panel ID="pnlEquipmentsHelp" runat="server" Visible="False">
                        <p>Notes:</p>
                        <p>Edit the fields you want to update and click the "Update Customer" button to apply changes to the database.</p>
                        <p>You will be notified of the success or failure of the operation</p>
                        <p>Click the "Cancel" button to cancel editing the equipment and go to the Equipment page.</p>
                    </asp:Panel>
                
                <asp:ObjectDataSource ID="odsType" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PRIMELibrary.EquipmentDataSetTableAdapters.equip_typeTableAdapter"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="odsCustomer" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PRIMELibrary.EquipmentDataSetTableAdapters.customerTableAdapter"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="odsManufacturer" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PRIMELibrary.EquipmentDataSetTableAdapters.manufacturerTableAdapter"></asp:ObjectDataSource>
            </div>
        </div>
    </form>
</body>
</html>
