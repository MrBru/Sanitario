using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebAppMed3
{
    public partial class ModificaPaziente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                RiempiTxt();
        }

        protected void btnsalva_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Update();
            Response.Redirect("Pazienti.aspx");
        }

        protected void RiempiTxt()
        {
            string codice = Request["cod_sanitario"];
            SqlDataSource1.SelectCommand = "SELECT [nome], [cognome], [data_nascita], [luogo], [cod_fis], [residenza], [provincia], [indirizzo], [telefono], [mobile], [email], [cod_sanitario], [cod_medico], [sesso], [CAP]  FROM [Paziente] WHERE cod_sanitario =" + codice;
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            DataRowView drv = dv[0];
            txtcap.Text = drv["CAP"].ToString();
            txtnome.Text = drv["nome"].ToString();
            txtcell.Text = drv["mobile"].ToString();
            txtcodicefiscale.Text = drv["cod_fis"].ToString();
            txtcodicesanitario.Text = drv["cod_sanitario"].ToString();
            txtcognome.Text = drv["cognome"].ToString();
            txtdatanascita.Text = drv["data_nascita"].ToString();
            txtemail.Text = drv["email"].ToString();
            txtindirizzo.Text = drv["indirizzo"].ToString();
            txtluogo.Text = drv["luogo"].ToString();
            txtprovincia.Text = drv["provincia"].ToString();
            txtresidenza.Text = drv["residenza"].ToString();
            txtsesso.Text = drv["sesso"].ToString();
            txttel.Text = drv["tel"].ToString();

        }
    }
}