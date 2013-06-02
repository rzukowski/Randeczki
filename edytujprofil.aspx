<%@ Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" CodeFile="edytujprofil.aspx.cs" Inherits="edytujprofil" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxControlToolkit" %>
<%@ Register assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.WebControls" tagprefix="asp" %>

<script runat="server">

</script>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        //funkcja do zakładek
        $(document).ready(function () {
            //dla każdego miejsca z tabami
            $('#zakladki').each(function () {
                var $li = $(this).children('li');
                //przy wejsciu na strone ukrywamy tresc tabow i pokazujemy tylko aktywny
                $li.each(function () { //pętla po wszystkich tabach
                    var $trescTaba = $($(this).children('a').attr('href')); //pobieramy blok o id pobranym z linka-taba
                    if ($(this).hasClass('active')) { //jeżeli ten tab ma klasę aktywną
                        $trescTaba.show(); //to pobrany przed chwilą blok pokazujemy
                    } else {
                        $trescTaba.hide(); //jeżeli takiej klasy nie ma to blok ukrywamy
                    }
                });

                $li.click(function () { $(this).children('a').click() });
                //po kliknięciu na link...
                $li.children('a').click(function () {
                    //usuwamy z tabów klasę active
                    $li.removeClass('active');
                    $li.children('a').removeClass('active');
                    //ukrywamy wszystkie taby               
                    $li.each(function () {
                        $($(this).children('a').attr('href')).hide();
                    });
                    //ustawiamy klikniętemu tabowi klasę aktywną
                    $(this).parent().addClass('active');
                    $(this).addClass('active');
                    $($(this).attr('href')).show("slow");
                    //nie chcemy wykonać domyślnej akcji dla linka
                    return false;
                });
            });
        });
       //validacja danych
        function Validate() {
           return ValidateAll();
           function ValidateAll() {
               var plec = ValidatePlec();
               var opis = ValidateOpis();
               var birthDate = ValidateBirthDate();
               // if (plec && opis && urodziny) {
               if (opis && birthDate && plec) {

                        
                        return true;
                   
                }

                return false;
            }

           function ValidateOpis() {
           
                var opisid = document.getElementById('Opis');
                if (opisid.value != "") {

                    return true;
                }
                else {
                    var opisP = document.getElementById('OpisS');
                    opisP.innerHTML = "Opis jest pusty";
                    opisid.style.border = "1px solid #ff0000";
                    return false;
                }
                return false;
            }

            function ValidateBirthDate() {
                var birthDate = document.getElementById('DataUrodzin');
                if (birthDate.value != "") {
                    var match = birthDate.value.match(/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/);
                    if (match != null)
                        return true;
                    else {
                        var opisP = document.getElementById('UrodzinyS');

                    }
                }
                opisP.innerHTML = "Format urodzin: yyyy-mm-dd";
                birthDate.style.border = "1px solid #ff0000";
                return false;


            }

            function ValidatePlec() {
                var plecid = document.getElementById('Plec')
                var radioButt = plecid.getElementsByTagName("input");
                var selected;
                for (ii = 0; ii < radioButt.length; ii++) {

                    if (radioButt[ii].checked) {

                        return true;

                    }



                }
                var plecS = document.getElementById('PlecS');
                plecS.innerHTML = "Wybierz płeć";
                return false;


            }
        }

    </script>
    <script type="text/javascript" src="Scripts/validation_dane.js" ></script>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true">
    </asp:ScriptManager>
    <ul class="nav nav-tabs" id="zakladki">
        <li class="active"><a href="#Zainteresowania" class="active"><i class="icon-thumbs-up"></i> Zainteresowania</a></li>
        <li><a href="#Dane"><i class="icon-user"></i> Dane osobowe</a></li>
        <li><a href="#Zdjecie"><i class="icon-picture"></i> Zmiana zdjęcia</a></li>
        <li><a href="#Wyglad"><i class="icon-eye-open"></i> Wygląd</a></li>
    </ul>

    <div id="Wyglad">
          <div class="span4">
               <asp:UpdateProgress ID="updProgress"
        runat="server" AssociatedUpdatePanelID="UpdatePanel2">
            <ProgressTemplate>           
                 <div id="update">Zapisywanie<br /><img alt="" src="images/ajax-loader.gif" /></div> 
              <div id="greyout">    </div>   
                 
            </ProgressTemplate>
        </asp:UpdateProgress>
            <asp:UpdatePanel runat="server" id="UpdatePanel2" updatemode="Conditional">
         <ContentTemplate>
       Budowa ciała: <asp:RadioButtonList ID="DDLWyglad" runat="server" DataTextField="budowa_opis" DataValueField="budowa_id" Width="200px" AppendDataBoundItems="True" CssClass="wyglad_input"></asp:RadioButtonList>
        
        <div class="input-prepend input-append">
                <label style="display:inline;vertical-align:bottom;font-size:17px;">Wzrost: </label> 
                <asp:TextBox ID="TBWzrost" runat="server" Height="20px" Width="30px"></asp:TextBox>
                <span class="add-on"> cm</span>
        </div>
         <br />    
        <div class="input-prepend input-append">
                <label style="display:inline;vertical-align:bottom;font-size:17px;">Waga: </label> 
                <asp:TextBox ID="TBWaga" runat="server" Height="20px" Width="25px"></asp:TextBox>
                <span class="add-on"> kg</span>
        </div>
             <p>
        Twoje BMI: <asp:Label runat="server" id="LBmi"></asp:Label>
            </p>
             <br />
             <p>
             <asp:Button ID="UpdateWyglad" runat="server" Text="Zmień" OnClick="Update_Wyglad" CssClass="btn btn-primary"/>
             </p>
             <asp:UpdateProgress ID="UpdateProgress1" runat="server">
    
    </asp:UpdateProgress>
             </ContentTemplate>
                
             </asp:UpdatePanel>
              </div>
    </div>

    <div class="tab-pane active" id="Zainteresowania">
    <%-- Check box rozwijany ze sportami --%>
   <div class="span4">
   <h4 class="center">Sport</h4>
    <br />
    <asp:UpdateProgress ID="UpdateProgress2"
        runat="server" AssociatedUpdatePanelID="UpdatePanel">
            <ProgressTemplate>   
                <div id="update">Zapisywanie<br /><img alt="" src="images/ajax-loader.gif" /></div> 
              <div id="greyout">    </div>  
            </ProgressTemplate>
        </asp:UpdateProgress>
    <asp:UpdatePanel runat="server" id="UpdatePanel" updatemode="Conditional" >
         <ContentTemplate>
       <div id="divDDL" class="divDDL btn btn-large disabled" runat="server" >
        Proszę wybrać…
       </div>
        <asp:Panel ID="pnlCustomers" runat="server" CssClass="MultipleSelectionDDL">
            <asp:CheckBoxList ID="cblCustomerList" runat="server" onclick="CountSelected(this)">
            </asp:CheckBoxList>
        </asp:Panel>
        <br />
        <cc1:PopupControlExtender ID="pceSelections" runat="server" TargetControlID="divDDL"
               PopupControlID="pnlCustomers" Position="Bottom" OffsetY="-1" >
        </cc1:PopupControlExtender>
    <p class="center" >
        <br />
        <p>
         <asp:Button ID="Button2" runat="server" Text="Zmień" OnClick="Update_User_Sport_Table" class="btn btn-primary"/>
        </p>
        </p>
             </ContentTemplate>
        </asp:UpdatePanel>
        </div>
        </div>

    <div class="tab-pane" id="Dane">
        <asp:UpdateProgress ID="UpdateProgress3"
        runat="server" AssociatedUpdatePanelID="UpdatePanel1">
            <ProgressTemplate>           
               <div id="update">Zapisywanie<br /><img alt="" src="images/ajax-loader.gif" /></div> 
              <div id="greyout"></div>           
            </ProgressTemplate>
        </asp:UpdateProgress>
     
        <asp:UpdatePanel runat="server" id="UpdatePanel1" updatemode="Conditional">
         <ContentTemplate>
             <cc1:CalendarExtender ID="CalendarExtender1" TargetControlId="DataUrodzin" runat="server" Format="yyyy-MM-dd"></cc1:CalendarExtender>
  <div class="span4">
    <p>Data urodzin*: 
        <asp:TextBox ID="DataUrodzin" runat="server" Height="22px" Width="100px" ClientIDMode="Static"></asp:TextBox>
        <span id="UrodzinyS" class="Validate"></span>
    </p>

    <p>Płeć*:
      <label class="checkbox">
        <asp:RadioButtonList ID="Plec" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" ClientIDMode="Static"></asp:RadioButtonList>
        <span id="PlecS" class="Validate"></span>
      </label>
    </p>

    <p>Województwo*: 
        <asp:DropDownList ID="Wojewodztwa" runat="server" Width="200px" AppendDataBoundItems="True" ClientIDMode="Static"></asp:DropDownList>
    </p>

    <p>Opis*: 
        <asp:TextBox ID="Opis" runat="server" Width="300px" Height="60px" TextMode="multiline" ClientIDMode="Static"></asp:TextBox>
        <span id="OpisS" class="Validate"></span>
    </p>
    <br />
    <p>
    <asp:Button ID="Button1" runat="server" Text="Zmień" OnClick="UpdateDane" OnClientClick="return Validate()" ClientIDMode="Static" CssClass="btn btn-primary"/> 
    </p>
 </div>
        </ContentTemplate>
           
        </asp:UpdatePanel>
        
