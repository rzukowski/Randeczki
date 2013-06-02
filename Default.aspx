<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="Untitled Page" %>

<%@ Register assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.WebControls" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript" src="Scripts/OnHoverShowOpis.js"></script>
     <script type="text/javascript">
       
    $(document).ready(function () {
            BindEvents();
    });
        </script>
   
    <asp:Panel ID="Panel1" BorderStyle="None" runat="server">
   <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" groupitemcount = "3">
     <LayoutTemplate>
            <table cellpadding="5pt" id="users">
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
          <li class="span2" style="list-style: none outside none;margin-left:10px;margin-bottom:10px;">
              <div class="thumbnail">
                 <img src='photos/<%# Eval("username") %>image.jpg' alt="" id='<%# Eval("username") %>p' class="img-polaroid2" style="width:100px;height:100px;" />
                  <div class="caption">
                <h3><%# Eval("username") %></h3>
                  <p class="opis" id='<%# Eval("username") %>'><%# Eval("opis") %></p>
                    <p align="center"><a href='showprofile.aspx?userid=<%# Eval("userid") %>&<%# Eval("username") %>' class="btn btn-primary btn-block">Pokaż profil</a></p>
                      <p align="center"><a href='wyslijwiadomosc.aspx?userid=<%# Eval("userid") %>' class="btn btn-info btn-block">Wyślij wiadomość</a></p>
                 </div>
              </div>
             </li>
          </ItemTemplate>
    </asp:ListView>
    <p/>
   
    <p/>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FriendsConnectionString %>" 
            SelectCommand="PokazUlubione" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="userid" SessionField="userid" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
<p>
        </asp:Panel>

</asp:Content>

