<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Zarejestruj.aspx.cs" Inherits="Zarejestruj" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rejestracja</title>
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
   <form id="form1" runat="server" class="form-signup">
        <ul class="nav nav-tabs">
           <li><a href="Zaloguj.aspx" data-toggle="tab">Logowanie</a></li>
           <li class="active"><a href="Zarejestruj.aspx" data-toggle="tab">Rejestracja</a></li>
        </ul>
        <asp:CreateUserWizard class="span3" ID="CreateUserWizard1" runat="server" AnswerLabelText="Odpowiedź:" AnswerRequiredErrorMessage="Odpowiedź jest wymagana." CancelButtonText="Anuluj" CompleteSuccessText="Twoje konto zostało utworzone." ConfirmPasswordCompareErrorMessage="Hasło oraz potwierdzenie hasła muszą do siebie pasować." ConfirmPasswordLabelText="Potwierdzenie hasła:" ConfirmPasswordRequiredErrorMessage="Potwierdzenie hasła jest wymagane." ContinueButtonText="Kontynuuj" CreateUserButtonText="Zarejestruj" DuplicateEmailErrorMessage="E-mail w użyciu. Podaj inny e-mail." DuplicateUserNameErrorMessage="<span class='alert alert-error' style='line-height:20px;display:block;'>Podana nazwa już w użyciu. Podaj inną nazwę użytkownika.</span>" EmailRegularExpressionErrorMessage="Podaj poprawny e-mail." EmailRequiredErrorMessage="E-mail wymagany" FinishCompleteButtonText="Utwórz" FinishPreviousButtonText="Poprzedni" InvalidAnswerErrorMessage="Proszę podać poprawne hasło" InvalidEmailErrorMessage="Proszę podać poprawny email" InvalidPasswordErrorMessage="<span class='alert alert-error' style='line-height:20px;display:block;'>Minimalna długość hasła: {0}. Wymagany symbol nie alfanumeryczny: {1}.</span>" InvalidQuestionErrorMessage="Proszę podać inne pytanie" PasswordLabelText="Hasło: " PasswordRegularExpressionErrorMessage="Proszę podać inne hasło" PasswordRequiredErrorMessage="Hasło jest wymagane" QuestionLabelText="Pytanie zabezpieczające:" QuestionRequiredErrorMessage="Pytanie zabezpieczające jest wymagane." UnknownErrorMessage="Twoje konto nie zostało utworzone." UserNameLabelText="Nazwa użytkownika:" UserNameRequiredErrorMessage="Nazwa użytkownika jest wymagana." ContinueDestinationPageUrl="~/Zaloguj.aspx" CreateUserButtonStyle-CssClass="btn btn-large btn-primary" ErrorMessageStyle-CssClass="alert alert-info">
            <WizardSteps>
                <asp:CreateUserWizardStep runat="server" >
                    <ContentTemplate>                       
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Nazwa użytkownika:</asp:Label>

                                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Nazwa użytkownika jest wymagana." ToolTip="Nazwa użytkownika jest wymagana." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>

                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Hasło: </asp:Label>

                                    <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Hasło jest wymagane" ToolTip="Hasło jest wymagane" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>

                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Potwierdzenie hasła:</asp:Label>

                                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Potwierdzenie hasła jest wymagane." ToolTip="Potwierdzenie hasła jest wymagane." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>

                                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>

                                    <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail wymagany" ToolTip="E-mail wymagany" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>

                                    <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Pytanie zabezpieczające:</asp:Label>

                                    <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="Pytanie zabezpieczające jest wymagane." ToolTip="Pytanie zabezpieczające jest wymagane." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>

                                    <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Odpowiedź:</asp:Label>

                                    <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Odpowiedź jest wymagana." ToolTip="Odpowiedź jest wymagana." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>

                                    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="Hasło oraz potwierdzenie hasła muszą do siebie pasować." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>

                                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                       
                    </ContentTemplate>
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep runat="server" >
                    <ContentTemplate>
                                <p class="alert alert-success" style="line-height:16px">Twoje konto zostało utworzone.</p>

                                <p>
                                    <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue" Text="Kontynuuj" ValidationGroup="CreateUserWizard1" CssClass="btn btn-success" />
                                </p>
                    </ContentTemplate>
                </asp:CompleteWizardStep>
            </WizardSteps>
        </asp:CreateUserWizard> 
    </form>
        <hr class="glowna" style="margin-top:100px;" />
        <h3 class="glowna_info">
            Wiemy, że nie chcesz po prostu umówić się na randkę.<br />
            Chcesz umówić się na niezapomniane spotkanie z osobą, która naprawdę do Ciebie pasuje! <br />
            > Nigdy więcej krępującego milczenia. <br />
            > Nigdy więcej braku wspólnych tematów do rozmów.
        </h3>
</div>
</body>
</html>
