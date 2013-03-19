<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" CodeFile="edytujprofil.aspx.cs" Inherits="edytujprofil" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxControlToolkit" %>
<%@ Register assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.WebControls" tagprefix="asp" %>
<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 class="ulubieni">Edytuj profil</h2>
<p align="center">
     <div style="border-width: 0px; width:418px; margin-left:auto; margin-right:auto; height: 277px;">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="userid" DataSourceID="SqlDataSource1" DefaultMode="Edit" 
        Height="179px" Width="415px" style="margin-right: 82px; margin-left: 0px;" OnPageIndexChanging="DetailsView1_PageIndexChanging" BorderStyle="None" GridLines="None" >
        <CommandRowStyle Height="50px" />
        <EmptyDataRowStyle HorizontalAlign="Left" />
        <Fields>
            <asp:BoundField DataField="userid" HeaderText="userid" ReadOnly="True" 
                SortExpression="userid" Visible="False" />          
             <asp:BoundField DataField="Opis" HeaderText="Opis" 
                SortExpression="opis" ControlStyle-Height="50px" ControlStyle-Width="323px" >   

<ControlStyle Height="50px" Width="300px"></ControlStyle>
            </asp:BoundField>

            <asp:TemplateField HeaderText="Data Urodzin" ControlStyle-Width="100px">
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
                     
         &nbsp;</p>
    </div>
<p style="height: 22px; width: 432px">
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:FriendsConnectionString %>" SelectCommand="SELECT DISTINCT [wojewodztwo],[wojewodztwo_id] FROM [Wojewodztwa] ORDER BY [wojewodztwo] ASC"></asp:SqlDataSource>
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
         function uploadComplete(sender, args) {
             alert("Zdjęcie wrzucone!");
             var imgDisplay = $get("photo");
             window.location.reload()
             // var img = new Image();
             // img.src = "/photos/" + args.get_fileName();
             // imgDisplay.src = img.src;
         }
</script>
    <h3 class="ulubieni" dir="rtl">Zmień zdjęcie</h3>
Wybierz plik : 
    <asp:ScriptManager   
            ID="ScriptManager1"  
            runat="server"  
            >  
        </asp:ScriptManager>  
    <cc1:asyncfileupload ID="AsyncFileUpload1" runat="server" OnClientUploadComplete="uploadComplete"
            OnUploadedComplete="ProcessUpload" ErrorBackColor="White" UploaderStyle="Modern" ViewStateMode="Disabled" CompleteBackColor="White" Height="33px" />
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
   <asp:Label runat="server" Text=" " ID="uploadResult" />

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" style="margin-right: 42px" Width="148px">
    </asp:GridView>

<p align="center">
    <a href="javascript: history.go(-1)">Powrót</a></p>

</asp:Content>

