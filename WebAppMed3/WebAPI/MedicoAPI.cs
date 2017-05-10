using ApplicazioneMedico.Data;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebAppMed3.WebAppAPI
{
    public class MedicoAPI
       :HttpApiRestClient
    {

        public static List<Medico> GetListMedici()
        {
            List<Medico> retList = new List<Medico>();
            string sql = "";
            SqlDataReader dr = null;
            SqlConnection cn = GetConnection(); //connessione db

            try
            {
                sql = "SELECT [id],[nome],[cognome],[città],[paese] FROM [Medici]"; //query
                SqlCommand cmd = new SqlCommand(sql, cn);
                dr = cmd.ExecuteReader(); //esegui query e inserisce i dati in dr
                while (dr.Read()) //mi rende un booleano, quando ha finito di leggere restituisce false
                {
                    Medico tmpMedico = new Medico();
                    tmpMedico.Id = dr.GetInt32(0);//essendo la chiave primaria non può essere null
                    tmpMedico.Nome = (dr.IsDBNull(1) ? null : dr.GetString(1));//if condizionale può essere null
                    tmpMedico.Cognome = (dr.IsDBNull(2) ? null : dr.GetString(2));
                    tmpMedico.LuogoNascita = (dr.IsDBNull(3) ? null : dr.GetString(3));
                    tmpMedico.CodiceFiscale = (dr.IsDBNull(4) ? null : dr.GetString(4));
                    tmpMedico.Residenza = (dr.IsDBNull(5) ? null : dr.GetString(5));
                    tmpMedico.Provincia = (dr.IsDBNull(6) ? null : dr.GetString(6));
                    tmpMedico.Indirizzo = (dr.IsDBNull(7) ? null : dr.GetString(7));
                    tmpMedico.Telefono = (dr.IsDBNull(8) ? null : dr.GetString(8));
                    tmpMedico.Cellulare = (dr.IsDBNull(9) ? null : dr.GetString(9));
                    tmpMedico.Email = (dr.IsDBNull(10) ? null : dr.GetString(10));
                    tmpMedico.CodiceAlbo = (dr.IsDBNull(11) ? null : dr.GetString(11));
                    tmpMedico.CodiceMedico = (dr.IsDBNull(12) ? null : dr.GetString(12));
                    tmpMedico.DataNascita = (dr.IsDBNull(13) ?  dr.GetDateTime(13));

                    retList.Add(tmpMedico); //li aggiunge alla lista via via
                }
                return retList;
            }
            catch (Exception ex)//eccezione la mando nello strato alto
            {
                //messaggio di errore
                throw new Exception("Errore durante la lettura dei medici", ex);
            }
        }

        public static bool InsertMedico(Medico medico)
        {
            string sql = "";
            SqlConnection cn = GetConnection(); //connessione db
            try
            {
                sql = "INSERT INTO [Medici] ([nome], [cognome], [città], [paese]) " +
                       "VALUES (@pNome, @pCognome, @pCittà, @pPaese)  "; //p sta per parametro usato per sql Server
                                                                         //dichiaro prametri non c'è relazione tra @pNome e pNome
                SqlParameter pNome = new SqlParameter("pNome", medico.Nome); //passo nome(pNome) e valore(medico.Nome)
                SqlParameter pCognome = new SqlParameter("pCognome", medico.Cognome);
                SqlParameter pLuogoNascita = new SqlParameter("pLuogoNascita", medico.LuogoNascita);
                SqlParameter pCodiceFiscale = new SqlParameter("pCodiceFiscale", medico.CodiceFiscale);
                SqlParameter pResidenza = new SqlParameter("pResidenza", medico.Residenza);
                SqlParameter pProvincia = new SqlParameter("pProvincia", medico.Provincia);
                SqlParameter pIndirizzo = new SqlParameter("pIndirizzo", medico.Indirizzo);
                SqlParameter pTelefono = new SqlParameter("pTelefono", medico.Telefono);
                SqlParameter pCellulare = new SqlParameter("pCellulare", medico.Cellulare);
                SqlParameter pEmail = new SqlParameter("pEmail", medico.Email);
                SqlParameter pCodiceAlbo = new SqlParameter("pCodiceAlbo", medico.CodiceAlbo);
                SqlParameter pCodiceMedico = new SqlParameter("pCodiceMedico", medico.CodiceMedico);
                SqlParameter pDataNascita = new SqlParameter("pDataNascita", medico.DataNascita);

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
                cmd.Parameters.Add(pCodiceAlbo);
                cmd.Parameters.Add(pCodiceMedico);
                cmd.Parameters.Add(pDataNascita);

                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("Errore durante l'inserimento di un nuovo medico", ex);
            }
        }

        public static bool UpdateMedico(Medico medico) //modifica
        {
            SqlConnection cn = GetConnection();
            try
            {
                string sql = "UPDATE [Medici] SET" +
                             " [nome] = @pNome" +
                             ",[cognome] = @pCognome" +
                             ",[città] = @pCittà" +
                             ",[paese] = @pPaese" +
                             " WHERE [id] = @pId";

                SqlParameter pId = new SqlParameter("pId", medico.Id);
                SqlParameter pNome = new SqlParameter("pNome", medico.Nome);
                SqlParameter pCognome = new SqlParameter("pCognome", medico.Cognome);
                SqlParameter pLuogoNascita = new SqlParameter("pLuogoNascita", medico.LuogoNascita);
                SqlParameter pCodiceFiscale = new SqlParameter("pCodiceFiscale", medico.CodiceFiscale);
                SqlParameter pResidenza = new SqlParameter("pResidenza", medico.Residenza);
                SqlParameter pProvincia = new SqlParameter("pProvincia", medico.Provincia);
                SqlParameter pIndirizzo = new SqlParameter("pIndirizzo", medico.Indirizzo);
                SqlParameter pTelefono = new SqlParameter("pTelefono", medico.Telefono);
                SqlParameter pCellulare = new SqlParameter("pCellulare", medico.Cellulare);
                SqlParameter pEmail = new SqlParameter("pEmail", medico.Email);
                SqlParameter pCodiceAlbo = new SqlParameter("pCodiceAlbo", medico.CodiceAlbo);
                SqlParameter pCodiceMedico = new SqlParameter("pCodiceMedico", medico.CodiceMedico);
                SqlParameter pDataNascita = new SqlParameter("pDataNascita", medico.DataNascita);
                

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
                cmd.Parameters.Add(pCodiceAlbo);
                cmd.Parameters.Add(pCodiceMedico);
                cmd.Parameters.Add(pDataNascita);

                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("Errore durante la modifica dell'medico", ex);
            }
        }

        public static bool DeleteMedico(Medico medico) //elimina
        {
            SqlConnection cn = GetConnection();
            try
            {
                string sql = "DELETE FROM [Medici] " +
                             " WHERE [id] = @pId";
                SqlParameter pId = new SqlParameter("pId", medico.Id);

                SqlCommand cmd = new SqlCommand(sql, cn);
                cmd.Parameters.Add(pId);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("Errore durante la cancellazione dell'medico", ex);
            }
        }

        public static bool DeleteMedico(int idMedico)
        {
            Medico tmpMedico = new Medico(idMedico);
            return DeleteMedico(tmpMedico);
        }

        public static Medico GetMedico(int idMedico)
        {
            SqlDataReader dr = null; //informazioni formattate
            SqlConnection cn = GetConnection(); //connessione db
            Medico tmpMedico = new Medico(idMedico);
            try
            {
                string sql = "SELECT [id],[nome],[cognome],[città],[paese] FROM [Medici] WHERE id=@pId"; //query
                SqlParameter pId = new SqlParameter("pId", idMedico); //nuovo parametro di tipo sqlparameter
                SqlCommand cmd = new SqlCommand(sql, cn);
                cmd.Parameters.Add(pId);
                dr = cmd.ExecuteReader(); //esegui query e inserisce i dati in dr

                if (dr.Read()) //non può avere parametri in ingresso
                {
                    tmpMedico.Id = dr.GetInt32(0);
                    tmpMedico.Nome = (dr.IsDBNull(1) ? null : dr.GetString(1));//if condizionale
                    tmpMedico.Cognome = (dr.IsDBNull(2) ? null : dr.GetString(2));
                    tmpMedico.LuogoNascita = (dr.IsDBNull(3) ? null : dr.GetString(3));
                    tmpMedico.CodiceFiscale = (dr.IsDBNull(4) ? null : dr.GetString(4));
                    tmpMedico.Residenza = (dr.IsDBNull(5) ? null : dr.GetString(5));
                    tmpMedico.Provincia = (dr.IsDBNull(6) ? null : dr.GetString(6));
                    tmpMedico.Indirizzo = (dr.IsDBNull(7) ? null : dr.GetString(7));
                    tmpMedico.Telefono = (dr.IsDBNull(8) ? null : dr.GetString(8));
                    tmpMedico.Cellulare = (dr.IsDBNull(9) ? null : dr.GetString(9));
                    tmpMedico.Email = (dr.IsDBNull(10) ? null : dr.GetString(10));
                    tmpMedico.CodiceAlbo = (dr.IsDBNull(11) ? null : dr.GetString(11));
                    tmpMedico.CodiceMedico = (dr.IsDBNull(12) ? null : dr.GetString(12));
                    //  tmpMedico.DataNascita = (dr.IsDBNull(13) ? null : dr.GetDateTime(13));
                    return tmpMedico;
                }
                else
                {
                    tmpMedico = null;//avendo un int in GetMedico non posso restituire un messaggio
                }
                return tmpMedico;
            }
            catch (Exception ex)//eccezione la mando nello strato alto
            {
                //messaggio di errore
                throw new Exception("Errore durante la lettura dell'medico", ex);
            }
        }
    }

}
