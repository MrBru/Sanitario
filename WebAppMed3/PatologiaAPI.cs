using ApplicazioneMedico.Data;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebAppMed3.WebAppAPI
{
    public class PatologiaAPI
    : HttpApiRestClient
    {

        public static List<Patologia> GetListPatologie()
        {
            List<Patologia> retList = new List<Patologia>();
            string sql = "";
            SqlDataReader dr = null;
            SqlConnection cn = GetConnection(); //connessione db

            try
            {
                sql = "SELECT * FROM Patologia"; //query
                SqlCommand cmd = new SqlCommand(sql, cn);
                dr = cmd.ExecuteReader(); //esegui query e inserisce i dati in dr
                while (dr.Read()) //mi rende un booleano, quando ha finito di leggere restituisce false
                {
                    Patologia tmpPatologia = new Patologia();
                    tmpPatologia.CodicePatologia = dr.GetString(0);//essendo la chiave primaria non può essere null
                    tmpPatologia.Nome = (dr.IsDBNull(1) ? null : dr.GetString(1));//if condizionale può essere null
                    tmpPatologia.Descrizione = (dr.IsDBNull(2) ? null : dr.GetString(2));
                   
                    retList.Add(tmpPatologia); //li aggiunge alla lista via via
                }
                return retList;
            }
            catch (Exception ex)//eccezione la mando nello strato alto
            {
                //messaggio di errore
                throw new Exception("Errore durante la lettura delle patologie", ex);
            }
        }
    
    }
}