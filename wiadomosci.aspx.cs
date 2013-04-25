using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Base;
public partial class wiadomosci : BaseClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
       

        String userid = Session["userid"].ToString();
        Usr.DecrementNotification(userid);
    }
}