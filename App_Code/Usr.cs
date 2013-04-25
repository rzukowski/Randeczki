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
 //connection string pobrany z web.config
    public static string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["FriendsConnectionString"].ConnectionString;// @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\Raf\Documents\Visual Studio 2012\WebSites\WebSite5\App_Data\ASPNETDB.MDF;Integrated Security=True;User Instance=True";
		 
    //dodanie do ulubionych - dodanie do tabeli friends
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


    //wysłanie wiadomości - zapis do tabeli message

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
            SqlCommand cmd2 = new SqlCommand("insert into message_sent (sender_id,receiver_id,mssg,sentdate) values (@userid, @touserid,@message,getdate())", con);
            cmd2.Parameters.AddWithValue("@userid", fromuserid);
            cmd2.Parameters.AddWithValue("@touserid", touserid);
            cmd2.Parameters.AddWithValue("@message", message);
            cmd2.ExecuteNonQuery();
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

    //usunięcie z listy ulubionych
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
    //usuwanie wiadomości
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


    public static bool IncrementNotification(String userid)
    {
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE notifications SET numberOfNotifications=(numberOfNotifications + 1) WHERE userid=@userid",con);
            cmd.Parameters.AddWithValue("@userid", userid);
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

    public static bool DecrementNotification(String userid)
    {
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update notifications set numberOfNotifications=0 where userid=@userid",con);
            cmd.Parameters.AddWithValue("@userid", userid);
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

    public static int NumberOfNotifications(String userid)
    {
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select numberOfNotifications from notifications where userid=@userid",con);
            cmd.Parameters.AddWithValue("@userid", userid);
            SqlDataReader myReader = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
            myReader.Read();
            int number = myReader.GetInt32(0);
            if (number > 0) return number;
            else return 0;
        }
        catch (Exception ex)
        {
            HttpContext.Current.Trace.Write(ex.Message);
            return 0;

        }
        finally
        {
            con.Close();
        }


    }

    public static List<string> GetSporty(String userid)
    {
        List<string> sporty = new List<string>();
        SqlConnection con = new SqlConnection(ConnectionString);
        con.Open();

        SqlCommand cmd = new SqlCommand("SELECT sport_opis FROM Sport WHERE Sport.sport_id IN (SELECT sport_id FROM user_sport WHERE userid = @userid)", con);
        cmd.Parameters.AddWithValue("@userid", userid);
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
        return sporty;
    }

    //sprawdza czy user przez ostatnią godzinę odwiedzał danego usera (jeśli tak, to nie zapisujemy informacji o odwiedzinach w bazie)
    public static bool GetTime(string odwiedzanyid, string odwiedzilid, DateTime date)
    {
        SqlConnection con = new SqlConnection(ConnectionString);
        bool hasRows;
        SqlCommand cmd = new SqlCommand("SELECT * FROM Viewed where OdwiedzanyId = @odwiedzanyid AND OdwiedzilId= @odwiedzilid AND DATEDIFF(hour,Data,@date)<1 ", con);
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


    public static void SaveVisited(string odwiedzanyid, string odwiedzilid )
    {

        
        DateTime date = DateTime.Now;
        SqlConnection con = new SqlConnection(ConnectionString);
        if (!Usr.GetTime(odwiedzanyid, odwiedzilid, date))
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

    public static Dictionary<int,string> SelectSportIdSportOpis(){
        Dictionary<int, string> sporty = new Dictionary<int, string>();
        SqlDataReader reader = null;
        SqlConnection con = new SqlConnection(ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT DISTINCT [sport_id],[sport_opis] FROM [Sport]", con);
        con.Open();
        try
        {
           reader = cmd.ExecuteReader();
           while (reader.Read())
           {
               sporty.Add(reader.GetInt32(0), reader.GetString(1).ToString());

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
        return sporty;

    }


    public static void ExecuteCommandInsert(string id, string userid)
    {
        SqlConnection con = new SqlConnection(ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO user_sport VALUES (@userid,@id)", con);
        cmd.Parameters.AddWithValue("@userid", userid);
        cmd.Parameters.AddWithValue("@id", id);
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

    public static void ExecuteCommandDelete(string id, string userid)
    {
        SqlConnection con = new SqlConnection(ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("DELETE FROM user_sport WHERE userid=@userid AND sport_id = @id", con);
        cmd.Parameters.AddWithValue("@userid", userid);
        cmd.Parameters.AddWithValue("@id", id);
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

    public static int SelectBudowaCiala(String userid)
    {
        int budowa = 0;
        SqlDataReader reader = null;
        SqlConnection con = new SqlConnection(ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT budowa_ciala_id FROM Wyglad WHERE userid = @userid", con);
        cmd.Parameters.AddWithValue("@userid", userid);
        con.Open();

        try
        {
           reader  = cmd.ExecuteReader();
           while (reader.Read())
               budowa=reader.GetInt32(0);

        }

        catch (Exception ex)
        {
            HttpContext.Current.Trace.Write(ex.Message);

        }

        finally
        {
            con.Close();

        }

        return budowa;


    }

    public static string SelectOpisCiala(String userid)
    {
        string budowa = null;
        SqlDataReader reader = null;
        SqlConnection con = new SqlConnection(ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT budowa_ciala_opis FROM Budowa WHERE budowa_ciala_id = (SELECT budowa_ciala_id FROM Wyglad WHERE userid = @userid)", con);
        cmd.Parameters.AddWithValue("@userid", userid);
        con.Open();

        try
        {
            reader = cmd.ExecuteReader();
            while (reader.Read())
                budowa = reader.GetString(0);

        }

        catch (Exception ex)
        {
            HttpContext.Current.Trace.Write(ex.Message);

        }

        finally
        {
            con.Close();

        }

        return budowa;


    }


    public static int GetWzrost(String userid)
    {
        int wzrost = 0;
        SqlConnection con = new SqlConnection(ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT wzrost FROM Wyglad where userid=@userid", con);
        cmd.Parameters.AddWithValue("@userid", userid);

        try
        {
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
                wzrost = reader.GetInt32(0);
            reader.Close();

        }
        catch (Exception ex)
        {
            HttpContext.Current.Trace.Write(ex.Message);
        }
        finally
        {
            con.Close();
        }
        return wzrost;


    }

    public static int GetWaga(string userid)
    {
        int waga = 0;
        SqlConnection con = new SqlConnection(ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT waga FROM Wyglad where userid=@userid", con);
        cmd.Parameters.AddWithValue("@userid", userid);

        try
        {
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
                waga = reader.GetInt32(0);
            reader.Close();

        }
        catch (Exception ex)
        {
            HttpContext.Current.Trace.Write(ex.Message);
        }
        finally
        {
            con.Close();
        }
        return waga;

    }
    
    public static int GetPlecId(string userid){

        int plec=0;
        SqlConnection con = new SqlConnection(ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT plec_id FROM user_profile WHERE userid = @userid", con);
        cmd.Parameters.AddWithValue("@userid", userid);
        con.Open();

        try
        {
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
                try { plec = reader.GetInt32(0); }
                catch { }
            reader.Close();


        }

        catch (Exception ex)
        {
            HttpContext.Current.Trace.Write(ex.Message);
        }
        finally
        {
            con.Close();
        }
        return plec;


    }

    public static void UpdateDane(string opis,string userid,string dataUrodzin,int plec,int wojewodztwo)
    {
        SqlConnection con = new SqlConnection(ConnectionString);
        SqlCommand cmd = new SqlCommand("UPDATE user_profile set plec_id=@plec, birthdate=@birthdate, wojewodztwo_id=@wojewodztwo_id, opis=@opis  WHERE userid=@userid", con);
        con.Open();
        cmd.Parameters.AddWithValue("@plec", plec);
        cmd.Parameters.AddWithValue("@userid", userid);
        cmd.Parameters.AddWithValue("@wojewodztwo_id", wojewodztwo);
        cmd.Parameters.AddWithValue("@opis", opis);
        cmd.Parameters.AddWithValue("@birthdate", dataUrodzin);

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


    public static string GetOpis(string userid)
    {
        SqlConnection con = new SqlConnection(ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT opis FROM user_profile WHERE userid=@userid", con);
        cmd.Parameters.AddWithValue("@userid", userid);
        string opis = null;
        con.Open();
        try
        {
            SqlDataReader reader = cmd.ExecuteReader();
            try
            {
                while (reader.Read())
                    opis = reader.GetString(0);

            }
            catch { }
        }
        catch (Exception ex)
        {
            HttpContext.Current.Trace.Write(ex.Message);
        }
        finally
        {

            con.Close();
        }
        return opis;


    }

    public static int GetUserWojewodztwo(string userid)
    {
        SqlConnection con = new SqlConnection(ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT wojewodztwo_id FROM user_profile WHERE userid = @userid", con);
        cmd.Parameters.AddWithValue("@userid", userid);
        int wojewodztwo = 17;
        con.Open();
        try
        {
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
                try { wojewodztwo = reader.GetInt32(0); }
                catch { }
            reader.Close();


        }

        catch (Exception ex)
        {
            HttpContext.Current.Trace.Write(ex.Message);
        }
        finally
        {
            con.Close();
        }
        return wojewodztwo;
    }


    public static string GetUserBirthday(string userid)
    {
        string birthdate=null;
        SqlConnection con = new SqlConnection(ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT birthdate=(SUBSTRING(CAST(birthdate AS VARCHAR),0,11)) FROM user_profile WHERE userid = @userid", con);
        cmd.Parameters.AddWithValue("@userid", userid);
        con.Open();

        try
        {
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
                try { birthdate = reader.GetString(0); }
                catch { }
            reader.Close();


        }

        catch (Exception ex)
        {
            HttpContext.Current.Trace.Write(ex.Message);
        }
        finally
        {
            con.Close();
        }
        return birthdate;


    }

    public static string GetSaltFromUser(string username)
    {

        string salt = null;
        SqlConnection con = new SqlConnection(ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT PasswordSalt FROM aspnet_Membership WHERE userid = (SELECT userid FROM aspnet_Users WHERE UserName=@username)", con);
        cmd.Parameters.AddWithValue("@username", username);
        con.Open();

        try
        {
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
                try { salt = reader.GetString(0); }
                catch { }
            reader.Close();


        }

        catch (Exception ex)
        {
            HttpContext.Current.Trace.Write(ex.Message);
        }
        finally
        {
            con.Close();
        }

        return salt;

    }


    public static string GetUserToken(string username)
    {

        string token = null;
        SqlConnection con = new SqlConnection(ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT Token FROM aspnet_Membership WHERE userid = (SELECT userid FROM aspnet_Users WHERE UserName=@username)", con);
        cmd.Parameters.AddWithValue("@username", username);
        con.Open();

        try
        {
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
                try { token = reader.GetString(0); }
                catch { }
            reader.Close();


        }

        catch (Exception ex)
        {
            HttpContext.Current.Trace.Write(ex.Message);
        }
        finally
        {
            con.Close();
        }

        return token;

    }

    public static bool SaveTokenToDb(string token,string username){

        bool updated = false;
        SqlConnection con = new SqlConnection(ConnectionString);
        SqlCommand cmd = new SqlCommand("UPDATE aspnet_Membership SET Token=@token WHERE userid= (SELECT userid from aspnet_Users WHERE username=@username)", con);
        cmd.Parameters.AddWithValue("@username", username);
        cmd.Parameters.AddWithValue("@token", token);
        con.Open();

        try
        {
            if(cmd.ExecuteNonQuery()>0)
                updated = true;
            

        }

        catch (Exception ex)
        {
            HttpContext.Current.Trace.Write(ex.Message);
            updated = false;
        }
        finally
        {
            con.Close();
        }

        return updated;

    }


	}
