﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using PRIMELibrary;
using PRIMELibrary.RepairsDataSetTableAdapters;
namespace PRIMEWeb.Repairs
{
    public partial class Default : System.Web.UI.Page
    {
        // Static Dataset so all users see the same data ( IF some one deletes one record everyone sees that change )
        static RepairsDataSet RepairsDataSet;
        private static DataRow[] rows; // Data rows to load more than one record ( doesnt need to be static ) // Not Sure


        static Default()
        {
            RepairsDataSet = new RepairsDataSet();
            RepairLookUpTableAdapter daRepair = new RepairLookUpTableAdapter();


            try
            {
                daRepair.Fill(RepairsDataSet.RepairLookUp);
            }
            catch { }
        }

        private static int id = -1;

        protected void Page_Load(object sender, EventArgs e)
        {
            RepairLookUpTableAdapter daRepair = new RepairLookUpTableAdapter();
            RepairsDataSet.Reset();
            daRepair.Fill(RepairsDataSet.RepairLookUp);

            rows = RepairsDataSet.RepairLookUp.Select(); //get records
            DisplayRepairTable();
        }

        // Edit btn clcik
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            // Get the button that raised the event
            Button btn = (Button)sender;

            //Get the row that contains this button
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            //Get rowindex
            int rowindex = gvr.RowIndex;

            this.Label1.Text = rowindex.ToString();

            // Not too secure sending value through query string
            //Response.Redirect("EditService.aspx?ID=" + GridView1.Rows[e.NewEditIndex].Cells[1].Text

            //Send Id using cookie, more seecure I presume
            HttpCookie cID = new HttpCookie("ID"); // Cokkie variable named cID to hold a value 
            cID.Value = GridView1.Rows[rowindex].Cells[1].Text;
            Response.Cookies.Add(cID);
            Response.Redirect("EditRepair.aspx"); // Redirect the user to Edit page on btn click


        }

        // Delete btn click
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            // Get the button that raised the event
            Button btn = (Button)sender;

            ////Get the row that contains this button
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            ////Get rowindex
            int rowindex = gvr.RowIndex;

            this.Label1.Text = rowindex.ToString();

            id = Convert.ToInt32(GridView1.Rows[rowindex].Cells[1].Text);

