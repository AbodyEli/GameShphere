using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ServiceReference1;

public partial class Login : System.Web.UI.Page
{
    User user = new User();

    protected void Button1_Click(object sender, EventArgs e)
    {
        user.User_Email = TextBox1.Text;
        user.Password = TextBox2.Text;
        Service1Client srv = new Service1Client();
        if (srv.User_Login(user))
        {
            User UserInfo = new User();
           UserInfo= srv.GetUser(TextBox1.Text);
            Session["Login"] = "ok";
            
            Session["U_Email"] = TextBox1.Text;
            Session["User_id"] = UserInfo.id;
            Session["User_Name"] = UserInfo.User_Name;
            Response.Redirect("default.aspx");
            LblLoginTF.Text = "";
        }
        else
        {
            LblLoginTF.Text = "Invalid email or password, try again";
        }

    }
}