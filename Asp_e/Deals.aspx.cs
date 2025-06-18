using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ServiceReference1;
using System.Data;


public partial class Deals : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Login"] != "ok")
            Response.Redirect("Default.aspx");
        else
        {

            if (!IsPostBack)
                bind_Datalist_Orders();
        }


    }
    protected void bind_Datalist_Orders()
    {
        Service1Client wrv = new Service1Client();
        string sqlst = "select * from orders where user_id=" + Session["user_id"];
        DataSet ds = new DataSet();
        ds = wrv.GetDataSet(sqlst);
        DLOrders.DataSource = ds;
        DLOrders.DataBind();
    }

    protected void bind_Datalist_Items()
    {
        Service1Client wrv = new Service1Client();
        string sqlst = "select * from cart where DateTime='" + Session["Date_Time"]+"'";
        DataSet ds = new DataSet();
        ds = wrv.GetDataSet(sqlst);
        DLItems.DataSource = ds;
        DLItems.DataBind();
    }

    protected void DLOrders_ItemCommand(object source, DataListCommandEventArgs e)
    {
        DLOrders.SelectedIndex = e.Item.ItemIndex;
        Session["Date_Time"] = DLOrders.DataKeys[e.Item.ItemIndex].ToString();
        bind_Datalist_Items();
    }

    public string GetImage(string ImageName)
    {
        Service1Client srv = new Service1Client();
        return srv.GetPic(ImageName);
    }
}



