<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            height: 51px;
        }
        .auto-style5 {
            height: 246px;
            width: 388px;
        }
        .LblStyle{
    font-family: 'Roboto', sans-serif;
    font-size:larger;
  }
        .auto-style6 {
            height: 377px;
        }
        .BtnD {
            font-family: 'Roboto', sans-serif;
            color: black;
            cursor: pointer;
            border-radius: 4px;
             padding: 5px 10px;
             
        }
              .TdStyle {
          text-align:center;
          height: 50px;
          border-style: solid;
          border-width: 3px;
          margin-left: 0px;
          background-color: grey;
           border: 2px solid #333;
padding: 10px;
          
      }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center class="auto-style6">
    <table class="auto-style5" style="background-color: grey; border-style: solid; text-align: center; border-color:black;">
        <tr>
            <td colspan="2" class="TdStyle">
                <asp:Label ID="LblMain" CssClass="LblStyle" runat="server" Text="Login Form" Font-Size="XX-Large" Font-Bold="True" ForeColor="black"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="vertical-align: top;" class="TdStyle">
                <asp:Label ID="LblUsername" CssClass="LblStyle" runat="server" Text="User Name:" ></asp:Label></td>
            <td class="TdStyle" >
                <asp:TextBox ID="TextBox1" Width="190px" runat="server" Height="33px" style="border: 2px solid #333; font-size:large;"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RFVUserEmail" runat="server" ErrorMessage="please enter an email" ForeColor="Red" ValidationGroup="Login" CssClass="LblStyle" ControlToValidate="TextBox1"></asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REVUserEmail" runat="server" ErrorMessage="Enter a valid email" ForeColor="Red" ValidationGroup="Login" CssClass="LblStyle" ControlToValidate="TextBox1" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
         <tr>
            <td class="TdStyle" style="vertical-align: top;">
                <asp:Label ID="LblPassword"  CssClass="LblStyle" runat="server" Text="Password:"></asp:Label></td>
            <td class="TdStyle">
                <asp:TextBox ID="TextBox2"  TextMode="Password" Width="190px" runat="server" Height="33px" style="border: 2px solid #333;font-size:large;"></asp:TextBox><br />
                 <asp:RequiredFieldValidator ID="RFVPass" runat="server" ErrorMessage="please enter a password" ForeColor="Red" ValidationGroup="Login" CssClass="LblStyle" ControlToValidate="TextBox2"></asp:RequiredFieldValidator><br />
                
            </td>
        </tr>
        <tr>
            <td colspan="2" class="TdStyle">
                <asp:Button ID="Button1" CssClass="BtnD" ValidationGroup="Login"  runat="server" Text="Login" OnClick="Button1_Click" Height="38px" Width="91px" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="LblLoginTF" runat="server" Text=" " Font-Size="X-Large" ForeColor="#CC0000"></asp:Label>
            </td>
        </tr>
    </table>
        </center>
</asp:Content>
