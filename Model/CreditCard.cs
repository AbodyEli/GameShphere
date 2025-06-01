using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
   public class CreditCard
    {
        public string Holder_Name { get; set; }
        public string Holder_id { get; set; }
        public string valid { get; set; }
        public int Cvv { get; set; }
        public string CardNumber { get; set; }
        public double Total { get; set; }
        
    }
}
