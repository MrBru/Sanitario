using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebAppMed3
{
    public class PazientiController : ApiController
    {
        [HttpGet]
        public string[] GetListPazienti() {

            String[] s = new String[2];
            //s[0] = "a";
            //s[1] = "b";

            s[0] = "{'a': }";
            return s;

            //return "{data: [\"a\", \"b\" ]}";
        }
    }
}