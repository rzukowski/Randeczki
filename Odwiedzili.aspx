<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/MasterPage.master" Title="Untitled Page" CodeFile="Odwiedzili.aspx.cs" Inherits="Odwiedzili" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" groupitemcount = "3">
     <LayoutTemplate>
            <table cellpadding="5pt" id="users" width="200px">
            <tr id="groupPlaceHolder" runat="server">
             </tr>
            </table>
          </LayoutTemplate>
          <GroupTemplate>
            <tr>
             <td id="itemPlaceHolder" runat="server" />
            </td>
            </tr>
          </GroupTemplate>
  
          <ItemTemplate>
            <td id="prof">
                <h4>
                  <%# Eval("username") %></h4>
                Odwiedził: <%# Eval("Data") %><br />
                 <img src='photos/<%# Eval("username") %>image.jpg' alt="" width="100px" height="100px" />  <br />
              <a href='showprofile.aspx?userid=<%# Eval("userid") %>&<%# Eval("username") %>'>Pokaż profil</a>
                <br />
              
              
              <a href='wyslijwiadomosc.aspx?userid=<%# Eval("userid") %>'>Wyślij wiadomość</a>
              </td>
          </ItemTemplate>
    </asp:ListView>
    <asp:DataPager ID="lvDataPager1" runat="server" PagedControlID="ListView1" PageSize="1">
            <Fields>
                <asp:NumericPagerField ButtonType="Link" />
            </Fields>
        </asp:DataPager>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FriendsConnectionString %>" 
            SelectCommand="PokazOdwiedzone" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="userid" SessionField="userid" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>
