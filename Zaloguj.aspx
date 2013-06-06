<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Zaloguj.aspx.cs" Inherits="Zaloguj" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Logowanie</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    
</head>
<body>
    <div class="container">
    <div id="Logo">
       <h3 class="muted" id="log">ktoszuka-tenznajdzie.pl</h3><div class="men"></div></div>
      <form id="form1" runat="server" class="form-signin">
         
<div id="ObszarLogowania">
     <ul class="nav nav-tabs">
        <li class="active"><a href="Zaloguj.aspx" data-toggle="tab">Logowanie</a></li>
        <li id="rejestracja_link" class="xxx"><a href="Zarejestruj.aspx" data-toggle="tab">Rejestracja</a></li>
    </ul>

 Login: <asp:TextBox ID="UserName" runat="server"></asp:TextBox><br />
   Hasło: <asp:TextBox ID="UserPass" runat="server" TextMode="Password"></asp:TextBox><br />
            <label class="checkbox">
    Zapamiętaj <asp:CheckBox ID="RememberMe" runat="server" type="checkbox" /><br />
            </label>
          <asp:Button ID="Loguj" runat="server" OnClick="TryToLog" Text="Zaloguj"  class="btn btn-large btn-primary" />
          </div>

          <div id="zapomnialem">
   <p>
     <a href="ChangePass.aspx">Zresetuj hasło</a></p>
        <p style="float:right;">Nie masz konta? <a href="Zarejestruj.aspx">Zarejestruj się</a></p>
          </div>
    <p style="text-align:center">
     <asp:Label runat="server" ID="Wrong" Visible="false" Text="Błąd! Zły login lub hasło" CssClass="alert alert-error"></asp:Label>
    </p>
        </form>
     </div>
    </body>
</html>
