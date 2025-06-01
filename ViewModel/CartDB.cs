using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using System.Data;


namespace ViewModel
{
   public class CartDB : DBFunctions
    {
        DBFunctions GameDB = new DBFunctions();
        public int Add_ToCart(Cart cart)
        {
            string SqlStr = "insert into [Cart]([Game_Genre],[Game_Name],[Game_Price],[Game_Img],[User_id],[Status],[Quantity]) values('" + cart.Game_Genre + "','" + cart.Game_Name + "'," + cart.Game_Price  + ",'" + cart.Game_Img + "'," + cart.User_id +"," + cart.Status+","+cart.Quantity+")";


            int x = GameDB.changetable(SqlStr, "DBGameSpherePJ.accdb");
            return 1;
        }
        public int Cart_Count (int User_id)
        {
            int c = 0;
            string SqlStr = "select * from [Cart] where User_id=" + User_id + " and status=1";
            DataSet GS = GameDB.Select(SqlStr, "DBGameSpherePJ.accdb");
            c = GS.Tables[0].Rows.Count;
                return c;

        }
        public int Delete_Game(int Cart_id)
        {
            string SqlStr = "Delete * from [Cart] where id=" + Cart_id;
            int x = GameDB.changetable(SqlStr, "DBGameSpherePJ.accdb");
            return x;
        }
        public int Plus_One_Game(int Cart_id)
        {
            string SqlStr = "Update [Cart] set Quantity = Quantity+1 where id=" + Cart_id;
            int x = GameDB.changetable(SqlStr, "DBGameSpherePJ.accdb");
            return x;
        }
        public int Minus_One_Game(int Cart_id)
        {
            string SqlStr = "Update [Cart] set Quantity = Quantity-1 where id=" + Cart_id;
            int x = GameDB.changetable(SqlStr, "DBGameSpherePJ.accdb");
            return x;
        }

    }
}
