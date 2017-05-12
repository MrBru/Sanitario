using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;
namespace WebAppMed3
{
    public class PazientiData
    {
        [DataContract]
        public class RootObject
        {
            [DataMember]
            public string cognome { get; set; }
            [DataMember]
            public string luogo { get; set; }
            [DataMember]
            public string cod_medico { get; set; }
            [DataMember]
            public string indirizzo { get; set; }
            [DataMember]
            public string mobile { get; set; }
            [DataMember]
            public string cod_fis { get; set; }
            [DataMember]
            public string nome { get; set; }
            [DataMember]
            public string provincia { get; set; }
            [DataMember]
            public string data_inserimento { get; set; }
            [DataMember]
            public string idPaziente { get; set; }
            [DataMember]
            public string data_update { get; set; }
            [DataMember]
            public string residenza { get; set; }
            [DataMember]
            public string cod_sanitario { get; set; }
            [DataMember]
            public string data_nascita { get; set; }
            [DataMember]
            public string telefono { get; set; }
            [DataMember]
            public string email { get; set; }
        }
    }
}