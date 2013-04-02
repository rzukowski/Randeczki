using System;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected string UploadFolderPath = "~/photos/";
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
        catch (NullReferenceException) { Response.Redirect("~/Zaloguj.aspx"); }

        string pht = "photos/" + Session["username"] + "image.jpg";
        string def = Server.MapPath("./") + "photos\\default.jpg";
        string usrPhoto = Server.MapPath("./") + "photos\\" + Session["username"] + "image.jpg";
        if (System.IO.File.Exists(usrPhoto))
        {
            photo.ImageUrl = pht;
        }
        else
        {
            photo.ImageUrl = "photos/default.jpg";
            System.IO.File.Copy(def, usrPhoto);
        }
        

        string userid = Session["userid"].ToString();
        int numberOfMssg=Usr.NumberOfNotifications(userid);
        if (numberOfMssg > 0)
        {
            Label myLabel = this.FindControl("NowaWiadomosc") as Label;
            myLabel.Text = numberOfMssg.ToString(); ;


        }

        Label OdwiedziliTotal = this.FindControl("OdwiedziliTotal") as Label;
        Label OdwiedziliNew = this.FindControl("OdwiedziliNew") as Label;
        if (GetNumberOfNewVisits() == 0)
        {
            OdwiedziliNew.Visible = false;
        }
        else
        {
            OdwiedziliNew.Text = GetNumberOfNewVisits().ToString()+"/";
        }
        OdwiedziliTotal.Text = GetNumberOfAllVisits().ToString();


    }

    protected void MenuGlowne_MenuItemClick(object sender, MenuEventArgs e)
    {

    }

    //pobiera liczbę nowych wizyt na naszym profilu
    protected int GetNumberOfNewVisits()
    {
        string userid = Session["userid"].ToString();
        int numberOfVisits=0;
        SqlConnection con = new SqlConnection(ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Viewed where OdwiedzanyId = @userid AND viewed = 0", con);
        cmd.Parameters.AddWithValue("@userid", userid);
        con.Open();
        try
        {
            numberOfVisits = (int)cmd.ExecuteScalar();
                
           
        }
        catch (Exception ex)
        {

            HttpContext.Current.Trace.Write(ex.Message);
            numberOfVisits = 0;
        }
        finally
        {
            con.Close();
        }
        if (numberOfVisits > 0)
        {
            return numberOfVisits;
        }
        else
            return 0;


    }

    //pobiera całkowitą liczbę wizyt
    protected int GetNumberOfAllVisits()
    {
        string userid = Session["userid"].ToString();
        int numberOfVisits = 0;
        SqlConnection con = new SqlConnection(ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT Count(*) FROM Viewed where OdwiedzanyId = @userid", con);
        cmd.Parameters.AddWithValue("@userid", userid);
        con.Open();
        try
        {
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                    numberOfVisits = reader.GetInt32(0);
                reader.Close();
            }
        }
        catch (Exception ex)
        {

            HttpContext.Current.Trace.Write(ex.Message);
            numberOfVisits = 0;
        }
        finally
        {
            con.Close();
        }
        if (numberOfVisits > 0)
        {
            return numberOfVisits;
        }
        else
            return 0;


    }
}
