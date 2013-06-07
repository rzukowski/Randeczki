<%@ Page Language="C#" AutoEventWireup="true" CodeFile="odzyskajhaslo.aspx.cs" Inherits="odzyskajhaslo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Odzyskaj hasło</title>
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
              <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab">Zapomniałeś hasła?</a></li>
              </ul>
                <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" AnswerLabelText="Odpowiedź:" AnswerRequiredErrorMessage="Odpowiedź jest wymagana." GeneralFailureText="Niepowodzenie. Spróbuj podobnie." QuestionInstructionText="" QuestionLabelText="Pytanie:" SubmitButtonText="Wyślij" SuccessText="Hasło zostało wysłane." UserNameFailureText="Proszę spróbować ponownie." UserNameLabelText="Login:" UserNameRequiredErrorMessage="Nazwa użytkownika jest wymagana." QuestionFailureText="Zła odpowiedź" QuestionTitleText="Potwierdzenie tożsamości" UserNameInstructionText=" " LabelStyle-HorizontalAlign="NotSet" SubmitButtonStyle-CssClass="btn btn-large btn-primary pull-right" LabelStyle-VerticalAlign="NotSet" LabelStyle-Wrap="False" RenderOuterTable="False" TitleTextStyle-HorizontalAlign="Left" TitleTextStyle-Wrap="False" EnableTheming="True" EnableViewState="True" TextLayout="TextOnLeft" TitleTextStyle-BorderStyle="NotSet" TitleTextStyle-Height="50px" TitleTextStyle-VerticalAlign="Top" FailureTextStyle-CssClass="alert alert-error" BorderPadding="1" Enabled="True" FailureTextStyle-Wrap="False" FailureTextStyle-ForeColor="#B94A48" UserNameTitleText=" "></asp:PasswordRecovery><br />
        <div id="zapomnialem">
            <p>Powrót na <a href="Zaloguj.aspx">Stronę logowania</a></p>
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
