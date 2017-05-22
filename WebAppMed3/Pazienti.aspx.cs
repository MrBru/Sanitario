using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Net;
using System.Web.UI.WebControls;
using ProvaJson;

namespace WebAppMed3
{
    public partial class Pazienti : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewRow row = (GridViewRow)GridView1.Rows[e.NewEditIndex];
            string cod_sanitario = row.Cells[13].Text;
            Response.Redirect("ModificaPaziente.aspx?cod_sanitario=" + cod_sanitario);
        }

    }
}