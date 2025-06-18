<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        
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
        .Val{
            font-family: 'Roboto', sans-serif;

        }

        
        .ColTble{
    border-collapse: collapse;
  border-spacing: 0;
    margin: 0 auto;
}

        .btn{
           
    font-family: 'Roboto', sans-serif;
    color: black;
    cursor: pointer;
    border-radius: 4px;
     padding: 5px 10px;
               border-color: black;
        }

       
       
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
 
    
   
    
 
    
    <table Class="ColTble">
        
        <tr>
            <td colspan="3" class="TdStyle" >
        <asp:Label ID="Lblregistertitle" runat="server" Text="Register To The Store" Font-Bold="True" Font-Underline="False" Font-Size="XX-Large" cssclass="Val"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="TdStyle" >
                <asp:Label ID="LblUsername" runat="server" Text="User full name" cssclass="Val"></asp:Label>

            </td>
            <td class="TdStyle" > <asp:TextBox ID="Txbname" runat="server" Height="35px" CssClass="auto-style5" Width="180px"></asp:TextBox> </td>
            <td class="TdStyle" >
                <asp:RequiredFieldValidator cssclass="Val" ID="nameRFV" runat="server" ErrorMessage="enter your full name" ForeColor="Red" ControlToValidate="Txbname" ValidationGroup="errors" ></asp:RequiredFieldValidator> </td>
        </tr>
         <tr>
     <td class="TdStyle" >
         <asp:Label ID="Lblemail" runat="server" Text="Enter your email" cssclass="Val"></asp:Label>

     </td>
     <td class="TdStyle" > <asp:TextBox ID="Txtemail" runat="server" Height="35px" CssClass="auto-style5"  Width="180px"></asp:TextBox> </td>
     <td class="TdStyle" >
         <asp:RequiredFieldValidator ID="RFVEMAIL" cssclass="Val" runat="server" ErrorMessage="enter your  email" ForeColor="Red" ControlToValidate="Txtemail" ValidationGroup="errors" ></asp:RequiredFieldValidator> <br />
          <asp:RegularExpressionValidator ID="Revemail" cssclass="Val" runat="server" ErrorMessage="Enter a valid email"  ControlToValidate="Txtemail" forecolor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="errors" ></asp:RegularExpressionValidator>
     </td>
 </tr>
                <tr>
    <td class="TdStyle"  >
        <asp:Label ID="Lblid" runat="server" Text="Enter your ID" cssclass="Val"></asp:Label>

    </td>
    <td class="TdStyle"  > <asp:TextBox ID="TxbID" runat="server" Height="35px" CssClass="auto-style5"  Width="180px"></asp:TextBox> </td>
    <td class="TdStyle"  >
        <asp:RequiredFieldValidator cssclass="Val" ID="RFVID" runat="server" ErrorMessage="Enter your ID" ForeColor="Red" ControlToValidate="TxbID" ValidationGroup="errors" ></asp:RequiredFieldValidator> 
        <br />
        <asp:RegularExpressionValidator cssclass="Val" ID="RevID" runat="server" ErrorMessage="Enter a valid ID" ControlToValidate="TxbID" forecolor="Red" ValidationExpression="\d{9}" ValidationGroup="errors" ></asp:RegularExpressionValidator>
    </td>
</tr>
   
                                <tr>
    <td class="TdStyle"  >
        <asp:Label ID="Lblage" runat="server" Text="Enter your age" cssclass="Val"></asp:Label>

    </td>
    <td class="TdStyle"> <asp:TextBox ID="Txbage" runat="server" Height="35px" CssClass="auto-style5"  Width="180px" style="margin-left: 0px"></asp:TextBox> </td>
    <td class="TdStyle">
        <asp:RequiredFieldValidator cssclass="Val" ID="Rfvage" runat="server" ErrorMessage="Enter your age" ForeColor="Red" ControlToValidate="Txbage" ValidationGroup="errors"></asp:RequiredFieldValidator></br>
        <asp:RangeValidator cssclass="Val" ID="RvAge" runat="server" ErrorMessage="Enter a valid age (16-120)" ControlToValidate="Txbage" Type="Integer" ForeColor="Red" MaximumValue="120" MinimumValue="16" ValidationGroup="errors" ></asp:RangeValidator>
     
       
    </td>
</tr>
                                <tr>
    <td class="TdStyle" >
        <asp:Label ID="Lblpassword" runat="server" Text="Enter your password" cssclass="Val"></asp:Label>

    </td >
    <td class="TdStyle" > <asp:TextBox ID="Txbpass" runat="server" Height="35px" CssClass="auto-style5"  Width="180px"></asp:TextBox> </td>
    <td class="TdStyle" >
        <asp:RequiredFieldValidator cssclass="Val" ID="Rfvpass" runat="server" ErrorMessage="Enter your password" ForeColor="Red" ControlToValidate="Txbpass" ValidationGroup="errors" ></asp:RequiredFieldValidator> 
     
       
    </td>
</tr>
                                <tr>
    <td class="TdStyle"  >
        <asp:Label ID="Lblconfirmpass" runat="server" Text="Confirm password" cssclass="Val"></asp:Label>

    </td>
    <td class="TdStyle" > <asp:TextBox ID="Txbpassconfirm" runat="server" Height="35px" CssClass="auto-style5"  Width="180px"></asp:TextBox> </td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter your password" ForeColor="Red" ControlToValidate="Txbpassconfirm" ValidationGroup="errors" ></asp:RequiredFieldValidator> 
    <td class="TdStyle" >
        <asp:CompareValidator cssclass="Val" ID="CvPass" runat="server" ErrorMessage="Password and Confirm Password must be the same" ForeColor="Red" ControlToCompare="Txbpass" ControlToValidate="Txbpassconfirm" ValidationGroup="errors" ></asp:CompareValidator></br>
     
    
                                    
        <asp:RequiredFieldValidator ID="Rfvconfirmpass" runat="server" ErrorMessage="Enter your password" ForeColor="Red" ControlToValidate="Txbpassconfirm" ValidationGroup="errors"  ></asp:RequiredFieldValidator> 
     
       
    </td>
</tr>
        <tr>
            <td colspan="3" class="TdStyle" >
                <asp:Button ID="Butregister" class="btn" runat="server" Text="Register" Width="133px" Height="40px" Font-Size="Large" ValidationGroup="errors" OnClick="Butregister_Click" BackColor="#bbbaba" />
            </td>
        </tr>
        <tr>
            <td colspan="3" class="TdStyle">
                <asp:ValidationSummary cssclass="Val" ID="VsRegistration" runat="server" ValidationGroup="errors" Font-Italic="False" ForeColor="Red" Font-Bold="False" />
            </td>
            <td class="TdStyle" >
                <asp:Label ID="LblInfo" runat="server" Text=" "></asp:Label>
            </td>
        </tr>
        
    </table>
      
        
      
      
        
      
</asp:Content>

