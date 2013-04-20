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




    protected void FillLabels(object sender, EventArgs e)
    {
        SelectSporty();
        FillWzrost();


    }

    protected void SelectSporty()
    {
      string userid = Request.QueryString["userid"];
      List<string> sporty = Usr.GetSporty(userid);
      

        Label sportyUsera = (Label)FormView1.FindControl("Sporty");
        sportyUsera.Text = string.Join(",", sporty);



    }

    protected void FillWzrost()
    {
        string userid = Request.QueryString["userid"];
        int wzrost = Usr.GetWzrost(userid);
        if (wzrost != null)
        {
            Label WzrostL = (Label)FormView1.FindControl("Wzrost");
            WzrostL.Text = wzrost.ToString();
        }




    }

    protected void FillWaga()
    {
        string userid = Request.QueryString["userid"];
        int waga = Usr.GetWaga(userid);
        if (waga != null)
        {
            Label Waga = (Label)FormView1.FindControl("Waga");
            Waga.Text = waga.ToString();

        }


    }

    protected void FillWyglad()
    {
        string userid = Request.QueryString["userid"];
        string wyglad = Usr.SelectOpisCiala(userid);

        if (wyglad != null)
        {

            Label Wyglad = (Label)FormView1.FindControl("Wyglad");
            Wyglad.Text = wyglad;

        }


    }
}