            if (id != 1)
            {
                try
                {
                    DataRow record = RepairsDataSet.RepairLookUp.FindByid(id); // Find and add the record to tbe record variable

                    record.Delete(); // Deletes the record in m,emory


                    // Add logic that seperates data into diifrent table update statement


                    RepairLookUpTableAdapter daRepair = new RepairLookUpTableAdapter(); // table adapter to Repair table (Repair adapter)
                    //daRepair.Update(record); // Call update method on the Repair adapter so it updates the table in memory ( All changes made are applied - CRUD)
                    RepairsDataSet.AcceptChanges(); // Call accept method on the dataset so it update the chanmges to the database
                    Label1.Text = "deleted";

                    //Refresh the page to show the record being deleted
                    Response.Redirect(Request.RawUrl);

                }
                catch
                {
                    Label1.Text = "not deleted";
                }
            }
        }

        protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e) // Method adding the btns to the table
        {
            try // if the table has no row
            {
                if (e.Row.RowIndex == -1)
                {
                    e.Row.Cells[6].Text = String.Empty;
                    //Clear the header for Detail Edit Delete btn
                    return;  //skip the header
                }

                // Edit btn
                Button btnEdit = new Button();  //create edit btn
                                                // btnEdits.Add(btnEdit);  //the list index of the button will also be the row index
                btnEdit.CssClass = "btn btn-dark";  //set css class
                btnEdit.Text = "Edit";
                btnEdit.Attributes.Add("aria-label", "Click to go to the edit page for this sale");

                //set aria label
                // btnEdit.Attributes.Add("OnClick", "btnEdit_Click");  //click event handler

                btnEdit.Click += new EventHandler(btnEdit_Click);// Set button click event
                e.Row.Cells[6].Controls.Add(btnEdit);  //add the btn



                // Delete btn
                Button btnDelete = new Button();  //create delete btn
                                                  // btnDetails.Add(btnDelete);  //the list index of the button will also be the row index
                btnDelete.CssClass = "btn btn-danger";  //set css class
                btnDelete.Text = "Delete";
                btnDelete.Attributes.Add("aria-label", "Click to delete this sale");
                //set aria label
                // btnDelete.Attributes.Add("OnClick", "btnDelete_Click");  //click event handler
                btnDelete.Click += new EventHandler(btnDelete_Click);// Set button click event


                //if (not admin)
                //btnDelete.Visible = false;
                //btnDelete.Enabled = false;

                e.Row.Cells[6].Controls.Add(btnDelete);  //add the btn
            }
            catch
            {
                this.Label1.Text = "No reecord Found";
            }
          

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (RepairsDataSet.RepairLookUp.Count > 0)
            {
                string criteria = FilterCriteria();
                rows = (criteria.Length > 0) ? RepairsDataSet.RepairLookUp.Select(criteria) : RepairsDataSet.RepairLookUp.Select(); // Data satisfying the conditions is saved in rows
                DisplayRepairTable();
            }
            else
                this.Label1.Text = "No Records Found";
        }

        //Display Method to fill tables
        private void DisplayRepairTable()
        {
            this.Label1.Text = "ready";

            //HyperLinkField hp = new HyperLinkField();
            //hp.Text = "Edit";
            //hp.NavigateUrl = "~/Default.aspx";
            //hp  .Visible = true;

            DataTable dt = new DataTable();
          // dt.Columns.Add("ID");
            dt.Columns.Add("DateIn");
            dt.Columns.Add("DateOut");
            dt.Columns.Add("Issue");
            dt.Columns.Add("InWarrenty");
            dt.Columns.Add("Equipment");
            dt.Columns.Add("Employee");     
            dt.Columns.Add(""); // column for Edit and Delete btn


            DataRow dr = dt.NewRow();


            foreach (DataRow r in rows) // loop through the static DataRow[] row since the records from filter are saved in them.
            {
                DataRow nr = dt.NewRow();
               // nr[0] = r.ItemArray[0].ToString();
                nr[0] = Convert.ToDateTime(r.ItemArray[11].ToString()).ToShortDateString();
                nr[1] = Convert.ToDateTime(r.ItemArray[12].ToString()).ToShortDateString();
                nr[2] = r.ItemArray[1].ToString();
                nr[3] = r.ItemArray[2].ToString();
                nr[4] = r.ItemArray[10].ToString();
                nr[5] = r.ItemArray[9].ToString();

                dt.Rows.Add(nr);
                //this.GridView1.Columns.Add(hp);
            }

            this.GridView1.DataSource = dt;
            this.GridView1.DataBind();
        }


       

        // Filter criteria
        private string FilterCriteria()
        {
            string criteria = "";

            criteria = (this.txtDateIn.Text.Length > 0) ? " DateIn = '" + this.txtDateIn.Text +"'" : "";


            criteria += (this.txtDateOut.Text.Length > 0 && criteria.Length > 0) ? "and DateOut ='" + this.txtDateOut.Text + "'"
                 : (this.txtDateOut.Text.Length > 0) ? "DateOut ='" + this.txtDateOut.Text + "' " : "";


            criteria += (this.ddlServices.Text != "None" && criteria.Length > 0) ? "And id = " + this.ddlServices.SelectedValue.ToString()
               : (this.ddlServices.Text != "None") ? "id = " + this.ddlServices.SelectedValue.ToString() : "";


            criteria += (this.ddlEquipments.Text != "None" && criteria.Length > 0) ? "And equipID = " + this.ddlEquipments.SelectedValue.ToString()
               : (this.ddlEquipments.Text != "None") ? "equipID = " + this.ddlEquipments.SelectedValue.ToString() : "";


            criteria += (this.ddlEmployee.Text != "None" && criteria.Length > 0) ? "And empID = " + this.ddlEmployee.SelectedValue.ToString()
            : (this.ddlEmployee.Text != "None") ? "empID = " + this.ddlEmployee.SelectedValue.ToString() : "";


            criteria += (this.ddlCustomer.Text != "None" && criteria.Length > 0) ? "And cusID = " + this.ddlCustomer.SelectedValue.ToString()
            : (this.ddlCustomer.Text != "None") ? "cusID = " + this.ddlCustomer.SelectedValue.ToString() : "";

            criteria += (this.radNoWarranty.Checked && criteria.Length > 0) ? "And serordWarranty =" + 0
           : (this.radNoWarranty.Checked) ? "serordWarranty =" + 1 : "";

            criteria += (this.radInWarranty.Checked && criteria.Length > 0) ? "And serordWarranty =" + 1
          : (this.radInWarranty.Checked) ? "serordWarranty =" + 1 : "";


            return criteria;
        }

    }
}