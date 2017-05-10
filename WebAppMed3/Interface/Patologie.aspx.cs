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
        public string jsonPatologie;
        protected void Page_Load(object sender, EventArgs e)
        {
            //leggere file json
            //jsonPatologie = System.IO.File.ReadAllText(@"C:\Users\admin\Documents\Esercitazioni\WebAppMed3\WebAppMed3\test\patologie.json");
        }
    }
}