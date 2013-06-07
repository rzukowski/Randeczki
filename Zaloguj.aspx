<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Zaloguj.aspx.cs" Inherits="Zaloguj" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Logowanie</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="Scripts/jquery-1.9.1.js" ></script>
    <script type="text/javascript" src="Scripts/jquery.flexslider.js" ></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.flexslider').flexslider({
                animation: "slide",
                start: function (slider) {
                    $('body').removeClass('loading');
                }
            });
        });
    </script>
</head>
<body>
    <div class="container">
    <div id="Logo">
       <h3 class="muted" id="log">ktoszuka-tenznajdzie.pl</h3><div class="men"></div>
    </div>
             
     <section class="slider" style="width:600px;height:400px!important;">
        <div class="flexslider">
          <ul class="slides">
            <li>
  	    	    <img src="./images/slajdy/1.jpg" />
  	    	</li>
  	    	<li>
  	    	    <img src="./images/slajdy/2.jpg" />
  	    	</li>
  	    	<li>
  	    	    <img src="./images/slajdy/3.jpg" />
  	    	</li>
  	    	<li>
  	    	    <img src="./images/slajdy/4.jpg" />
  	    	</li>
            <li>
  	    	    <img src="./images/slajdy/5.jpg" />
  	    	</li>
            <li>
  	    	    <img src="./images/slajdy/6.jpg" />
  	    	</li>
          </ul>
        </div>
      </section>   

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
   <p>| 
     <a href="ChangePass.aspx">Zresetuj hasło</a></p>
        <p style="float:right;">Nie masz konta? <a href="Zarejestruj.aspx">Zarejestruj się</a></p>
    <p style="text-align:center">
     <asp:Label runat="server" ID="Wrong" Visible="false" Text="Błąd! Zły login lub hasło" CssClass="alert alert-error" style="display:block;margin-top:35px;margin-bottom:-20px;"></asp:Label>
    </p>
         </div>
        </form>
        <hr class="glowna" />
        <h3 class="glowna_info">
            Wiemy, że nie chcesz po prostu umówić się na randkę.<br />
            Chcesz umówić się na niezapomniane spotkanie z osobą, która naprawdę do Ciebie pasuje! <br />
            > Nigdy więcej krępującego milczenia. <br />
            > Nigdy więcej braku wspólnych tematów do rozmów.
        </h3>
     </div>
    </body>
</html>
