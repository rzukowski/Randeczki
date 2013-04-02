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

        if (Session["username"].ToString() == "" || Session["username"] == null)
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
        SaveVisited();

    }


    protected void SaveVisited()
    {

        string odwiedzanyid = Request.QueryString["userid"];
        string odwiedzilid = Session["userid"].ToString();
        DateTime date = DateTime.Now;
        SqlConnection con = new SqlConnection(ConnectionString);
        if (!GetTime(odwiedzanyid,odwiedzilid,date))
        {
            try
            {
                
                SqlCommand cmd = new SqlCommand("INSERT INTO Viewed (OdwiedzanyId,OdwiedzilId,Data,viewed) VALUES (@odwiedzanyid,@odwiedzilid,@date,0)", con);
                cmd.Parameters.AddWithValue("@odwiedzanyid", odwiedzanyid);
                cmd.Parameters.AddWithValue("@odwiedzilid", odwiedzilid);
                cmd.Parameters.AddWithValue("@date", date);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                HttpContext.Current.Trace.Write(ex.Message);

            }
            finally
            {
                con.Close();
            }
        }
    }

    //sprawdza czy user przez ostatnią godzinę odwiedzał danego usera (jeśli tak, to nie zapisujemy informacji o odwiedzinach w bazie)
    public bool GetTime(string odwiedzanyid, string odwiedzilid, DateTime date)
    {
        SqlConnection con = new SqlConnection(ConnectionString);
        bool hasRows;
        SqlCommand cmd = new SqlCommand("SELECT * FROM Viewed where OdwiedzanyId = @odwiedzanyid AND OdwiedzilId= @odwiedzilid AND DATEDIFF(hour,Data,@date)<1 ",con);
        cmd.Parameters.AddWithValue("@odwiedzanyid", odwiedzanyid);
        cmd.Parameters.AddWithValue("@odwiedzilid", odwiedzilid);
        cmd.Parameters.AddWithValue("@date", date);
        con.Open();

        try
        {
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.HasRows)
                   hasRows = true;
                else
                   hasRows = false;
            }
        }
        catch (Exception ex)
        {

            HttpContext.Current.Trace.Write(ex.Message);
            hasRows = true;
        }
        finally
        {
            con.Close();
        }

        return hasRows;

    }

    protected void SelectSporty(object sender, EventArgs e)
    {
      string userid = Request.QueryString["userid"];
      List <string> sporty= new List<string>();
      SqlConnection con = new SqlConnection(ConnectionString);
      SqlCommand cmd = new SqlCommand("SELECT sport_opis FROM Sport s WHERE s.sport_id IN (SELECT sport_id FROM user_sport WHERE userid = @userid)", con);
      cmd.Parameters.AddWithValue("@userid", userid);
      con.Open();
    
        try
        {
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                    sporty.Add(reader.GetString(0));
                reader.Close();
            }
        }
        catch (Exception ex)
        {

            HttpContext.Current.Trace.Write(ex.Message);
        }
        finally
        {
            con.Close();
        }

        Label sportyUsera = (Label)FormView1.FindControl("Sporty");
        sportyUsera.Text = string.Join(",", sporty);



    }
}