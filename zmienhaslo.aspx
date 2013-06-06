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

   Hasło: <p><asp:TextBox ID="UserPass" runat="server" TextMode="Password"></asp:TextBox></p>
    Nowe hasło: <p><asp:TextBox ID="UserPassNew" runat="server" TextMode="Password"></asp:TextBox></p>
        Powtórz nowe hasło:<p> <asp:TextBox ID="UserPassRepeat" runat="server" TextMode="Password"></asp:TextBox></p>
         <asp:Button ID="Loguj" runat="server" OnClick="TryToChangePass" Text="Zmień hasło"  class="btn btn-large btn-primary" />
        <asp:Label ID="Info" runat="server"></asp:Label>
         
    </div>
        
    </form>      
            <asp:SiteMapDataSource ID="MapaSerwisu" runat="server" ShowStartingNode="False" />
 </div>
       </body>
</html>
