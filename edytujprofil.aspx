<%@ Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" CodeFile="edytujprofil.aspx.cs" Inherits="edytujprofil" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxControlToolkit" %>
<%@ Register assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.WebControls" tagprefix="asp" %>

<script runat="server">

</script>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            //dla każdego miejsca z tabami
            $('.zakladki').each(function () {
                var $li = $(this).children('li');
                //przy wejsciu na strone ukrywamy tresc tabow i pokazujemy tylko aktywny...
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
    </script>
    <h2 class="ulubieni">Edytuj profil</h2>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <ul class="zakladki">
        <li class="active"><a href="#Zainteresowania" class="active">Zainteresowania</a></li>
        <li><a href="#Dane">Dane osobowe</a></li>
        <li><a href="#Zdjecie">Zmiana zdjęcia</a></li>
        <li><a href="#Wyglad">Wygląd</a></li>
</ul>

    <div id="Wyglad">
        <P>
            <asp:UpdatePanel runat="server" id="UpdatePanel2" updatemode="Conditional">
         <ContentTemplate>
       Budowa ciała: <asp:RadioButtonList ID="DDLWyglad" runat="server" DataTextField="budowa_opis" DataValueField="budowa_id" Width="200px" AppendDataBoundItems="True"></asp:RadioButtonList>
            <p>
       Wzrost: <asp:TextBox ID="TBWzrost" runat="server" Height="22px" Width="20px"></asp:TextBox>cm
                </p>
            <p>
        Waga: <asp:TextBox ID="TBWaga" runat="server" Height="22px" Width="20px"></asp:TextBox>kg
            </p>
             <p>
        BMI: <asp:Label runat="server" id="LBmi"></asp:Label>
            </p>
            <asp:Button ID="UpdateWyglad" runat="server" Text="Zmień" OnClick="Update_Wyglad"/>
             </ContentTemplate>
             </asp:UpdatePanel>
        </P>
    </div>

    <div id="Zainteresowania">
    <%-- Check box rozwijany ze sportami --%>
   <h4 class="center"> Sport</h4>
    
    <asp:UpdatePanel runat="server" id="UpdatePanel" updatemode="Conditional">
         <ContentTemplate>
     <div id="divDDL" class="divDDL" runat="server">
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
         <asp:Button ID="Button2" runat="server" Text="Zmień" OnClick="Update_User_Sport_Table"/>

        </p>
             </ContentTemplate>
        </asp:UpdatePanel>



   
        </div>
    <div id="Dane">
        <asp:UpdatePanel runat="server" id="UpdatePanel1" updatemode="Conditional">
         <ContentTemplate>
     <div style="border-width: 0px; width:418px; margin-left:auto; margin-right:auto; height: 277px;">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="userid" DataSourceID="SqlDataSource1" DefaultMode="Edit" 
        Height="179px" Width="415px" style="margin-right: 82px; margin-left: 0px;" BorderStyle="None" GridLines="None" >
        <CommandRowStyle Height="50px" />
        <EmptyDataRowStyle HorizontalAlign="Left" />
        <Fields>
            <asp:BoundField DataField="userid" HeaderText="userid" ReadOnly="True" 
                SortExpression="userid" Visible="False" />          
             <asp:BoundField DataField="Opis" HeaderText="Opis" 
                SortExpression="opis" ControlStyle-Height="50px" ControlStyle-Width="323px" >   

<ControlStyle Height="50px" Width="300px"></ControlStyle>
            </asp:BoundField>

            <asp:TemplateField HeaderText="Data Urodzin" ControlStyle-Width="100px" ControlStyle-BorderStyle="NotSet">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%#  Bind("birthdate") %>' Height="22px" Width="300px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Format daty urodzin: yyyy-MM-dd (np. 1977-12-20)" ValidationExpression="^(19|20)\d\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$" Display="Dynamic" Font-Size="13px" Font-Underline="False"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("birthdate") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("birthdate") %>'></asp:Label>
                </ItemTemplate>

<ControlStyle Width="100px"></ControlStyle>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="Płeć">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="plec" DataValueField="plec" SelectedValue='<%# Bind("plec") %>' Width="100px" AppendDataBoundItems="True">
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("plec") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("plec") %>'></asp:Label>
                </ItemTemplate>
</asp:TemplateField>

            <asp:TemplateField HeaderText="Województwo">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="wojewodztwo" DataValueField="wojewodztwo_id" SelectedValue='<%# Bind("wojewodztwo_id") %>' Width="100px" AppendDataBoundItems="True">
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("wojewodztwo_id") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("wojewodztwo_id") %>'></asp:Label>
                </ItemTemplate>
</asp:TemplateField>
<asp:CommandField ShowEditButton="True" CancelText="Anuluj" DeleteText="Usuń" EditText="Edytuj" UpdateText="Zmień" CausesValidation="False" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center" InsertVisible="True" ShowDeleteButton="False" />
            
        </Fields>

        <RowStyle Height="60px" HorizontalAlign="Left" VerticalAlign="Top" />
    </asp:DetailsView>
</div>
             </ContentTemplate>
        </asp:UpdatePanel>
</div>

         <br />                   

<p style="height: 22px; width: 432px">
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:FriendsConnectionString %>" SelectCommand="SELECT DISTINCT [wojewodztwo],[wojewodztwo_id] FROM [Wojewodztwa] ORDER BY [wojewodztwo_id] DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FriendsConnectionString %>" SelectCommand="SELECT DISTINCT [plec] FROM [plecDummy]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FriendsConnectionString %>" 
        SelectCommand="SELECT userid,fullname,opis,plec,birthdate=(SUBSTRING(CAST(birthdate AS VARCHAR),0,11)),wojewodztwo_id FROM [user_profile] WHERE ([userid] = @userid)"
        DeleteCommand="DELETE FROM [user_profile] WHERE [userid] = @userid" 
        InsertCommand="INSERT INTO [user_profile] ([userid], [fullname],[plec],[opis],[birthdate],[wojewodztwo_id]) VALUES (@userid, @fullname, @plec, @opis, @birthdate,@wojewodztwo_id)" 
        UpdateCommand="UPDATE [user_profile] SET [fullname] = @fullname, [plec] = @plec, [opis]=@opis, [birthdate]=@birthdate,[wojewodztwo_id]=@wojewodztwo_id WHERE [userid] = @userid">
    <SelectParameters>
            <asp:SessionParameter Name="userid" SessionField="userid" Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="userid" Type="Object" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="DetailsView1$DropDownList1" Name="plec" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DetailsView1$DropDownList2" Name="wojewodztwo_id" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="fullname" Type="String" />
            <asp:Parameter Name="opis" Type="String" />
            <asp:Parameter Name="birthdate" Type="DateTime" />
            <asp:Parameter Name="userid" Type="Object" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="userid" Type="Object" />
            <asp:Parameter Name="fullname" Type="String" />
            <asp:Parameter Name="opis" Type="String" />
            <asp:Parameter Name="plec" Type="String" />
            <asp:Parameter Name="birthdate" Type="DateTime" />
        </InsertParameters>
    </asp:SqlDataSource>

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
            <h3 class="ulubieni" dir="rtl">Zmień zdjęcie</h3>
Wybierz plik : 
  
        </asp:ScriptManager>  
    <cc1:asyncfileupload ID="AsyncFileUpload1" runat="server" OnClientUploadComplete="uploadComplete"
            OnUploadedComplete="ProcessUpload" ErrorBackColor="White" UploaderStyle="Modern" ViewStateMode="Disabled" CompleteBackColor="White" Height="33px" />
    <asp:Label ID="Label4" runat="server"></asp:Label>
   <asp:Label runat="server" Text=" " ID="Label5" />
        </div>

    
</asp:Content>

