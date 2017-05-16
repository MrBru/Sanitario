using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppMed3
{
    public partial class Patologie : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            tabella.Visible = true;
            modifica.Visible = false;
        }


        protected void btnModifica_Click(object sender, EventArgs e)
        {
            tabella.Visible = false;
            modifica.Visible = true;
        }

        protected void Salva_Click(object sender, EventArgs e)
        {
            tabella.Visible = true;
            modifica.Visible = false;
        }

        protected void AnnullaModifiche_Click(object sender, EventArgs e)
        {
            tabella.Visible = true;
            modifica.Visible = false;
        }
    }
}