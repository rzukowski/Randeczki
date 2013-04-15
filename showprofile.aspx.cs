using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;

public partial class showprofile : System.Web.UI.Page
{

    public static string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["FriendsConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["username"].ToString() == "" || Session["username"] == null)
            {

                Response.Redirect("~/Zaloguj.aspx");

            }
        }
        catch
        {
            Response.Redirect("~/Zaloguj.aspx");
        }

       // String username = Request.QueryString["username"];
      //  String pth = Server.MapPath("./") + username + "image.jpg";
     //   if (System.IO.File.Exists(pth))
     //   {
     //       photoProfile.ImageUrl = "photos/" + username + "image.jpg";
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "image", "top.$get(\"photoProfile\").src = 'photos/" + username + "image.jpg" + "';", true);
    //    }
    //    else
    //    {
    //        photoProfile.ImageUrl = "photos/default.jpg";
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "image", "top.$get(\"photoProfile\").src = 'photos/default.jpg';", true);
    //    }

        string odwiedzanyid = Request.QueryString["userid"];
        string odwiedzilid = Session["userid"].ToString();
        Usr.SaveVisited(odwiedzanyid,odwiedzanyid);

    }


   

   

    protected void SelectSporty(object sender, EventArgs e)
    {
      string userid = Request.QueryString["userid"];
      List<string> sporty = Usr.GetSporty(userid);
      

        Label sportyUsera = (Label)FormView1.FindControl("Sporty");
        sportyUsera.Text = string.Join(",", sporty);



    }
}