<%@ Page Language="C#" AutoEventWireup="true" CodeFile="zmienhaslo.aspx.cs" Inherits="zmienhaslo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Zmień hasło</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            height: 56px;
        }
        .auto-style2 {
            height: 42px;
        }
    </style>
</head>

<body> 
 <div class="container">
    <form id="form1" runat="server">
      <div id="Logo">
        <h3 class="muted" id="log">ktoszuka-tenznajdzie.pl</h3><br />
      <div class="navbar">
        <div class="navbar-inner">
        <asp:Menu runat="server" DataSourceID="MapaSerwisu" Orientation="Horizontal" CssClass="container" StaticMenuStyle-CssClass="nav" EnableTheming="True" >
            <DynamicHoverStyle CssClass="nav li active" />
            <DynamicMenuItemStyle CssClass="dropdown-menu" />
            <StaticHoverStyle CssClass="nav li:hover" />
            <StaticMenuItemStyle CssClass="navbar nav active" />
        </asp:Menu>
        </div>
      </div>
    </div>
    <div class="form-signin">
    <asp:changepassword ID="Changepassword1" runat="server" ChangePasswordButtonText="Zmień hasło" ChangePasswordFailureText="Niepoprawne hasło lub nowe hasło niepoprawne. Minimalna długość nowego hasła: {0}. Wymagany symbol: {1}." ChangePasswordTitleText="Zmiana hasła" ConfirmNewPasswordLabelText="Potwierdzenie nowego hasła:" ConfirmPasswordCompareErrorMessage="Stare i nowe hasło muszą do siebie pasować." ConfirmPasswordRequiredErrorMessage="Potwierdzenie hasła wymagane." Font-Names="Verdana" Font-Size="10pt" NewPasswordLabelText="Nowe hasło:" NewPasswordRegularExpressionErrorMessage="Proszę podać nowe hasło." NewPasswordRequiredErrorMessage="Nowe hasło jest wymagane." PasswordRequiredErrorMessage="Hasło wymagane." SuccessText="Hasło zostało zmienione." SuccessTitleText="Zmiana hasła zakończona." UserNameLabelText="Nazwa użytkownika." UserNameRequiredErrorMessage="Wymagana nazwa użytkownika." CancelDestinationPageUrl="~/Zaloguj.aspx" PasswordLabelText="Hasło:" ContinueButtonText="Kontynuuj" ContinueDestinationPageUrl="~/Default.aspx" ChangePasswordButtonStyle-CssClass="btn btn-large btn-primary" FailureTextStyle-CssClass="alert alert-info" SuccessTextStyle-CssClass="alert alert-success">
        <ChangePasswordTemplate>
             <ul class="nav nav-tabs">
                    <li class="active"><a>Zmiana Hasła</a></li>
            </ul>

            <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword">Hasło:</asp:Label>
            <asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword" ErrorMessage="Hasło wymagane." ToolTip="Hasło wymagane." ValidationGroup="Changepassword1">*</asp:RequiredFieldValidator>
            
            <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword">Nowe hasło:</asp:Label>
            <asp:TextBox ID="NewPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword" ErrorMessage="Nowe hasło jest wymagane." ToolTip="Nowe hasło jest wymagane." ValidationGroup="Changepassword1">*</asp:RequiredFieldValidator>

            <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword">Potwierdzenie nowego hasła:</asp:Label>
            <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword" ErrorMessage="Potwierdzenie hasła wymagane." ToolTip="Potwierdzenie hasła wymagane." ValidationGroup="Changepassword1">*</asp:RequiredFieldValidator>
            
            <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" ErrorMessage="Stare i nowe hasło muszą do siebie pasować." ValidationGroup="Changepassword1" Display="Dynamic" CssClass="alert alert-info zmianahas"></asp:CompareValidator>
            <asp:Literal ID="FailureText" runat="server" EnableViewState="True"></asp:Literal>
            <asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword" Text="Zmień hasło" ValidationGroup="Changepassword1" CssClass="btn btn-large btn-primary pull-right" />

        </ChangePasswordTemplate>
        <TextBoxStyle ForeColor="#99FF99" />
        <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
        </asp:changepassword>
    </div>
        
    </form>      
            <asp:SiteMapDataSource ID="MapaSerwisu" runat="server" ShowStartingNode="False" />
 </div>
       </body>
</html>
