using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using Base;
public partial class showprofile : BaseClass
{

    public static string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["FriendsConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        

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
        Usr.SaveVisited(odwiedzanyid, odwiedzilid);

    }




    protected void FillLabels(object sender, EventArgs e)
    {
        SelectSporty();
        FillWzrost();
        FillWaga();
        FillWyglad();

    }

    protected void SelectSporty()
    {
      string userid = Request.QueryString["userid"];
      List<string> sporty = Usr.GetSporty(userid);
        Label sportyUsera = (Label)FormView1.FindControl("Sporty");
      if (sporty != null)
      {
          
          sportyUsera.Text = string.Join(", ", sporty);
      }
      else
      {
          sportyUsera.Visible = false;
      }

    }

    protected void FillWzrost()
    {
        string userid = Request.QueryString["userid"];
        int wzrost = Usr.GetWzrost(userid);
        Label WzrostL = (Label)FormView1.FindControl("Wzrost");
        if (wzrost != null && wzrost!=0)
        {

            WzrostL.Text = "Wzrost: " + wzrost.ToString() + " cm" + "<br \\>";
        }
        else
        {
            WzrostL.Visible = false;
        }


    }

    protected void FillWaga()
    {
        string userid = Request.QueryString["userid"];
        int waga = Usr.GetWaga(userid);
        Label Waga = (Label)FormView1.FindControl("Waga");
        if (waga != null && waga!=0)
        {

            Waga.Text = "Waga: " + waga.ToString() + " kg" + "<br \\>";

        }
        else
        {
            Waga.Visible = false;

        }


    }

    protected void FillWyglad()
    {
        string userid = Request.QueryString["userid"];
        string wyglad = Usr.SelectOpisCiala(userid);
        Label Wyglad = (Label)FormView1.FindControl("Wyglad");
        if (wyglad != null)
        {


            Wyglad.Text = "Budowa: " + wyglad + "<br \\>";

        }
        else
        {
            Wyglad.Visible = false;

        }


    }
}