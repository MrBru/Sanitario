﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppMed3
{
    public partial class InserisciMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void PulisciTxtBox()
        {
            txtnome.Text = null;
            txtcognome.Text = null;
            txtcell.Text = null;
            txtcodicefiscale.Text = null;
            txtdatanascita.Text = null;
            txtemail.Text = null;
            txtindirizzo.Text = null;
            txtluogo.Text = null;
            txtprovincia.Text = null;
            txtresidenza.Text = null;
            txttel.Text = null;
            txtcodalbo.Text = null;
            txtcodmedico.Text = null;
        }

        protected void btninseriscinuovo_Click1(object sender, EventArgs e)
        {
            SqlDataSource1.Insert();
            PulisciTxtBox();
        }
    }
}