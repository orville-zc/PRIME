﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PRIMELibrary.EquipmentDataSetTableAdapters;
using PRIMELibrary;
using System.Data;

namespace PRIMEWeb.Customers
{
    public partial class EditEquipment : System.Web.UI.Page
    {
        static EquipmentDataSet dsEquipment;
        private static int id = -1;

        static EditEquipment()
        {
            dsEquipment = new EquipmentDataSet();
            equipmentCRUDTableAdapter daEquipment = new equipmentCRUDTableAdapter();

            try
            {
                daEquipment.Fill(dsEquipment.equipmentCRUD);
            }
            catch { }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["ID"] != null) // Request the cookies which contaions the ID Of thr record that was carried over from the index page
                lblStatus.Text = "ID: " + Request.Cookies["ID"].Value;

            id = Convert.ToInt32(Request.Cookies["ID"].Value);

            if (id != -1)
            {
                try
                {
                    DataRow equipment = dsEquipment.equipmentCRUD.FindByID(id); // Find the related Record and fill the fields in the page with the data

                    if (equipment != null)
                    {
                        this.txtModel.Text = equipment.ItemArray[1].ToString();
                        this.txtSerialNum.Text = equipment.ItemArray[2].ToString();
                        this.ddlCustomer.SelectedValue = equipment.ItemArray[3].ToString();
                        this.ddlType.SelectedValue = equipment.ItemArray[4].ToString();
                        this.ddlManufacturer.SelectedValue = equipment.ItemArray[5].ToString();
                    }
                    else
                    {
                        lblStatus.Text = "Please Try Again";
                    }
                }
                catch
                {
                    lblStatus.Text = "Database Error";
                }
            }
        }

        //Edit Button click
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //check a record has been selected
            if (id != -1)
            {
                try
                {
                    //DataRow equipment = dsEquipment.equipmentCRUD.FindByID(id); // find the related Record

                    //update record with user's input
                    dsEquipment.equipmentCRUD.FindByID(id).Model = txtModel.Text.ToString();
                    dsEquipment.equipmentCRUD.FindByID(id).Serial = txtSerialNum.Text.ToString();
                    dsEquipment.equipmentCRUD.FindByID(id).CustomerID = Convert.ToInt32(ddlCustomer.SelectedValue);
                    dsEquipment.equipmentCRUD.FindByID(id).EquipmentID = Convert.ToInt32(ddlType.SelectedValue);
                    dsEquipment.equipmentCRUD.FindByID(id).ManufacturerID = Convert.ToInt32(ddlManufacturer.SelectedValue);
                    Save();
                }
                catch { lblStatus.Text = "Unable to Update Record"; }
            }
        }

        private void Save()
        {
            equipmentCRUDTableAdapter daEquipment = new equipmentCRUDTableAdapter();
            try
            {
                daEquipment.Update(dsEquipment.equipmentCRUD); // Call update method on the service adapter so it updates the table in memory ( All changes made are applied - CRUD)
                dsEquipment.AcceptChanges(); // Call accept method on the dataset so it update the chanmges to the database

                lblStatus.Text = "Record Successfully Updated";
            }
            catch
            {
                dsEquipment.RejectChanges();
                lblStatus.Text = "Unable to Update Record";
            }
            //Response.Redirect("Equipments.aspx"); // Redirect the user to Edit page on btn click
        }
    }
}