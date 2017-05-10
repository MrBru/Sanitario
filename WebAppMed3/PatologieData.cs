using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;


namespace WebAppMed3
{
    public class PatologieData
    {
        [DataContract]
        public class Patologie
        {
            [DataMember]
            public string nome { get; set; }
            [DataMember]
            public string descrizione { get; set; }
            [DataMember]
            public string codice { get; set; }
        }

        public class RootObject
        {
            public List<Patologie> patologie { get; set; }
        }

    }
}