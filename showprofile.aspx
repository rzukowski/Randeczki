<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" CodeFile="showprofile.aspx.cs" Inherits="showprofile"%>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="span8">
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
          <div class="row">
            <div class="span2">
                <img src='photos/<%# Eval("username") %>image.jpg' alt="No Photo" width="100px" height="100px" class="img-polaroid" />
                <br /><span class="black">O mnie:</span> <%# Eval("opis") %>
            </div>
            <div class="span5">
                <h3><%# Eval("username") %></h3>
                <span class="black">Płeć:</span> <%# Eval("plec") %> 
                <span class="black">Wiek:</span> <%# Eval("Wiek") %>
                <br />
                <span class="black">Wojewodztwo: <%# Eval("wojewodztwo") %>
                <br />
                <asp:Label ID="Wyglad" runat="server"><br /></asp:Label>
                
                <asp:Label ID="Wzrost" runat="server"><br /></asp:Label>
                
                <asp:Label ID="Waga" runat="server"> <br /></asp:Label>   
                <span class="black">Uprawiany sport:</span> <asp:Label ID="Sporty" runat="server"></asp:Label>
            </div>
              <br />
                    <a href='wyslijwiadomosc.aspx?userid=<%# Eval("userid") %>' class="btn btn-success"> Wyslij wiadomość</a>
                    <a href="javascript: history.go(-1)" class="btn btn-warning">Powrót</a>
          </div>
         </ItemTemplate>
</asp:FormView>
    <p align="center">
    </p>
</div>
</asp:Content>
