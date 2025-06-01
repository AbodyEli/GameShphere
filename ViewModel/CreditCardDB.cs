using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Model;

namespace ViewModel
{
    public class CreditCardDB:DBFunctions
    {
        DBFunctions Gamesdb = new DBFunctions();
        public bool CreditCardexsit(CreditCard visa)
        {

            string sqlstr = "select * from [Credit_Cards_info] where [Holder_Name]='";
            sqlstr += visa.Holder_Name + "' and [Holder_id]='" + visa.Holder_id + "' and";
            sqlstr += " [valid]='" + visa.valid + "' and cvv='" + visa.Cvv + "' and CardNumber='" + visa.CardNumber + "'";
            DataSet ds = Gamesdb.Select(sqlstr, "DBGameSpherePJ.accdb");
            if (ds.Tables[0].Rows.Count > 0)
                return true;

            return false;

        }
        public int AddTotalToCart(string Card_Number, double Total)
        {
            string SqlStr = "Update [Credit_Cards_Info] set Total = Total+";
            SqlStr += Total + " where CardNumber ='" + Card_Number+"'";

            int x = Gamesdb.changetable(SqlStr, "DBGameSpherePJ.accdb");
            return x;
        }

    }
}
