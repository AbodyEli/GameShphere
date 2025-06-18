using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ServiceReference1;


public partial class Registration : System.Web.UI.Page
{
    User user = new User();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Butregister_Click(object sender, EventArgs e)
    {
        user.User_Name = Txbname.Text;
        user.User_Email = Txtemail.Text;
        user.User_id = TxbID.Text;
        user.Age = int.Parse(Txbage.Text);
        
        user.Password = Txbpass.Text;
        Service1Client wrv = new Service1Client();
        int x;
        x = wrv.New_User(user);
        if (x == 1)
        {
            LblInfo.Text = "user added succesfully";
           
        }
        else
            LblInfo.Text = "Error";
    }
}