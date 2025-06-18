<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .auto-style3 {
            width: 278px;
            height: 43px;
        }
        
        .Lnk-Button{
                    font-size : larger;
color: black;
text-decoration: none;
 transition: color 0.25s ease;
  font-family: 'Roboto', sans-serif;
        }
        .Lnk-Button:hover{
            color:#7c7a7a;
            text-decoration: underline;
            
        }
         .BtnD{
     font-family: 'Roboto', sans-serif;
     color: black;
     border-color: black;
 }
       


        .auto-style4 {
            height: 36px;
        }
       
        
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

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style3">
        <tr>
            <td class="auto-style4">
                <table style="background-color: #CCCCCC" >
                    <tr>
                        <td >
                            <asp:TextBox BorderColor="black" ID="TxbNewGamesGenre" runat="server" Width="100"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="BtnAddGame" cssclass="BtnD" runat="server" Text="Add Game" OnClick="BtnAddGame_Click" />
                        </td>
                    </tr>
                </table>
            </td>
            <td class="auto-style4">
                <table class="data-item">
                       <tr>
                           <td>
                               <asp:Label cssclass="LblStyle" ID="LblName" runat="server" Text="Game Name"></asp:Label>
                           </td>
                           <td>
                               <asp:TextBox ID="TxbNameT" runat="server" Text=""></asp:TextBox>
                           </td>
                           
                           <td rowspan="5">
                               <asp:Image class="data-item" ID="GameImg"  runat="server" Width="200px" Height="251px" />
                           </td>
                       </tr>
                        <tr>
                           <td>
                               <asp:Label CssClass="LblStyle" ID="lblPrice" runat="server" Text="Game Price"></asp:Label>
                           </td>
                           <td>
                               <asp:TextBox ID="TxbPrice" runat="server" Text=" "></asp:TextBox>
                           </td>
                            </tr>
                       <tr>
                           <td>
                               <asp:Label CssClass="LblStyle" ID="lblSize" runat="server" Text="Game size"></asp:Label>
                           </td>
                           <td>
                               <asp:TextBox ID="TxbSize" runat="server" Text=""></asp:TextBox>
                           </td>
                            </tr>
                       <tr>
                           <td colspan="3" >
                               <asp:TextBox style=" margin-right:130px;" ID="txbDescription" CssClass="textbox" runat="server" ReadOnly="true" Text='' Height="24px"></asp:TextBox>
                           </td>
                       </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Button style=" margin-right:130px;" ID="BtnAddNewGame" runat="server" Text="Add Game" OnClick="BtnAddNewGame_Click" />
                        </td>
                    </tr>
                    </table>
            </td>
            
        </tr>
        <tr>
            <td style="vertical-align: top">
                <asp:DataList ID="GamesGenre" class="cata" Width="300px" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnItemCommand="Games_ItemCommand" Height="263px" DataKeyField="id" OnCancelCommand="GamesGenre_CancelCommand" OnDeleteCommand="GamesGenre_DeleteCommand" OnEditCommand="GamesGenre_EditCommand" OnUpdateCommand="GamesGenre_UpdateCommand">
                    <AlternatingItemStyle BackColor="#CCCCCC" />
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <ItemTemplate>
                        <table class="auto-style3" >
                            <tr>
                                <td>
                                    <asp:LinkButton ID="LinkGamesName" CssClass="Lnk-Button" runat="server" CommandName="select" Text='<%#DataBinder.Eval(Container.DataItem,"Genre") %>' OnClick="LinkGamesName_Click">LinkButton</asp:LinkButton>
                                </td>
                                <td style="text-align: center">
                                    <asp:LinkButton ID="LnkEdit" CssClass="Lnk-Button" CommandName="Edit" runat="server">Edit</asp:LinkButton>
                                </td>
                                
                            </tr>
                        </table>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <table class="auto-style3">
                            <tr>
                                <td>
                                    <asp:TextBox ID="TxbGamesGenre" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Genre") %>'></asp:TextBox>
                                </td>
                                <td>
                                    <asp:LinkButton ID="LnkUpdate" CssClass="Lnk-Button" runat="server" CommandName="update">Update</asp:LinkButton>&nbsp;&nbsp;
                                    <asp:LinkButton ID="LnkDelete" CssClass="Lnk-Button" runat="server" CommandName="delete">Delete</asp:LinkButton>&nbsp;&nbsp;
                                    <asp:LinkButton ID="LnkCancel" CssClass="Lnk-Button" runat="server" CommandName="cancel">Cancel</asp:LinkButton>&nbsp;&nbsp;
                                </td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                    <SelectedItemStyle BackColor="Silver" Font-Bold="True" ForeColor="White" />
              
                </asp:DataList>
                <td>
                <asp:DataList ID="GamesIn" runat="server" CellPadding="4" ForeColor="#333333" RepeatColumns="2" Height="301px" OnCancelCommand="GamesIn_CancelCommand" OnEditCommand="GamesIn_EditCommand" OnUpdateCommand="GamesIn_UpdateCommand" OnDeleteCommand="GamesIn_DeleteCommand" DataKeyField="id" >
                    <AlternatingItemStyle BackColor="White" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="#EFF3FB" />
                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
               <ItemTemplate>
                   <table class="data-item">
                       <tr>
                           <td>
                               <asp:Label CssClass="LblStyle" ID="LblName" runat="server" Text="Game Name"></asp:Label>
                           </td>
                           <td>
                               <asp:Label CssClass="LblStyle"  ID="LblName2" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Game_Name") %>'></asp:Label>
                           </td>
                           
                           <td rowspan="5">
                               <asp:Image class="data-item" ID="GameImg" ImageUrl='<%#GetImage(Eval("IMAGE").ToString()) %>' runat="server" Width="200px" Height="135px" />
                           </td>
                       </tr>
                        <tr>
                           <td>
                               <asp:Label CssClass="LblStyle"  ID="lblPrice" runat="server" Text="Game Price"></asp:Label>
                           </td>
                           <td>
                               <asp:Label CssClass="LblStyle"  ID="lblPrice2" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Game_Price") %>'></asp:Label>
                           </td>
                            </tr>
                       <tr>
                           <td>
                               <asp:Label CssClass="LblStyle"  ID="lblSize" runat="server" Text="Game size"></asp:Label>
                           </td>
                           <td>
                               <asp:Label CssClass="LblStyle"  ID="lblSize2" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Game_Size") %>'></asp:Label>
                           </td>
                            </tr>
                       <tr>
                           <td colspan="3">
                               <asp:TextBox style=" margin-right:160px;" ID="txbDescription" CssClass="textbox" runat="server" ReadOnly="true" Text='<%#DataBinder.Eval(Container.DataItem,"Description") %>' Height="24px"></asp:TextBox>
                           </td>
                       </tr>
                       <tr>
                           <td class="auto-style4" colspan="3">
                                <asp:LinkButton ID="LnkEdit" CssClass="Lnk-Button" CommandName="Edit" runat="server">Edit</asp:LinkButton>
                               <td>

                           </td>
                       </tr>
                       
                   </table>
               </ItemTemplate>

                    <EditItemTemplate>
                        
                   <table class="data-item">
                       <tr>
                           <td>
                               <asp:Label cssclass="LblStyle" ID="LblName" runat="server" Text="Game Name"></asp:Label>
                           </td>
                           <td>
                               <asp:TextBox ID="TxbName" runat="server" Text=''></asp:TextBox>
                           </td>
                           
                           <td rowspan="5">
                               <asp:Image class="data-item" ID="GameImg" runat="server" Width="200px" Height="135px" />
                           </td>
                       </tr>
                        <tr>
                           <td>
                               <asp:Label CssClass="LblStyle" ID="lblPrice" runat="server" Text="Game Price"></asp:Label>
                           </td>
                           <td>
                               <asp:TextBox ID="TxbPrice" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Game_Price") %>'></asp:TextBox>
                           </td>
                            </tr>
                       <tr>
                           <td>
                               <asp:Label CssClass="LblStyle" ID="lblSize" runat="server" Text="Game size"></asp:Label>
                           </td>
                           <td>
                               <asp:TextBox ID="TxbSize" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Game_Size") %>'></asp:TextBox>
                           </td>
                            </tr>
                       <tr>
                           <td colspan="3">
                               <asp:TextBox style=" margin-right:160px;" ID="txbDescription" CssClass="textbox" runat="server" ReadOnly="true" Text='<%#DataBinder.Eval(Container.DataItem,"Description") %>' Height="24px"></asp:TextBox>
                           </td>
                       </tr>
                       <tr>
                           <td class="auto-style4" colspan="3">
                               <asp:LinkButton ID="LnkUpdate" CssClass="Lnk-Button" runat="server" CommandName="update">Update</asp:LinkButton>&nbsp;&nbsp;
                                    <asp:LinkButton ID="LnkDelete" CssClass="Lnk-Button" runat="server" CommandName="delete">Delete</asp:LinkButton>&nbsp;&nbsp;
                                    <asp:LinkButton ID="LnkCancel" CssClass="Lnk-Button" runat="server" CommandName="cancel">Cancel</asp:LinkButton>&nbsp;&nbsp;


                           </td>
                       </tr>
                       
                   </table>
               
                    </EditItemTemplate>
                    </asp:DataList>
            </td>

            
            
        </tr>
    </table>
</asp:Content>

