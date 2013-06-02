<%@ Page Language="C#" AutoEventWireup="true" CodeFile="odzyskajhaslo.aspx.cs" Inherits="odzyskajhaslo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Odzyskaj hasło</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
   <div class="container">
    <div id="Logo">
       <h3 class="muted" id="log">ktoszuka-tenznajdzie.pl</h3><div class="men"></div></div>
            <form id="form1" runat="server" class="form-signin">
                <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" AnswerLabelText="Odpowiedź:" AnswerRequiredErrorMessage="Odpowiedź jest wymagana." GeneralFailureText="Niepowodzenie. Spróbuj podobnie." QuestionInstructionText="" QuestionLabelText="Pytanie:" SubmitButtonText="Wyślij" SuccessText="Hasło zostało wysłane." UserNameFailureText="Proszę spróbować ponownie." UserNameLabelText="Login:" UserNameRequiredErrorMessage="Nazwa użytkownika jest wymagana." UserNameTitleText="Zapomniałeś hasła?" QuestionFailureText="Zła odpowiedź" QuestionTitleText="Potwierdzenie tożsamości" UserNameInstructionText=" " LabelStyle-HorizontalAlign="NotSet" SubmitButtonStyle-CssClass="btn btn-large btn-primary pull-right" LabelStyle-VerticalAlign="NotSet" LabelStyle-Wrap="False" RenderOuterTable="False" TitleTextStyle-HorizontalAlign="Left" TitleTextStyle-Wrap="False" EnableTheming="True" EnableViewState="True" TextLayout="TextOnLeft" TitleTextStyle-BorderStyle="NotSet" TitleTextStyle-Height="50px" TitleTextStyle-VerticalAlign="Top" FailureTextStyle-CssClass="alert alert-error" BorderPadding="1" Enabled="True" FailureTextStyle-Wrap="False" FailureTextStyle-ForeColor="#B94A48"></asp:PasswordRecovery><br />
        <div id="zapomnialem">
            <p>Powrót na <a href="Zaloguj.aspx">Stronę logowania</a></p>
        </div>
            </form>
   </div>
</body>
</html>
