using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net; //serve per webclient
using System.Text;
using System.Runtime.Serialization.Json;
using System.IO;
using WebAppMed3;

namespace ProvaJson
{
    public class PatologieApiClient
    {

        public static void getApi()
        {
            var url = "patologie.json"; //manca la url delle api
              var syncClient = new WebClient();
            var content = syncClient.DownloadString(url);

             DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(PatologieData));
            using (var ms = new MemoryStream(Encoding.Unicode.GetBytes(content)))
             {
            var weatherData = (PatologieData)serializer.ReadObject(ms);
            }

        }
    }
}