</div>

         <br />                   

</p>
     <script type="text/javascript">

         //info o uploadowanym zdjęciu
         function uploadComplete(sender, args) {
             alert("Zdjęcie wrzucone!");
             var imgDisplay = $get("photo");
             window.location.reload()
             // var img = new Image();
             // img.src = "/photos/" + args.get_fileName();
             // imgDisplay.src = img.src;
         }

         //funckja do obliczania zaznaczonych kategorii sport
         function CountSelected() {
             var hdnCount = 0;
             getSelectionCount();
             ChangeDiv();

             //zmiana tekstu diva
             function ChangeDiv() {
                 if (hdnCount > 0) {
                     var div = document.getElementById('<%=divDDL.ClientID%>');
                     if (hdnCount == 1) { div.innerHTML = "1 element"; }
                     else if (hdnCount < 5) { div.innerHTML = hdnCount + " elementy"; }
                     else { div.innerHTML = hdnCount + " elementów"; }

                 }
             }
             //zliczanie zaznaczonych elementów
             function getSelectionCount() {
                 var cbl = document.getElementById('<%=pnlCustomers.FindControl("cblCustomerList").ClientID%>');
                 var browser = navigator.appName;
                 var pos = 0;
                 if (browser.indexOf("Microsoft") >= 0) {
                     pos = 0;
                 }
                 else {
                     pos = 1;
                 }
                 var tbody = cbl.childNodes[pos];
                 var length = (tbody.childNodes.length - pos);
                 hdnCount = 0;
                 for (i = 0; i < length; i++) {
                     var td = tbody.childNodes[i].childNodes[pos];
                     var chk = td.childNodes[0];
                     if (chk.checked) {
                         hdnCount++;
                     }
                 }

             }
         }



</script>
    <div id="Zdjecie">
        <center>
        <div class="span4">
                Wybierz plik : 
  
    <cc1:asyncfileupload ID="AsyncFileUpload1" runat="server" OnClientUploadComplete="uploadComplete"
            OnUploadedComplete="ProcessUpload" ErrorBackColor="White" UploaderStyle="Modern" ViewStateMode="Disabled" CompleteBackColor="White" Height="33px" />
    <asp:Label ID="Label4" runat="server"></asp:Label>
    <asp:Label runat="server" Text=" " ID="Label5" />
            <br />
        </div>
        </center>
    </div>

    
</asp:Content>

