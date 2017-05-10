using ApplicazioneMedico.Data;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebAppMed3.WebAppAPI
{
    public class PazienteAPI
       : HttpApiRestClient
    {

        public static List<Paziente> GetListPazienti()
        {
            List<Paziente> retList = new List<Paziente>();
            string sql = "";
            SqlDataReader dr = null;
            SqlConnection cn = GetConnection(); //connessione db

            try
            {
                sql = "SELECT [id],[nome],[cognome],[città],[paese] FROM [Pazienti]"; //query
                SqlCommand cmd = new SqlCommand(sql, cn);
                dr = cmd.ExecuteReader(); //esegui query e inserisce i dati in dr
                while (dr.Read()) //mi rende un booleano, quando ha finito di leggere restituisce false
                {
                    Paziente tmpPaziente = new Paziente();
                    tmpPaziente.Id = dr.GetInt32(0);//essendo la chiave primaria non può essere null
                    tmpPaziente.Nome = (dr.IsDBNull(1) ? null : dr.GetString(1));//if condizionale può essere null
                    tmpPaziente.Cognome = (dr.IsDBNull(2) ? null : dr.GetString(2));
                    tmpPaziente.LuogoNascita = (dr.IsDBNull(3) ? null : dr.GetString(3));
                    tmpPaziente.CodiceFiscale = (dr.IsDBNull(4) ? null : dr.GetString(4));
                    tmpPaziente.Residenza = (dr.IsDBNull(5) ? null : dr.GetString(5));
                    tmpPaziente.Provincia = (dr.IsDBNull(6) ? null : dr.GetString(6));
                    tmpPaziente.Indirizzo = (dr.IsDBNull(7) ? null : dr.GetString(7));
                    tmpPaziente.Telefono = (dr.IsDBNull(8) ? null : dr.GetString(8));
                    tmpPaziente.Cellulare = (dr.IsDBNull(9) ? null : dr.GetString(9));
                    tmpPaziente.Email = (dr.IsDBNull(10) ? null : dr.GetString(10));
                    tmpPaziente.CodiceSanitario = (dr.IsDBNull(11) ? null : dr.GetString(11));
                    tmpPaziente.CodiceMedico = (dr.IsDBNull(12) ? null : dr.GetString(12));
                    tmpPaziente.DataNascita = (dr.IsDBNull(13) ? dr.GetDateTime(13));
                    tmpPaziente.DataUpdate = (dr.IsDBNull(14) ? dr.GetDateTime(14));
                    tmpPaziente.DataInserimento = (dr.IsDBNull(15) ? dr.GetDateTime(15));

                    retList.Add(tmpPaziente); //li aggiunge alla lista via via
                }
                return retList;
            }
            catch (Exception ex)//eccezione la mando nello strato alto
            {
                //messaggio di errore
                throw new Exception("Errore durante la lettura dei pazienti", ex);
            }
        }

        public static bool InsertPaziente(Paziente paziente)
        {
            string sql = "";
            SqlConnection cn = GetConnection(); //connessione db
            try
            {
                sql = "INSERT INTO [Pazienti] ([nome], [cognome], [città], [paese]) " +
                       "VALUES (@pNome, @pCognome, @pCittà, @pPaese)  "; //p sta per parametro usato per sql Server
                                                                         //dichiaro prametri non c'è relazione tra @pNome e pNome
                SqlParameter pNome = new SqlParameter("pNome", paziente.Nome); //passo nome(pNome) e valore(paziente.Nome)
                SqlParameter pCognome = new SqlParameter("pCognome", paziente.Cognome);
                SqlParameter pLuogoNascita = new SqlParameter("pLuogoNascita", paziente.LuogoNascita);
                SqlParameter pCodiceFiscale = new SqlParameter("pCodiceFiscale", paziente.CodiceFiscale);
                SqlParameter pResidenza = new SqlParameter("pResidenza", paziente.Residenza);
                SqlParameter pProvincia = new SqlParameter("pProvincia", paziente.Provincia);
                SqlParameter pIndirizzo = new SqlParameter("pIndirizzo", paziente.Indirizzo);
                SqlParameter pTelefono = new SqlParameter("pTelefono", paziente.Telefono);
                SqlParameter pCellulare = new SqlParameter("pCellulare", paziente.Cellulare);
                SqlParameter pEmail = new SqlParameter("pEmail", paziente.Email);
                SqlParameter pCodiceSanitario = new SqlParameter("pCodiceSanitario", paziente.CodiceSanitario);
                SqlParameter pCodiceMedico = new SqlParameter("pCodiceMedico", paziente.CodiceMedico);
                SqlParameter pDataNascita = new SqlParameter("pDataNascita", paziente.DataNascita);
                SqlParameter pDataUpdate = new SqlParameter("pDataupdate", paziente.DataUpdate);
                SqlParameter pDataInserimento = new SqlParameter("pDataInserimento", paziente.DataInserimento);

                SqlCommand cmd = new SqlCommand(sql, cn); //Parameters struttura dinamica l'ordine non importa
                cmd.Parameters.Add(pNome);
                cmd.Parameters.Add(pCognome);
                cmd.Parameters.Add(pLuogoNascita);
                cmd.Parameters.Add(pCodiceFiscale);
                cmd.Parameters.Add(pResidenza);
                cmd.Parameters.Add(pProvincia);
                cmd.Parameters.Add(pIndirizzo);
                cmd.Parameters.Add(pTelefono);
                cmd.Parameters.Add(pCellulare);
                cmd.Parameters.Add(pEmail);
                cmd.Parameters.Add(pCodiceSanitario);
                cmd.Parameters.Add(pCodiceMedico);
                cmd.Parameters.Add(pDataNascita);
                cmd.Parameters.Add(pDataUpdate);
                cmd.Parameters.Add(pDataInserimento);

                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("Errore durante l'inserimento di un nuovo paziente", ex);
            }
        }

        public static bool UpdatePaziente(Paziente paziente) //modifica
        {
            SqlConnection cn = GetConnection();
            try
            {
                string sql = "UPDATE [Pazienti] SET" +
                             " [nome] = @pNome" +
                             ",[cognome] = @pCognome" +
                             ",[città] = @pCittà" +
                             ",[paese] = @pPaese" +
                             " WHERE [id] = @pId";

                SqlParameter pId = new SqlParameter("pId", paziente.Id);
                SqlParameter pNome = new SqlParameter("pNome", paziente.Nome);
                SqlParameter pCognome = new SqlParameter("pCognome", paziente.Cognome);
                SqlParameter pLuogoNascita = new SqlParameter("pLuogoNascita", paziente.LuogoNascita);
                SqlParameter pCodiceFiscale = new SqlParameter("pCodiceFiscale", paziente.CodiceFiscale);
                SqlParameter pResidenza = new SqlParameter("pResidenza", paziente.Residenza);
                SqlParameter pProvincia = new SqlParameter("pProvincia", paziente.Provincia);
                SqlParameter pIndirizzo = new SqlParameter("pIndirizzo", paziente.Indirizzo);
                SqlParameter pTelefono = new SqlParameter("pTelefono", paziente.Telefono);
                SqlParameter pCellulare = new SqlParameter("pCellulare", paziente.Cellulare);
                SqlParameter pEmail = new SqlParameter("pEmail", paziente.Email);
                SqlParameter pCodiceSanitario = new SqlParameter("pCodiceSanitario", paziente.CodiceSanitario);
                SqlParameter pCodiceMedico = new SqlParameter("pCodiceMedico", paziente.CodiceMedico);
                SqlParameter pDataNascita = new SqlParameter("pDataNascita", paziente.DataNascita);
                SqlParameter pDataUpdate = new SqlParameter("pDataupdate", paziente.DataUpdate);
                SqlParameter pDataInserimento = new SqlParameter("pDataInserimento", paziente.DataInserimento);

                SqlCommand cmd = new SqlCommand(sql, cn);
                cmd.Parameters.Add(pId);
                cmd.Parameters.Add(pNome);
                cmd.Parameters.Add(pCognome);
                cmd.Parameters.Add(pLuogoNascita);
                cmd.Parameters.Add(pCodiceFiscale);
                cmd.Parameters.Add(pResidenza);
                cmd.Parameters.Add(pProvincia);
                cmd.Parameters.Add(pIndirizzo);
                cmd.Parameters.Add(pTelefono);
                cmd.Parameters.Add(pCellulare);
                cmd.Parameters.Add(pEmail);
                cmd.Parameters.Add(pCodiceSanitario);
                cmd.Parameters.Add(pCodiceMedico);
                cmd.Parameters.Add(pDataNascita);
                cmd.Parameters.Add(pDataUpdate);
                cmd.Parameters.Add(pDataInserimento);

                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("Errore durante la modifica dell'paziente", ex);
            }
        }

        public static bool DeletePaziente(Paziente paziente) //elimina
        {
            SqlConnection cn = GetConnection();
            try
            {
                string sql = "DELETE FROM [Pazienti] " +
                             " WHERE [id] = @pId";
                SqlParameter pId = new SqlParameter("pId", paziente.Id);

                SqlCommand cmd = new SqlCommand(sql, cn);
                cmd.Parameters.Add(pId);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("Errore durante la cancellazione dell'paziente", ex);
            }
        }

        public static bool DeletePaziente(int idPaziente)
        {
            Paziente tmpPaziente = new Paziente(idPaziente);
            return DeletePaziente(tmpPaziente);
        }

        public static Paziente GetPaziente(int idPaziente)
        {
            SqlDataReader dr = null; //informazioni formattate
            SqlConnection cn = GetConnection(); //connessione db
            Paziente tmpPaziente = new Paziente(idPaziente);
            try
            {
                string sql = "SELECT [id],[nome],[cognome],[città],[paese] FROM [Pazienti] WHERE id=@pId"; //query
                SqlParameter pId = new SqlParameter("pId", idPaziente); //nuovo parametro di tipo sqlparameter
                SqlCommand cmd = new SqlCommand(sql, cn);
                cmd.Parameters.Add(pId);
                dr = cmd.ExecuteReader(); //esegui query e inserisce i dati in dr

                if (dr.Read()) //non può avere parametri in ingresso
                {
                    tmpPaziente.Id = dr.GetInt32(0);
                    tmpPaziente.Nome = (dr.IsDBNull(1) ? null : dr.GetString(1));//if condizionale
                    tmpPaziente.Cognome = (dr.IsDBNull(2) ? null : dr.GetString(2));
                    tmpPaziente.LuogoNascita = (dr.IsDBNull(3) ? null : dr.GetString(3));
                    tmpPaziente.CodiceFiscale = (dr.IsDBNull(4) ? null : dr.GetString(4));
                    tmpPaziente.Residenza = (dr.IsDBNull(5) ? null : dr.GetString(5));
                    tmpPaziente.Provincia = (dr.IsDBNull(6) ? null : dr.GetString(6));
                    tmpPaziente.Indirizzo = (dr.IsDBNull(7) ? null : dr.GetString(7));
                    tmpPaziente.Telefono = (dr.IsDBNull(8) ? null : dr.GetString(8));
                    tmpPaziente.Cellulare = (dr.IsDBNull(9) ? null : dr.GetString(9));
                    tmpPaziente.Email = (dr.IsDBNull(10) ? null : dr.GetString(10));
                    tmpPaziente.CodiceSanitario = (dr.IsDBNull(11) ? null : dr.GetString(11));
                    tmpPaziente.CodiceMedico = (dr.IsDBNull(12) ? null : dr.GetString(12));
                    tmpPaziente.DataNascita = (dr.IsDBNull(13) ? null : dr.GetDateTime(13));
                    tmpPaziente.DataUpdate = (dr.IsDBNull(14) ? dr.GetDateTime(14));
                    tmpPaziente.DataInserimento = (dr.IsDBNull(15) ? dr.GetDateTime(15));
                    return tmpPaziente;
                }
                else
                {
                    tmpPaziente = null;//avendo un int in GetPaziente non posso restituire un messaggio
                }
                return tmpPaziente;
            }
            catch (Exception ex)//eccezione la mando nello strato alto
            {
                //messaggio di errore
                throw new Exception("Errore durante la lettura dell'paziente", ex);
            }
        }
    }

}