using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using System.Data;

namespace ViewModel
{
   public class OrdersDB : DBFunctions
    {
        DBFunctions GameDB = new DBFunctions();
        public int Add_GameOrder(Orders Order)
        {
            string SqlStr = "insert into [orders] ([DateTime] ,[Username],[OrderPrice],[User_id]) values('" + Order.DateTime + "','" + Order.UserName + "'," + Order.OrderPrice + "," + Order.User_id +")";


            int x = GameDB.changetable(SqlStr, "DBGameSpherePJ.accdb");
            return 1;
        }

        public int Update_Carts(string User_id,string DT)
        {
            string SqlStr = "Update [Cart] set [DateTime] = '"+DT+"', [status] =0";
            SqlStr +=" where [User_Id] = " + User_id + " and [status] =1";

            int x = GameDB.changetable(SqlStr, "DBGameSpherePJ.accdb");
            return x;
        }
    }
}
