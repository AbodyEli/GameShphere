using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Data;
using ViewModel;
using Model;


namespace GameShpere
{

    [ServiceContract]
    public interface IService1
    {


        [OperationContract]
        DataSet GetDataSet(string SqlStr);

        [OperationContract]
        int New_User(User user);

        [OperationContract]
        bool User_Login(User user);

        [OperationContract]
        int New_Cart(Cart cart);

        [OperationContract]
        User GetUser(string email);

        [OperationContract]
        int Get_CartCount(int User_id);

        [OperationContract]
        int Delete_from_cart(int Cart_id);
        [OperationContract]

        int Quantity_Minus(int Cart_id);

        [OperationContract]
        int Quantity_Plus(int Cart_id);

        [OperationContract]
        bool CardValid(CreditCard visa);

        [OperationContract]
        int Add_Credit(string Card_number, double Total);

        [OperationContract]
        int Add_Orders(Orders Order);

        [OperationContract]
        int UpdateCart(string User_Id, string DT);


    }
   

}

    
    
