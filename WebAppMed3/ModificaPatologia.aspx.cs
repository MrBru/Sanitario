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
           if(!IsPostBack)
                RiempiTxt();
        }

        protected void btnsalva_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Update();
                Response.Redirect("Patologie.aspx");
        }

        protected void RiempiTxt()
        {
            string codice = Request["cod_patologia"];
            SqlDataSource1.SelectCommand = "SELECT [cod_patologia], [nome], [descrizione] FROM [Patologia] WHERE cod_patologia =" + codice;
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            DataRowView drv = dv[0];
            txtcod_patologia.Text = drv["cod_patologia"].ToString();
            txtnome.Text = drv["nome"].ToString();
            txtdescrizione.Text = drv["descrizione"].ToString();

        }

    }
}