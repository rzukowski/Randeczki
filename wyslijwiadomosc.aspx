<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="wyslijwiadomosc.aspx.cs" Inherits="wyslijwiadomosc" Title="Untitled Page"  Trace="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
  <div class="span4">
    <p>
        <asp:TextBox ID="txtMessage" runat="server" Columns="50" Rows="5" 
            TextMode="MultiLine" placeholder="Podaj treść wiadomości.."></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="wyslijButton" runat="server" Text="Wyślij Wiadomość" onclick="Wyslij" CssClass="btn btn-success" />
        <a href="javascript: history.go(-1)" class="btn btn-warning">Powrót</a>
    </p>
    <p>
        <asp:Label ID="lbl" runat="server"></asp:Label>
    </p>
  </div> 
</asp:Content>

