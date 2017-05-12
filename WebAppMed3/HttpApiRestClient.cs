using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebAppMed3
{
    public class HttpApiRestClient
    {
        public static SqlConnection GetConnection()
        {
            //connessione al db quando modifico elimino etc rimane
            SqlConnection cn = null;
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["SanitarioSql"].ConnectionString;
                cn = new SqlConnection(connectionString);
                cn.Open();
            }
            catch (Exception ex)
            {
                //esempio di errori, ce ne possono essere vari
                string msg = "Si è verificato un errore durante la creazione di una connessione al DB";
                throw new Exception(msg, ex); //l'errore sale di un livello
            }
            return cn;
        }
    }
}