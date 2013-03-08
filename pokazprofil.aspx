<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" CodeFile="pokazprofil.aspx.cs" inherits="pokazprofil" Title="Untitled Page" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FriendsConnectionString %>" 
        SelectCommand="SELECT * FROM [user_profile] WHERE ([userid] = @userid)">
        <SelectParameters>
            <asp:Parameter Name="userid" Type="Object" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="userid" DataSourceID="LinqDataSource1">
        <Fields>
            <asp:BoundField DataField="userid" HeaderText="userid" ReadOnly="True" SortExpression="userid" />
            <asp:BoundField DataField="fullname" HeaderText="fullname" SortExpression="fullname" />
            <asp:BoundField DataField="plec" HeaderText="plec" SortExpression="plec" />
            <asp:BoundField DataField="birthdate" HeaderText="birthdate" SortExpression="birthdate" />
            <asp:BoundField DataField="opis" HeaderText="opis" SortExpression="opis" />
        </Fields>
    </asp:DetailsView>

    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DataClassesDataContext" EnableUpdate="True" EntityTypeName="" TableName="user_profiles" OnSelecting="LinqDataSource1_Selecting" Where="userid == @userid">
        <WhereParameters>
            <asp:QueryStringParameter DbType="Guid" Name="userid" QueryStringField="userid" />
        </WhereParameters>
    </asp:LinqDataSource>

</asp:Content>