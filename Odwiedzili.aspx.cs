using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;

public partial class Odwiedzili : System.Web.UI.Page
{
    public static string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["FriendsConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"].ToString() == "" || Session["username"] == null)
        {

            Response.Redirect("~/Zaloguj.aspx");

        }

        if(!IsPostBack)
        ResetViewed();
    }

    protected void ResetViewed()
    {

        string odwiedzanyId= Session["userid"].ToString();
        SqlConnection con = new SqlConnection(ConnectionString);
        SqlCommand cmd = new SqlCommand("UPDATE Viewed SET viewed = 1 WHERE OdwiedzanyId = @odwiedzanyId", con);
        cmd.Parameters.AddWithValue("@odwiedzanyId", odwiedzanyId);
        con.Open();
        try
        {
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