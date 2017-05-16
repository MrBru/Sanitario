using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppMed3
{
    public partial class InserisciPatologia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btninseriscinuovo_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Insert();
            PulisciTxtBox();

        }

        protected void PulisciTxtBox()
        {
            txtnome.Text = null;
            txtdescrizione.Text = null;
            txtcodice.Text = null;

        }
    }
}