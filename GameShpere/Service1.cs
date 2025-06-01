using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using ViewModel;
using Model;

namespace GameShpere
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in both code and config file together.
    public class Service1 : IService1
    {
        GamesDB Gdb = new GamesDB();
        UserDB UD = new UserDB();
        CartDB CD = new CartDB();
        CreditCardDB CC = new CreditCardDB();
        OrdersDB OD = new OrdersDB();

        public DataSet GetDataSet(string SqlStr)
        {
            return Gdb.GetDataSet(SqlStr);
        }
        public int New_User(User user)
        {
            return UD.Add_User(user);
        }

        public bool User_Login(User user)
        {
            return UD.UserExist(user);
        }
        public int New_Cart(Cart cart)
        {
            return CD.Add_ToCart(cart);
        }
        public User GetUser(string email)
        {
            return UD.GetUserData(email);

        }
        public int Get_CartCount(int User_id)
        {
            return CD.Cart_Count(User_id);

        }
        public int Delete_from_cart(int Cart_id)
        {
            return CD.Delete_Game(Cart_id);
        }

        public int Quantity_Plus(int Cart_id)
        {
            return CD.Plus_One_Game(Cart_id);
        }
        public int Quantity_Minus(int Cart_id)
        {
            return CD.Minus_One_Game(Cart_id);
        }

        public bool CardValid(CreditCard visa)
        {
            return CC.CreditCardexsit(visa);
        }
        public int Add_Credit(string Card_number, double Total)
        {
            return CC.AddTotalToCart(Card_number,Total);
        }
        public int Add_Orders(Orders Order)
        {
            return OD.Add_GameOrder(Order);
        }

        public int UpdateCart(string User_Id ,string DT)
        {
            return OD.Update_Carts(User_Id, DT);
        }
    }
}

