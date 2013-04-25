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
public partial class Odwiedzili : BaseClass
{
    public static string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["FriendsConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        FillOdwiedzili();

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


    protected void FillOdwiedzili()
    {
        string userid=Session["userid"].ToString();
        DataClassesDataContext db = new DataClassesDataContext(ConnectionString);

        var cos = from c in db.PokazOdwiedzone(userid).Skip(0).Take(2) select c;

        ListView1.DataSource = cos.ToList();
        ListView1.DataBind();




    }

}