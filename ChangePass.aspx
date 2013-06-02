<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePass.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Resetowanie Hasła</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    
</head>
    
<body>
<div class="container">
    <div id="Logo">
       <h3 class="muted" id="log">ktoszuka-tenznajdzie.pl</h3><div class="men"></div></div>
<form id="form1" runat="server" class="form-signin">

<div id="ObszarLogowania">
    <ul class="nav nav-tabs">
        <li class="active"><a>Zmiana Hasła</a></li>
    </ul>
   Login: <asp:TextBox ID="Username" runat="server"></asp:TextBox><br />
   Email: <asp:TextBox ID="mail" runat="server"></asp:TextBox><br />
        <asp:Button ID="Sent" OnClick="Sent_Click" runat="server" Text="Wyślij" class="btn btn-large btn-primary pull-right"/><br />
        <div id="zapomnialem">
            <p>Powrót na <a href="Zaloguj.aspx">Stronę logowania</a></p><br />
            <asp:Label runat="server" Visible="false" ID="wrong" Text="Zła nazwa użytkownika lub email" class="alert alert-error" style="line-height:33px;display:block;"></asp:Label>
        </div>
   </div>
</form>
</div>
</body>
</html>
