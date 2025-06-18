using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ServiceReference1;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        bind_Datalist_GamesGenre();
    }
    protected void bind_Datalist_GamesGenre()
    {
        Service1Client wrv = new Service1Client();
        string sqlst = "select * from Game_Genre";
        DataSet ds = new DataSet();
        ds = wrv.GetDataSet(sqlst);
        GamesGenre.DataSource = ds;
        GamesGenre.DataBind();
    }
    protected void bind_Datalist_Gamesln()
    {
        Service1Client wrv = new Service1Client();
        string sqlst = "select * from Games where Game_Genre_id="+Session["Game_Genre_id"].ToString();
        DataSet ds = new DataSet();
        ds = wrv.GetDataSet(sqlst);
        GamesIn.DataSource = ds;
        GamesIn.DataBind();
    }


    protected void Games_ItemCommand(object source, DataListCommandEventArgs e)
    {
        GamesGenre.SelectedIndex = e.Item.ItemIndex;
        Session["Game_Genre_id"] = GamesGenre.DataKeys[e.Item.ItemIndex].ToString();
        Session["Genre"] = ((LinkButton)e.Item.FindControl("LinkGamesName")).Text;

        bind_Datalist_Gamesln();
    }


    protected void GamesIn_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        Cart cartadd = new Cart();
        cartadd.Game_Name = ((Label)e.Item.FindControl("LblName2")).Text;
        cartadd.Game_Price =double.Parse(((Label)e.Item.FindControl("lblPrice2")).Text);
        cartadd.User_id =int.Parse(Session["User_id"].ToString());
        cartadd.Game_Img= "None.jpg";
        cartadd.Game_Genre = Session["Genre"].ToString();
        cartadd.Status = 1;
        cartadd.Quantity = 1;
        Service1Client wrv = new Service1Client();
        wrv.New_Cart(cartadd);
        Response.Redirect("default.aspx");
    }
    public string GetImage(string ImageName)
    {
        Service1Client srv = new Service1Client();
        return srv.GetPic(ImageName);
    }

}