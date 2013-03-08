<%@ Page Language="C#" StyleSheetTheme="Theme1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Logowanie</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style6 {
            height: 32px;
        }
        .auto-style7 {
            height: 43px;
        }
        .auto-style8 {
            height: 38px;
        }
        .auto-style9 {
            height: 31px;
        }
    </style>
</head>
<body>

<script runat="server">

    protected void Login2_LoggedIn(object sender, EventArgs e)
    {
        Session.Add("username", Login2.UserName);
        Session.Add("userid",
            Membership.GetUser(Login2.UserName).ProviderUserKey.ToString());
        
    }
</script>

    <div id="Logo">
    <form id="form1" runat="server">
       <span class="log">ktoszuka-tenznajdzie.pl</span><div class="men"></div></div>
      
        <div style="width:307px; margin-left:auto; margin-right:auto">
        <asp:Login ID="Login2" runat="server" onloggedin="Login2_LoggedIn" FailureText="Logowanie nie powiodlo sie" LoginButtonText="Zaloguj się" PasswordLabelText="Hasło:" PasswordRequiredErrorMessage="Wprowadź hasło" RememberMeText="Zapamiętaj mnie" UserNameLabelText="Nazwa użytkownika:" UserNameRequiredErrorMessage="Nazwa jest wymagana" BackColor="#99FF99" BorderColor="#CCCC99" BorderStyle="Double" BorderWidth="1px" Font-Names="Verdana" Font-Size="12pt" TitleText="Logowanie" CssClass="logowanie" BorderPadding="3" Font-Bold="True" Font-Overline="False" ForeColor="White" Height="129pt" TextLayout="TextOnTop" Width="300px">
            <LayoutTemplate>
                <table cellpadding="3" cellspacing="0" style="border-collapse:collapse;">
                    <tr>
                        <td>
                            <table cellpadding="0" style="height:129pt;width:300px;">
                                <tr>
                                    <td align="center" style="color:White;font-weight:bold;">Logowanie</td>
                                </tr>
                                <tr>
                                    <td class="auto-style9">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Nazwa użytkownika:</asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style8">
                                        <asp:TextBox ID="UserName" runat="server" BackColor="#CCFF99" Height="15pt" Width="140pt" BorderColor="#99FF66"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Nazwa jest wymagana" ToolTip="Nazwa jest wymagana" ValidationGroup="Login2">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Hasło:</asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style8">
                                        <asp:TextBox ID="Password" runat="server" BackColor="#CCFF99" Height="15pt" TextMode="Password" Width="140pt"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Wprowadź hasło" ToolTip="Wprowadź hasło" ValidationGroup="Login2">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style6">
                                        <asp:CheckBox ID="RememberMe" runat="server" Text="Zapamiętaj mnie" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" class="auto-style6" style="color:Red;">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" class="auto-style7">
                                        <asp:Button ID="LoginButton" runat="server" BackColor="#CCFFCC" CommandName="Login" Text="Zaloguj się" ValidationGroup="Login2" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            
            <LoginButtonStyle BackColor="#CCFFCC" />
            <TextBoxStyle BackColor="#CCFF99" Height="15pt" Width="140pt" />
            <TitleTextStyle Font-Bold="True" ForeColor="#FFFFFF" />
        </asp:Login></div>
    </p>

   <p align="center"><a href="odzyskajhaslo.aspx">Zapomniałem hasła</a></p>
    <p align="center" dir="rtl"> Nie masz konta? <a href="Zarejestruj.aspx">Zarejestruj się</a></p>
        </form>
    </body>
</html>