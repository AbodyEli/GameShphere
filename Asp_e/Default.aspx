<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        
        
                .link-button-Black {
            font-size : larger;
    color: black;
    text-decoration: none;
     transition: color 0.25s ease;
      font-family: 'Roboto', sans-serif;

}
        .link-button-Black:hover{
            color:#7c7a7a;
            text-decoration: underline;
            
        }
        .BtnD{
            
             font-family: 'Roboto', sans-serif;
 color: black;
 cursor: pointer;
 border-radius: 4px;
  padding: 5px 10px;
            

        }

        .data-item {
              border: 1px solid rgba(0, 0, 0, 0.2); /* light gray border */
    border-radius: 6px;                  /* soft rounded corners */
    padding: 10px;                       /* optional spacing inside */
   
           
                
        }
        .LblStyle{
            font-family: 'Roboto', sans-serif;
        }
       

        .auto-style4 {
            height: 93px;
        }
        

        
        .auto-style6 {
            width: 858px;
        }
        

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table >
        <tr>
            <td style="vertical-align: top">
                <asp:DataList ID="GamesGenre" class="cata" Width="300px" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnItemCommand="Games_ItemCommand" Height="193px" DataKeyField="id">
                    <AlternatingItemStyle BackColor="#CCCCCC" />
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <ItemTemplate >
                        <table>
                            <tr>
                                <td>
                                    <asp:LinkButton cssclass="link-button-Black" ID="LinkGamesName" runat="server" CommandName="select" Text='<%#DataBinder.Eval(Container.DataItem,"Genre") %>'>LinkButton</asp:LinkButton>
                                </td>
                                
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#5a5a5a" Font-Bold="True" ForeColor="#FFFFFF" />

              
                </asp:DataList>
                <td class="auto-style6">
                <asp:DataList ID="GamesIn" runat="server" CellPadding="4" ForeColor="black" RepeatColumns="3" Height="197px" OnDeleteCommand="GamesIn_DeleteCommand" Width="1277px" >
                    <AlternatingItemStyle BackColor="#bbbaba" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="white" />
                    <SelectedItemStyle BackColor="#7c7a7a" Font-Bold="True" ForeColor="#7c7a7a" />
               <ItemTemplate>
                   <table class="data-item">
                       <tr>
                           <td>
                               <asp:Label cssclass="LblStyle" ID="LblName" runat="server" Text="Game Name"></asp:Label>
                           </td>
                           <td>
                               <asp:Label cssclass="LblStyle"  ID="LblName2" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Game_Name") %>'></asp:Label>
                           </td>
                           
                           <td rowspan="5" class="data-item">
                               <asp:Image ID="GameImg" runat="server" ImageUrl='<%#GetImage(Eval("IMAGE").ToString()) %>' Width="200px" Height="249px" />
                           </td>
                       </tr>
                        <tr>
                           <td>
                               <asp:Label cssclass="LblStyle"  ID="lblPrice" runat="server" Text="Game Price"></asp:Label>
                           </td>
                           <td>
                               <asp:Label cssclass="LblStyle"  ID="lblPrice2" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Game_Price") %>'></asp:Label>
                           </td>
                            </tr>
                       <tr>
                           <td>
                               <asp:Label cssclass="LblStyle"  ID="lblSize" runat="server" Text="Game size"></asp:Label>
                           </td>
                           <td>
                               <asp:Label cssclass="LblStyle"  ID="lblSize2" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Game_Size") %>'></asp:Label>
                           </td>
                            </tr>
                       <tr>
                           <td colspan="3">
                               <asp:TextBox ID="txbDescription" CssClass="textbox" runat="server" ReadOnly="true" Text='<%#DataBinder.Eval(Container.DataItem,"Description") %>' Height="24px" style="margin-right:250px"></asp:TextBox>
                           </td>
                       </tr>
                       <tr>
                           <td class="auto-style4">
                               <asp:Button ID="BtnAddToCart" CssClass="BtnD" Text="Add" runat="server" Enabled='<%#Session["Login"]== "ok" %>' Height="49px" Width="58px" CommandName="Delete" />
                           </td>
                       </tr>
                       <tr>
                           <td>
                               <asp:Label cssclass="LblStyle"  ID="LblLogin" runat="server" Text="You need to login first!" Visible='<%#Session["Login"] != "ok" %>' BorderColor="#CC0000" ForeColor="#CC0000"></asp:Label>
                           </td>
                       </tr>
                   </table>
               </ItemTemplate>
                    </asp:DataList>
            </td>

            
            
        </tr>
    </table>
</asp:Content>

