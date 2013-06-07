<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePass.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Resetowanie Hasła</title>
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
        <li class="active"><a>Zmiana Hasła</a></li>
    </ul>
   Login: <asp:TextBox ID="Username" runat="server"></asp:TextBox><br />
   Email: <asp:TextBox ID="mail" runat="server"></asp:TextBox><br />
        <asp:Button ID="Sent" OnClick="Sent_Click" runat="server" Text="Wyślij" class="btn btn-large btn-primary pull-right"/><br />
        <div id="zapomnialem">
            <p>Powrót na <a href="Zaloguj.aspx">Stronę logowania</a></p><br />
            <asp:Label runat="server" Visible="false" ID="wrong" Text="Zła nazwa użytkownika lub email" class="alert alert-error" style="line-height:33px;display:block;margin-top:-20px;margin-bottom:-20px;"></asp:Label>
        </div>
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
