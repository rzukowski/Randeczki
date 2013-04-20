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
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" OnItemCreated="FillLabels">
        <ItemTemplate>
           <h3><%# Eval("username") %></h3>
            <img src='photos/<%# Eval("username") %>image.jpg' alt="No Photo" width="100px" height="100px" />
            <p />
            <span class="black">Płeć:</span> <%# Eval("plec") %>
            <br />
            <span class="black">Wojewodztwo: <%# Eval("wojewodztwo") %><br />

          <span class="black">Wiek:</span> <%# Eval("Wiek") %>
            <br />
                <span class="black">Wygląd:</span><asp:Label ID="Wygląd" runat="server"></asp:Label>
                <br />
                <span class="black">Wzrost:</span><asp:Label ID="Wzrost" runat="server"> cm</asp:Label>
                <br />
                <span class="black">Waga:</span><asp:Label ID="Waga" runat="server"> kg</asp:Label>
                <br />
           <span class="black">O mnie:</span> <%# Eval("opis") %><br />
            <span class="black">Uprawiany sport:</span> <asp:Label ID="Sporty" runat="server"></asp:Label><br />
            <a href='wyslijwiadomosc.aspx?userid=<%# Eval("userid") %>'> Wyslij wiadomość</a>
         </ItemTemplate>
</asp:FormView>
    <p align="center">
    <a href="javascript: history.go(-1)">Powrót</a></p>

</asp:Content>
