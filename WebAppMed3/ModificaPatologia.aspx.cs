using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebAppMed3.Classes;
using System.Data;

namespace WebAppMed3
{
    public partial class ModificaPatologia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string codice = Request["cod_patologia"];
            SqlDataSource1.SelectCommand="SELECT [cod_patologia], [nome], [descrizione] FROM [Patologia] WHERE cod_patologia ="+ codice;
            SqlDataSource1.SelectParameters.Add(codice, "null");
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            DataRowView drv = dv[0];
            txtcodice.Text = drv["cod_patologia"].ToString();
            txtnome.Text = drv["nome"].ToString();
            txtdescrizione.Text = drv["descrizione"].ToString();

        }

        protected void btnsalva_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Update();
            Response.Redirect("Patologie.aspx");
        }
    }
}