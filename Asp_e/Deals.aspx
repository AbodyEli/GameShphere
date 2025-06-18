<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Deals.aspx.cs" Inherits="Deals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>
                <asp:DataList ID="DLOrders" runat="server" Height="340px" Width="179px" DataKeyField="DateTime" OnItemCommand="DLOrders_ItemCommand">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lblDateTime" runat="server" Text="Time Of Order"></asp:Label>
                                </td>
                                <td>
                                    <asp:LinkButton ID="LnkOrderTime" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"DateTime")%>' CommandName="select"></asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblPrice" runat="server" Text="Order Price :"></asp:Label>
                                </td>
                                <td>
                                  <asp:Label ID="lblPrice2" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"OrderPrice")%>'></asp:Label>
                                </td>
                            </tr>
                              <tr>
                                <td>
                                    <asp:Label ID="lblUserName" runat="server" Text="User Name:"></asp:Label>
                                </td>
                                <td>
                                  <asp:Label ID="lblUserName2" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"UserName")%>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </td>
 
            <td>
                <asp:DataList ID="DLItems" runat="server" Height="1057px" Width="549px" CellPadding="4" ForeColor="#333333" >
                    
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#E3EAEB" />
                    
                        <ItemTemplate>
                        <table>
                            
                       <tr>
                          
                           <td>
                               <asp:Label ID="LblGenre" runat="server" Text="Game Genre"></asp:Label>
                           </td>
                           <td>
                               <asp:Label ID="LblGenre2" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Game_Genre") %>'></asp:Label>
                           </td>
                           <td rowspan="4">
                               <asp:Image ID="GameImg"  ImageUrl='<%#GetImage(Eval("IMAGE").ToString()) %>' runat="server" Width="200" />
                           </td>
                       </tr>
                        <tr>
                           <td>
                               <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                           </td>
                           <td>
                               <asp:Label ID="lblName2" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Game_Name") %>'></asp:Label>
                           </td>
                            </tr>
                       <tr>
                           <td>
                               <asp:Label ID="lblPrice" runat="server" Text="Game size"></asp:Label>
                           </td>
                           <td>
                               <asp:Label ID="lblPrice2" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Game_Price") %>'></asp:Label>
                           </td>
                            </tr>
                            <tr>
                           <td>
                               <asp:Label ID="lblQuantity1" runat="server" Text="Quantity"></asp:Label>
                           </td>
                           <td>
                               <asp:Label ID="lblQuantity2" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"quantity") %>'></asp:Label>
                           </td>
                            </tr>
                       
                   </table>
                    </ItemTemplate>

                        <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />

                </asp:DataList>
            </td>
        </tr>
    </table>
</asp:Content>

