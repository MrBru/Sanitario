using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppMed3
{
    public partial class Medici : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewRow row = (GridViewRow)GridView1.Rows[e.NewEditIndex];
            string cod_medico = row.Cells[12].Text;
            Response.Redirect("ModificaMedico.aspx?cod_medico=" + cod_medico);
        }


    }
}