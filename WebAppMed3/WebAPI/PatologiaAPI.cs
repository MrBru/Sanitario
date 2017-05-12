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

        public static bool InsertPatologia(Patologia patologia)
        {
            string sql = "";
            SqlConnection cn = GetConnection(); //connessione db
            try
            {
                sql = "INSERT INTO [Patologie] ([nome], [cognome], [città], [paese]) " +
                       "VALUES (@pNome, @pDescrizione, @pCittà, @pPaese)  "; //p sta per parametro usato per sql Server
                                                                         //dichiaro prametri non c'è relazione tra @pNome e pNome
                SqlParameter pNome = new SqlParameter("pNome", patologia.Nome); //passo nome(pNome) e valore(patologia.Nome)
                SqlParameter pDescrizione = new SqlParameter("pDescrizione", patologia.Descrizione);
                

                SqlCommand cmd = new SqlCommand(sql, cn); //Parameters struttura dinamica l'ordine non importa
                cmd.Parameters.Add(pNome);
                cmd.Parameters.Add(pDescrizione);

                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("Errore durante l'inserimento di un nuovo patologia", ex);
            }
        }

        public static bool UpdatePatologia(Patologia patologia) //modifica
        {
            SqlConnection cn = GetConnection();
            try
            {
                string sql = "UPDATE [Patologie] SET" +
                             " [nome] = @pNome" +
                             ",[cognome] = @pDescrizione" +
                             " WHERE [id] = @pcodicePatologia";

                SqlParameter pCodicePatologia = new SqlParameter("pCodicePatologia", patologia.CodicePatologia);
                SqlParameter pNome = new SqlParameter("pNome", patologia.Nome);
                

                SqlCommand cmd = new SqlCommand(sql, cn);
                cmd.Parameters.Add(pCodicePatologia);
                cmd.Parameters.Add(pNome);


                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("Errore durante la modifica dell'patologia", ex);
            }
        }

        public static bool DeletePatologia(Patologia patologia) //elimina
        {
            SqlConnection cn = GetConnection();
            try
            {
                string sql = "DELETE FROM [Patologie] " +
                             " WHERE [id] = @pcodicePatologia";
                SqlParameter pcodicePatologia = new SqlParameter("pcodicePatologia", patologia.CodicePatologia);

                SqlCommand cmd = new SqlCommand(sql, cn);
                cmd.Parameters.Add(pcodicePatologia);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("Errore durante la cancellazione dell'patologia", ex);
            }
        }

        public static bool DeletePatologia(int idPatologia)
        {
            Patologia tmpPatologia = new Patologia(idPatologia);
            return DeletePatologia(tmpPatologia);
        }

        public static Patologia GetPatologia(int idPatologia)
        {
            SqlDataReader dr = null; //informazioni formattate
            SqlConnection cn = GetConnection(); //connessione db
            Patologia tmpPatologia = new Patologia(idPatologia);
            try
            {
                string sql = "SELECT [id],[nome],[cognome],[città],[paese] FROM [Patologie] WHERE id=@pcodicePatologia"; //query
                SqlParameter pcodicePatologia = new SqlParameter("pcodicePatologia", idPatologia); //nuovo parametro di tipo sqlparameter
                SqlCommand cmd = new SqlCommand(sql, cn);
                cmd.Parameters.Add(pcodicePatologia);
                dr = cmd.ExecuteReader(); //esegui query e inserisce i dati in dr

                if (dr.Read()) //non può avere parametri in ingresso
                {
                    tmpPatologia.CodicePatologia = dr.GetString(0);
                    tmpPatologia.Nome = (dr.IsDBNull(1) ? null : dr.GetString(1));//if condizionale
                    tmpPatologia.Descrizione = (dr.IsDBNull(2) ? null : dr.GetString(2));
                   
                    return tmpPatologia;
                }
                else
                {
                    tmpPatologia = null;//avendo un int in GetPatologia non posso restituire un messaggio
                }
                return tmpPatologia;
            }
            catch (Exception ex)//eccezione la mando nello strato alto
            {
                //messaggio di errore
                throw new Exception("Errore durante la lettura dell'patologia", ex);
            }
        }
    }
}