using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class usunwiadomosc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String msgid = Request.QueryString["msgid"];
        if (Usr.DeleteMssg(msgid))
            lbl.Text = "Wiadomość usunięta! Aby powrócić kliknij <a href=wiadomosci.aspx>tutaj</a>";
        else
            lbl.Text = "Wiadomość nie została usunięta! Aby powrócić i ewentualnie spróbować jeszcze raz kliknij <a href=wiadomosci.aspx>tutaj</a";

    }
}