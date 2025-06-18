using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ServiceReference1;
using System.Data;

public partial class MyCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Login"] != "ok")
            Response.Redirect("Default.aspx");
        else
        {
           
            if (!IsPostBack)
                bind_Datalist_Cart();
            LblTotal2.Text = LblTotal.Text;


        }
            
    }

    protected void bind_Datalist_Cart()
    {
        double total=0;
        Service1Client wrv = new Service1Client();
        string sqlst = "select * from Cart where User_id=" + Session["User_id"] ;
        DataSet ds = new DataSet();
        ds = wrv.GetDataSet(sqlst);
        DLCart.DataSource = ds;
        foreach (DataRow r in ds.Tables[0].Rows)
            total += int.Parse(r["Quantity"].ToString()) * (double.Parse(r["Game_Price"].ToString()));
        LblTotal.Text = total.ToString();
        DLCart.DataBind();
    }

    protected void DLCart_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        DLCart.SelectedIndex = e.Item.ItemIndex;
        int id = int.Parse(DLCart.DataKeys[e.Item.ItemIndex].ToString());
        Service1Client srv = new Service1Client();
        srv.Quantity_Plus(id);
        bind_Datalist_Cart();
        Response.Redirect("MyCart.aspx");
    }

    protected void DLCart_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        DLCart.SelectedIndex = e.Item.ItemIndex;
        int id = int.Parse(DLCart.DataKeys[e.Item.ItemIndex].ToString());
        Service1Client srv = new Service1Client();
        srv.Delete_from_cart(id);
        bind_Datalist_Cart();
        Response.Redirect("MyCart.aspx");
    }

    protected void DLCart_EditCommand(object source, DataListCommandEventArgs e)
    {
        DLCart.SelectedIndex = e.Item.ItemIndex;
        int id = int.Parse(DLCart.DataKeys[e.Item.ItemIndex].ToString());
        Service1Client srv = new Service1Client();
        int q =int.Parse(((Label)e.Item.FindControl("LblQuan")).Text);
        if (q > 1)
            srv.Quantity_Minus(id);
        bind_Datalist_Cart();
        Response.Redirect("MyCart.aspx");
    }

    protected void BtnBuy_Click(object sender, EventArgs e)
    {
        PnlCreditInfo.Visible = true;
    }

    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        PnlCreditInfo.Visible = false;
    }

    protected void BtnPay_Click(object sender, EventArgs e)
    {
        CreditCard crd = new CreditCard();
        Orders Order = new Orders();

        Order.User_id = Session["User_id"].ToString();
        Order.UserName = Session["User_Name"].ToString();
        Order.OrderPrice = double.Parse(LblTotal.Text);
        Order.DateTime = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss:fff");


        crd.Holder_Name = TxbHolderName.Text;
        crd.CardNumber = TxbCardNumber.Text;
        crd.Holder_id = TxbHolderId.Text;
        crd.Cvv = int.Parse(TxbCVV.Text);
        crd.valid = DDLMonth.SelectedValue + "/" + DDLYear.SelectedValue;
        Service1Client wrv = new Service1Client();
        if (wrv.CardValid(crd))
        {
            wrv.Add_Credit(TxbCardNumber.Text, double.Parse(LblTotal.Text));
            wrv.Add_Orders(Order);
            wrv.UpdateCart(Order.User_id.ToString(), Order.DateTime);
            PnlCreditInfo.Visible = false;
            LblError.Text = " ";
            bind_Datalist_Cart();
            Response.Redirect("Default.aspx");
        }
        else
        {
            LblError.Text = "not valid card info, check it again!! ";

        }
    }
        public string GetImage(string ImageName)
        {
            Service1Client srv = new Service1Client();
            return srv.GetPic(ImageName);
        }

    }
