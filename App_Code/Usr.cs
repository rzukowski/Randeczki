using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
/// <summary>
/// Summary description for Usr
/// </summary>
public class Usr
{
    public static string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["FriendsConnectionString"].ConnectionString;// @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\Raf\Documents\Visual Studio 2012\WebSites\WebSite5\App_Data\ASPNETDB.MDF;Integrated Security=True;User Instance=True";
		 public static bool AddFriend(String userid, String friendid)
    {
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into friends values (@userid, @friendid)", con);
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Parameters.AddWithValue("@friendid",friendid);
            cmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception ex)
        {
            HttpContext.Current.Trace.Write(ex.Message);
            return false;
        }
        finally
        {
            con.Close();
        }
    }




    public static bool SendMssg(String fromuserid, String touserid ,  String message)
    {
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into message (sendid,receivid,mssg,sentdate) values (@userid, @touserid,@message,getdate())", con);
            cmd.Parameters.AddWithValue("@userid", fromuserid);
            cmd.Parameters.AddWithValue("@touserid", touserid);
            cmd.Parameters.AddWithValue("@message", message);
            cmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception ex)
        {
            HttpContext.Current.Trace.Write(ex.Message);
            return false;
        }
        finally
        {
            con.Close();
        }
    }

    public static bool DeleteFriend(String userid, String friendid)
    {
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from friends where userid = @userid and friendid = @friendid", con);
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Parameters.AddWithValue("@friendid", friendid);
            cmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception ex)
        {
            HttpContext.Current.Trace.Write(ex.Message);
            return false;
        }
        finally
        {
            con.Close();
        }
    }

    public static bool DeleteMssg(String msgid)
    {
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from message where msgid = @msgid", con);
            cmd.Parameters.AddWithValue("@msgid", msgid);
            cmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception ex)
        {
            HttpContext.Current.Trace.Write(ex.Message);
            return false;
        }
        finally
        {
            con.Close();
        }
    }

	}
