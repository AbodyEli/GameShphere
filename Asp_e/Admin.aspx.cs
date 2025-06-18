using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ServiceReference1;

public partial class Admin : System.Web.UI.Page
{
    Service1Client srv = new Service1Client();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
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
        string sqlst = "select * from Games where Game_Genre_id=" + Session["Game_Genre_id"].ToString();
        DataSet ds = new DataSet();
        ds = wrv.GetDataSet(sqlst);
        GamesIn.DataSource = ds;
        GamesIn.DataBind();
    }


    protected void Games_ItemCommand(object source, DataListCommandEventArgs e)
    {
        GamesGenre.SelectedIndex = e.Item.ItemIndex;
        Session["Game_Genre_id"] = GamesGenre.DataKeys[e.Item.ItemIndex].ToString();
        

        bind_Datalist_Gamesln();
    }

    protected void LinkGamesName_Click(object sender, EventArgs e)
    {

    }

    protected void GamesGenre_EditCommand(object source, DataListCommandEventArgs e)
    {
        GamesGenre.EditItemIndex = e.Item.ItemIndex;
        bind_Datalist_GamesGenre();
    }

    protected void GamesGenre_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        int Game_id= int.Parse(GamesGenre.DataKeys[e.Item.ItemIndex].ToString());
        Service1Client srv = new Service1Client();
        Genre x = new Genre();
        srv.Delete_Genre(Game_id);
        GamesGenre.EditItemIndex= -1;
        bind_Datalist_Gamesln(); 
    }

    protected void GamesGenre_CancelCommand(object source, DataListCommandEventArgs e)
    {
        GamesGenre.EditItemIndex = -1;
        bind_Datalist_GamesGenre();
    }

    protected void GamesGenre_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        Genre x = new Genre();
        x.Genre_Name= ((TextBox)e.Item.FindControl("TxbGamesGenre")).Text;
        x.Genre_id = int.Parse(GamesGenre.DataKeys[e.Item.ItemIndex].ToString());
        srv.Update_Genre(x);
        GamesGenre.EditItemIndex = -1;
        bind_Datalist_GamesGenre();
    }

    protected void GamesIn_CancelCommand(object source, DataListCommandEventArgs e)
    {
        GamesIn.EditItemIndex = -1;
        bind_Datalist_Gamesln();
    }

    protected void GamesIn_EditCommand(object source, DataListCommandEventArgs e)
    {
        GamesIn.EditItemIndex = e.Item.ItemIndex;
        bind_Datalist_Gamesln();
    }



    protected void BtnAddGame_Click(object sender, EventArgs e)
    {
        Service1Client srv = new Service1Client();
        Genre x = new Genre();
        x.Genre_Name = TxbNewGamesGenre.Text;
        srv.Add_Genre(x);
        bind_Datalist_GamesGenre();
    }

    protected void BtnAddNewGame_Click(object sender, EventArgs e)
    {
        Service1Client srv = new Service1Client();
        Game x = new Game();
        x.Game_Name = TxbNameT.Text;
        x.Game_Price = double.Parse(TxbPrice.Text);
        x.Game_size = TxbSize.Text;
        x.Description = txbDescription.Text;
        x.Game_Genre_id = int.Parse(Session["Game_Genre_id"].ToString());
       
        srv.Add_NewGameT(x);
        bind_Datalist_GamesGenre();
    }


    protected void GamesIn_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        Game G = new Game();
        G.Game_id = int.Parse(GamesIn.DataKeys[e.Item.ItemIndex].ToString());
        G.Game_Name= ((TextBox)e.Item.FindControl("TxbName")).Text;
        G.Game_size = ((TextBox)e.Item.FindControl("TxbSize")).Text; 
        G.Description = ((TextBox)e.Item.FindControl("txbDescription")).Text;
        G.Game_Price =double.Parse(((TextBox)e.Item.FindControl("TxbPrice")).Text);
        G.Game_Genre_id =int.Parse( Session["Game_Genre_id"].ToString());
        Service1Client srv = new Service1Client();
        srv.Update_GameT(G);
        GamesGenre.EditItemIndex = -1;
        bind_Datalist_Gamesln();
    }

    protected void GamesIn_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        int Game_id = int.Parse(GamesIn.DataKeys[e.Item.ItemIndex].ToString());
        srv.Delete_Game(Game_id);
        GamesIn.EditItemIndex = -1;
        bind_Datalist_Gamesln();
    }
    public string GetImage(string ImageName)
    {
        Service1Client srv = new Service1Client();
        return srv.GetPic(ImageName);
    }
}
