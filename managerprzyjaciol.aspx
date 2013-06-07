<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>

<script runat="server">

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (ddlFriends.SelectedItem != null)
        {
            String userid = Session["userid"].ToString();
            String friendid = ddlFriends.SelectedItem.Value;
            if (Usr.DeleteFriend(userid, friendid))
                Response.Redirect("default.aspx");
            else
                lbl.Text = "Błąd usuwania!";
        }
    }
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <h5>Wybierz profil do usunięcia z ulubionych :</h5><br />
    <p>
        <asp:DropDownList ID="ddlFriends" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="UserName" 
            DataValueField="userid" Height="35px" Width="150px">
        </asp:DropDownList>
&nbsp;<asp:Button ID="btnDelete" runat="server" onclick="btnDelete_Click" Text="Usuń" CssClass="btn btn-large btn-danger" />
    </p>
    </center>
    <p>
        <asp:Label ID="lbl" runat="server"></asp:Label>
    </p>
    <p>&nbsp;</p>
   <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FriendsConnectionString %>" SelectCommand="select userid, UserName from aspnet_Users
where userid in (select friendid from friends where userid = @userid)">
        <SelectParameters>
            <asp:SessionParameter Name="userid" SessionField="userid" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

