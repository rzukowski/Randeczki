<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" CodeFile="showprofile.aspx.cs" Inherits="showprofile"%>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FriendsConnectionString %>" 
        SelectCommand="SzczegolyProf" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="userid" QueryStringField="userid" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
           <h3><%# Eval("username") %></h3>
            <img src='photos/<%# Eval("username") %>image.jpg' alt="No Photo" width="100px" height="100px" />
            <p />
            <span class="black">Płeć:</span> <%# Eval("plec") %>
            <br />
          <span class="black">Data Urodzin:</span> <%# Eval("birthdate") %>
            <br />
           <span class="black">O mnie:</span> <%# Eval("opis") %><br />
            <a href='wyslijwiadomosc.aspx?userid=<%# Eval("userid") %>'> Wyslij wiadomość</a>
         </ItemTemplate>
</asp:FormView>
    <p align="center">
    <a href="javascript: history.go(-1)">Powrót</a></p>

</asp:Content>
