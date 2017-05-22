using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebAppMed3
{
    public partial class ModificaMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                RiempiTxt();
        }

        protected void btnsalva_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Update();
            Response.Redirect("Medici.aspx");
        }

        protected void RiempiTxt()
        {
            string codice = Request["cod_medico"];
            SqlDataSource1.SelectCommand = "SELECT cod_medico, nome, cognome, data_nascita, luogo, email, provincia, telefono,  mobile, indirizzo, residenza, cod_albo, cod_fis FROM Medico WHERE cod_medico =" + codice;
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            DataRowView drv = dv[0];
            txtcell.Text = drv["mobile"].ToString();
            txtnome.Text = drv["nome"].ToString();
            txtcodalbo.Text = drv["cod_albo"].ToString();
            txtcodicefiscale.Text = drv["cod_fis"].ToString();
            txtcodmedico.Text = drv["cod_medico"].ToString();
            txtcognome.Text = drv["cognome"].ToString();
            string data = drv["data_nascita"].ToString();
            DateTime data1 = DateTime.Parse(data);
            txtdatanascita.Text = data1.ToString("yyyy-MM-dd");
            txtemail.Text = drv["email"].ToString();
            txtindirizzo.Text = drv["indirizzo"].ToString();
            txtluogo.Text = drv["luogo"].ToString();
            txtprovincia.Text = drv["provincia"].ToString();
            txtresidenza.Text = drv["residenza"].ToString();
            txttel.Text = drv["telefono"].ToString();
            

        }
    }
}