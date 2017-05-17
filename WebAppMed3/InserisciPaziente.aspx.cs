using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppMed3
{
    public partial class InserisciPaziente : System.Web.UI.Page
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
            txtcognome.Text = null;
            txtcell.Text = null;
            txtcodicefiscale.Text = null;
            txtcodicesanitario.Text = null;
            txtdatanascita.Text = null;
            txtemail.Text = null;
            txtindirizzo.Text = null;
            txtluogo.Text = null;
            txtprovincia.Text = null;
            txtresidenza.Text = null;
            txttel.Text = null;
            txtdata_update.Text = null;
            txtdata_inserimento.Text = null;
            txtsesso.Text = null;
            txtcap.Text = null;

        }
    }
}