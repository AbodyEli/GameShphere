using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using System.Data;

namespace ViewModel
{
    public class UserDB : DBFunctions
    {
        DBFunctions Gamesdb = new DBFunctions();

        public int Add_User(User user)
        {
            string SqlStr = "insert into [Users]([User_Name],[User_Email],[User_id],[User_Address],[User_Age],[Password]) values('" + user.User_Name + "','" + user.User_Email + "','" + user.User_id + "','" + user.User_Address + "'," + user.Age + ",'" + user.Password + "')";


            int x = Gamesdb.changetable(SqlStr, "DBGameSpherePJ.accdb");
            return 1;
        }
        public bool UserExist(User user)
        {
            string SqlStr = "select * from [users] where [user_Email]='";
            SqlStr += user.User_Email + "' and Password='" + user.Password + "'";
            DataSet ds = Gamesdb.Select(SqlStr, "DBGameSpherePJ.accdb");
            if (ds.Tables[0].Rows.Count > 0)
                return true;
            return false;

        }
        public User GetUserData(string email)
        {
            string SqlStr = "select * from [users] where [user_Email]='" + email + "'";
            DataSet ds = Gamesdb.Select(SqlStr, "DBGameSpherePJ.accdb");
            User user = new User();

            user.id =int.Parse( ds.Tables[0].Rows[0]["id"].ToString());
            user.User_Name = ds.Tables[0].Rows[0]["User_Name"].ToString();
            user.User_Email = ds.Tables[0].Rows[0]["User_Email"].ToString();
            user.User_Address = ds.Tables[0].Rows[0]["User_Address"].ToString();
            user.Age = int.Parse(ds.Tables[0].Rows[0]["User_Age"].ToString());
            user.User_id = ds.Tables[0].Rows[0]["User_id"].ToString();
            user.Password = ds.Tables[0].Rows[0]["Password"].ToString();

            return user;
        }
    }
}
