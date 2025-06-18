using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ServiceReference1;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Login"] == "ok")
        {
           
            Service1Client wrv = new Service1Client();
            int x = wrv.Get_CartCount(int.Parse(Session["User_id"].ToString()));
            LnkCart.Text = "My Cart(" + x + ")";
            LblInfoUser.Text = "wellcome " + Session["User_Name"].ToString();
            LnkLogin.Text = "LogOut";
            LnkLogin.PostBackUrl = "~/LogOut.aspx";
        }

        else
        {
            LblInfoUser.Text = "Login Please or Register ";
            LnkLogin.Text = "Login";
            LnkLogin.PostBackUrl = "~/Login.aspx";
        }
    }

    protected void LnkPc_Click(object sender, EventArgs e)
    {

    }
}
