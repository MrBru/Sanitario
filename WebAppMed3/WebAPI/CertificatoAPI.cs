using ApplicazioneMedico.Data;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebAppMed3.WebAppAPI
{
    public class CertificatoAPI
    : HttpApiRestClient
    {

        public static List<Certificato> GetListCertificati()
        {
            List<Certificato> retList = new List<Certificato>();
            string sql = "";
            SqlDataReader dr = null;
            SqlConnection cn = GetConnection(); //connessione db

            try
            {
                sql = "SELECT [id],[nome],[cognome],[città],[paese] FROM [Certificati]"; //query
                SqlCommand cmd = new SqlCommand(sql, cn);
                dr = cmd.ExecuteReader(); //esegui query e inserisce i dati in dr
                while (dr.Read()) //mi rende un booleano, quando ha finito di leggere restituisce false
                {
                    Certificato tmpCertificato = new Certificato();
                    tmpCertificato.Id = dr.GetInt32(0);//essendo la chiave primaria non può essere null
                    tmpCertificato.CodPaziente = (dr.IsDBNull(1) ? null : dr.GetString(1));//if condizionale può essere null
                    tmpCertificato.CodMedico = (dr.IsDBNull(2) ? null : dr.GetString(2));
                    tmpCertificato.Note = (dr.IsDBNull(3) ? null : dr.GetString(3));
                    //tmpCertificato.DataEmissione = (dr.IsDBNull(4) ? dr.GetDateTime(4));
                    //tmpCertificato.DataInizio = (dr.IsDBNull(5) ? dr.GetDateTime(5));
                    //tmpCertificato.DataFine = (dr.IsDBNull(6) ? dr.GetDateTime(6));

                    retList.Add(tmpCertificato); //li aggiunge alla lista via via
                }
                return retList;
            }
            catch (Exception ex)//eccezione la mando nello strato alto
            {
                //messaggio di errore
                throw new Exception("Errore durante la lettura dei certificati", ex);
            }
        }

        public static bool InsertCertificato(Certificato certificato)
        {
            string sql = "";
            SqlConnection cn = GetConnection(); //connessione db
            try
            {
                sql = "INSERT INTO [Certificati] ([nome], [cognome], [città], [paese]) " +
                       "VALUES (@pCodPaziente, @pCodMedico, @pCittà, @pPaese)  "; //p sta per parametro usato per sql Server
                                                                         //dichiaro prametri non c'è relazione tra @pCodPaziente e pCodPaziente
                SqlParameter pCodPaziente = new SqlParameter("pCodPaziente", certificato.CodPaziente); //passo nome(pCodPaziente) e valore(certificato.CodPaziente)
                SqlParameter pCodMedico = new SqlParameter("pCodMedico", certificato.CodMedico);
                SqlParameter pNote = new SqlParameter("pNote", certificato.Note);
                SqlParameter pDataEmissione = new SqlParameter("pDataEmissione", certificato.DataEmissione);
                SqlParameter pDataInizio = new SqlParameter("pDataupdate", certificato.DataInizio);
                SqlParameter pDataFine = new SqlParameter("pDataInserimento", certificato.DataFine);

                SqlCommand cmd = new SqlCommand(sql, cn); //Parameters struttura dinamica l'ordine non importa
                cmd.Parameters.Add(pCodPaziente);
                cmd.Parameters.Add(pCodMedico);
                cmd.Parameters.Add(pNote);
                cmd.Parameters.Add(pDataEmissione);
                cmd.Parameters.Add(pDataInizio);
                cmd.Parameters.Add(pDataFine);

                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("Errore durante l'inserimento di un nuovo certificato", ex);
            }
        }

        public static bool UpdateCertificato(Certificato certificato) //modifica
        {
            SqlConnection cn = GetConnection();
            try
            {
                string sql = "UPDATE [Certificati] SET" +
                             " [nome] = @pCodPaziente" +
                             ",[cognome] = @pCodMedico" +
                             ",[città] = @pCittà" +
                             ",[paese] = @pPaese" +
                             " WHERE [id] = @pId";

                SqlParameter pId = new SqlParameter("pId", certificato.Id);
                SqlParameter pCodPaziente = new SqlParameter("pCodPaziente", certificato.CodPaziente);
                SqlParameter pCodMedico = new SqlParameter("pCodMedico", certificato.CodMedico);
                SqlParameter pNote = new SqlParameter("pNote", certificato.Note);
                SqlParameter pDataEmissione = new SqlParameter("pDataEmissione", certificato.DataEmissione);
                SqlParameter pDataInizio = new SqlParameter("pDataupdate", certificato.DataInizio);
                SqlParameter pDataFine = new SqlParameter("pDataInserimento", certificato.DataFine);

                SqlCommand cmd = new SqlCommand(sql, cn);
                cmd.Parameters.Add(pId);
                cmd.Parameters.Add(pCodPaziente);
                cmd.Parameters.Add(pCodMedico);
                cmd.Parameters.Add(pNote);
                cmd.Parameters.Add(pDataEmissione);
                cmd.Parameters.Add(pDataInizio);
                cmd.Parameters.Add(pDataInizio);

                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("Errore durante la modifica dell'certificato", ex);
            }
        }

        public static bool DeleteCertificato(Certificato certificato) //elimina
        {
            SqlConnection cn = GetConnection();
            try
            {
                string sql = "DELETE FROM [Certificati] " +
                             " WHERE [id] = @pId";
                SqlParameter pId = new SqlParameter("pId", certificato.Id);

                SqlCommand cmd = new SqlCommand(sql, cn);
                cmd.Parameters.Add(pId);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("Errore durante la cancellazione dell'certificato", ex);
            }
        }

        public static bool DeleteCertificato(int idCertificato)
        {
            Certificato tmpCertificato = new Certificato(idCertificato);
            return DeleteCertificato(tmpCertificato);
        }

        public static Certificato GetCertificato(int idCertificato)
        {
            SqlDataReader dr = null; //informazioni formattate
            SqlConnection cn = GetConnection(); //connessione db
            Certificato tmpCertificato = new Certificato(idCertificato);
            try
            {
                string sql = "SELECT [id],[nome],[cognome],[città],[paese] FROM [Certificati] WHERE id=@pId"; //query
                SqlParameter pId = new SqlParameter("pId", idCertificato); //nuovo parametro di tipo sqlparameter
                SqlCommand cmd = new SqlCommand(sql, cn);
                cmd.Parameters.Add(pId);
                dr = cmd.ExecuteReader(); //esegui query e inserisce i dati in dr

                if (dr.Read()) //non può avere parametri in ingresso
                {
                    tmpCertificato.Id = dr.GetInt32(0);
                    tmpCertificato.CodPaziente = (dr.IsDBNull(1) ? null : dr.GetString(1));//if condizionale
                    tmpCertificato.CodMedico = (dr.IsDBNull(2) ? null : dr.GetString(2));
                    tmpCertificato.Note = (dr.IsDBNull(3) ? null : dr.GetString(3));
                    tmpCertificato.DataEmissione = (dr.IsDBNull(4) ? dr.GetDateTime(4));
                    tmpCertificato.DataInizio = (dr.IsDBNull(5) ? dr.GetDateTime(5));
                    tmpCertificato.DataFine = (dr.IsDBNull(6) ? dr.GetDateTime(6));
                    return tmpCertificato;
                }
                else
                {
                    tmpCertificato = null;//avendo un int in GetCertificato non posso restituire un messaggio
                }
                return tmpCertificato;
            }
            catch (Exception ex)//eccezione la mando nello strato alto
            {
                //messaggio di errore
                throw new Exception("Errore durante la lettura dell'certificato", ex);
            }
        }
    }
}