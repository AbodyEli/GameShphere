<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyCart.aspx.cs" Inherits="MyCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 374px;
        }
        .auto-style4 {
            width: 400px;
            height: 450px;
            position: absolute;
            top: 252px;
            left: 984px;
            z-index: 1;
        }
        .auto-style5 {
            height: 53px;
        }
        
        .auto-style6 {
            height: 71px;
        }
        .auto-style7 {
            height: 42px;
        }
        .auto-style8 {
            height: 46px;
        }
        .LblStyle {
            font-family: 'Roboto', sans-serif;
        }
            .btn{
       
font-family: 'Roboto', sans-serif;
color: black;
cursor: pointer;
border-radius: 4px;
 padding: 4px 10px;
           
    }
    </style>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <table>
        <tr>
                                <td>
                               <asp:Label ID="LblTotal" CssClass="LblStyle" runat="server" Text=" " Font-Size="Larger"></asp:Label>
                               <asp:Label ID="LblCurrency" CssClass="LblStyle" runat="server" Text="ILS" Font-Size="Larger"></asp:Label>
                                <asp:Button ID="BtnBuy" CssClass="btn" runat="server" Text="Check-out" OnClick="BtnBuy_Click" Width="100px" Height="31px" />
                           </td>
        <tr>
            <td class="auto-style3">
                <asp:DataList ID="DLCart" runat="server" OnDeleteCommand="DLCart_DeleteCommand" OnUpdateCommand="DLCart_UpdateCommand" OnEditCommand="DLCart_EditCommand" DataKeyField="id">
                    <ItemTemplate>
                        <table>
                            
                       <tr>
                          
                           <td>
                               <asp:Label ID="LblGenre" CssClass="LblStyle" runat="server" Text="Game Genre"></asp:Label>
                           </td>
                           <td>
                               <asp:Label ID="LblGenre2" CssClass="LblStyle" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Game_Genre") %>'></asp:Label>
                           </td>
                           <td rowspan="3">
                               <asp:Image ID="GameImg" ImageUrl='<%#GetImage(Eval("IMAGE").ToString()) %>' runat="server" Width="200" />
                           </td>
                       </tr>
                        <tr>
                           <td>
                               <asp:Label ID="lblName" CssClass="LblStyle" runat="server" Text=""></asp:Label>
                           </td>
                           <td>
                               <asp:Label ID="lblName2" CssClass="LblStyle" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Game_Name") %>'></asp:Label>
                           </td>
                            </tr>
                       <tr>
                           <td>
                               <asp:Label ID="lblPrice" CssClass="LblStyle" runat="server" Text="Game size"></asp:Label>
                           </td>
                           <td>
                               <asp:Label ID="lblPrice2" CssClass="LblStyle" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Game_Price") %>'></asp:Label>
                           </td>
                            </tr>
                       <tr>
                           <td>
                               <asp:Button ID="BtnDel" CssClass="btn" CommandName="delete" runat="server" Text="Delete" />
                           </td>
                          
                           <td>
                               <asp:Button ID="BtnMinus" CssClass="btn" runat="server" CommandName="edit" Text="-" Font-Size="Larger"/>
                               <asp:Label ID="LblQuan" CssClass="LblStyle" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"quantity") %>' Font-Size="Larger"></asp:Label>
                               <asp:Button ID="BtnPlus" CssClass="btn"  runat="server" Text="+" CommandName="Update" Font-Size="Larger"/>
                           </td>
                       </tr>
                   </table>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
    </table>
        </center>
    <asp:Panel ID="PnlCreditInfo" runat="server" BackColor="LightBlue" BorderStyle="Solid" CssClass="auto-style4" Visible="False">
        <table>
            <tr>
                <td>
                    <asp:Label ID="Lbl" CssClass="LblStyle" runat="server" Text="Credit card info" Font-Size="X-Large"></asp:Label>
                </td>
                <td style="text-align: right">
                    <asp:Button ID="BtnCancel" CssClass="btn" runat="server" Text="X" BackColor="LightBlue" OnClick="BtnCancel_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LblHolderName" CssClass="LblStyle" runat="server" Text="Name :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxbHolderName" runat="server"></asp:TextBox><br />
                    <asp:RequiredFieldValidator CssClass="LblStyle" ID="RFVName" runat="server" ErrorMessage="Enter Card Holder name" ControlToValidate="TxbHolderName" ForeColor="Red" ValidationGroup="Validation"></asp:RequiredFieldValidator>
                </td>
            </tr>
             <tr>
                <td class="auto-style5">
                    <asp:Label ID="LblCardNumber" CssClass="LblStyle" runat="server" Text="Card Number :"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="TxbCardNumber" runat="server"></asp:TextBox><br />
                    <asp:RequiredFieldValidator CssClass="LblStyle" ID="RFVCardNumber" runat="server" ErrorMessage="Enter Card Number" ControlToValidate="TxbCardNumber" ForeColor="Red" ValidationGroup="Validation"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator CssClass="LblStyle" ID="REVCardNumber" runat="server" ErrorMessage="Enter a Valid Card Number " ControlToValidate="TxbCardNumber" ForeColor="Red" ValidationExpression="\d{12}" ValidationGroup="Validation"></asp:RegularExpressionValidator>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="LblHolderId" CssClass="LblStyle" runat="server" Text="Holder Id :" ></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxbHolderId" runat="server" Height="22px" Width="128px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator CssClass="LblStyle" ID="RFVHolderID" runat="server" ErrorMessage="Enter The holder Id" ControlToValidate="TxbHolderId" ForeColor="Red" ValidationGroup="Validation"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator CssClass="LblStyle" ID="REVHolderID" runat="server" ErrorMessage="Enter a Valid Id " ControlToValidate="TxbHolderId" ForeColor="Red" ValidationExpression="\d{9}" ValidationGroup="Validation"></asp:RegularExpressionValidator>
                </td>
            </tr>
             <tr>
                <td class="auto-style8">
                    <asp:Label ID="LblValidityDate" CssClass="LblStyle" runat="server" Text="Validity Date :"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:DropDownList ID="DDLMonth" runat="server">
                        <asp:ListItem Value="01">1</asp:ListItem>
                        <asp:ListItem Value="02">2</asp:ListItem>
                        <asp:ListItem Value="03">3</asp:ListItem>
                        <asp:ListItem Value="04">4</asp:ListItem>
                        <asp:ListItem Value="05">5</asp:ListItem>
                        <asp:ListItem Value="06">6</asp:ListItem>
                        <asp:ListItem Value="07">7</asp:ListItem>
                        <asp:ListItem Value="08">8</asp:ListItem>
                        <asp:ListItem Value="09">9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>&nbsp;&nbsp;
                    <asp:DropDownList ID="DDLYear" runat="server">
                        <asp:ListItem>2025</asp:ListItem>
                        <asp:ListItem>2026</asp:ListItem>
                        <asp:ListItem>2027</asp:ListItem>
                        <asp:ListItem>2028</asp:ListItem>
                        <asp:ListItem>2029</asp:ListItem>
                        <asp:ListItem>2030</asp:ListItem>
                        <asp:ListItem>2031</asp:ListItem>
                        <asp:ListItem>2032</asp:ListItem>
                        <asp:ListItem>2033</asp:ListItem>
                        <asp:ListItem>2034</asp:ListItem>
                        <asp:ListItem>2035</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="LblCVV" CssClass="LblStyle" runat="server" Text="CVV :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxbCVV" runat="server"></asp:TextBox><br />
                    <asp:RequiredFieldValidator CssClass="LblStyle" ID="RFVCVV" runat="server" ErrorMessage="Enter The card's CVV " ControlToValidate="TxbCVV" ForeColor="Red" ValidationGroup="Validation"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator CssClass="LblStyle" ID="REVCVV" runat="server" ErrorMessage="Enter a Valid CVV" ControlToValidate="TxbCVV" ForeColor="Red" ValidationExpression="\d{3}" ValidationGroup="Validation"></asp:RegularExpressionValidator>
                </td>
            </tr>
             <tr>
                <td class="auto-style7">
                    <asp:Label ID="LblTotal1" CssClass="LblStyle" runat="server" Text="Total :"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="LblTotal2" CssClass="LblStyle" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style6">
                    <asp:Button CssClass="btn" ID="BtnPay" runat="server" Text="Buy" OnClick="BtnPay_Click" Width="60px" ValidationGroup="Validation" /><br />
                    <asp:Label ID="LblError" CssClass="LblStyle" runat="server" Text=""></asp:Label>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

