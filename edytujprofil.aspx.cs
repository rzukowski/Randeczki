using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
public partial class edytujprofil : System.Web.UI.Page
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

        if (!IsPostBack)
        {
            try
            {
                BuildCheckBox();
                CheckWygladDropDownList();
                FillWzrost();
                FillWaga();
                FillBMI();
            }
            catch (Exception ex)
            {
                HttpContext.Current.Trace.Write(ex.Message);
            }

        }
       
    }

    protected void BuildCheckBox()
    {
        SqlConnection con = new SqlConnection(ConnectionString);

        //dodaje do checkboxlist elementy
        // Dictionary<int, string> sportyCat = DataSource();
        CheckBoxList checkedListBox1 = (CheckBoxList)pnlCustomers.FindControl("cblCustomerList");
        SqlCommand cmd = new SqlCommand("SELECT DISTINCT [sport_id],[sport_opis] FROM [Sport]", con);
        con.Open();
        SqlDataReader reader = cmd.ExecuteReader();

        checkedListBox1.DataSource = reader;
        checkedListBox1.DataTextField = "sport_opis";
        checkedListBox1.DataValueField = "sport_id";
        checkedListBox1.DataBind();

        //        foreach (KeyValuePair<int, string> pair in sportyCat)
        //         {
        //            
        //         checkedListBox1.Items.Add(new ListItem(pair.Key.ToString(),pair.Value));
        //        }

       
        con.Close();
        //idz do metody zaznaczającej dane z bazy
        SelectCheckBox();

    }

    //metoda pobierająca wszystkie kategorie sportu uprawiane przez danego usera (tabela user_sport);
    protected List<string> GetSportsFromUserSportTable(string userid)
    {
        SqlConnection con = new SqlConnection(ConnectionString);
        List<string> sporty = new List<string>();

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

    //metoda do zaznaczenia elementów z bazy danych usera w liscie rozwijanej (sport)
    protected void SelectCheckBox()
    {
        List<string> sporty = new List<string>();
        string userid = Session["userid"].ToString();

        sporty = GetSportsFromUserSportTable(userid);

        if (sporty.Count > 0)
        {
            CheckBoxList checkedListBox1 = (CheckBoxList)pnlCustomers.FindControl("cblCustomerList");
            foreach (ListItem li in checkedListBox1.Items)
            {
                if (sporty.Contains(li.Text))
                {
                    li.Selected = true;
                }
            }
        }
        if(sporty.Count==1){
            divDDL.InnerText = "1 element";
        }
        else if (sporty.Count < 5)
        {

            divDDL.InnerText = sporty.Count + " elementy";

        }
        else
        {
            divDDL.InnerText = sporty.Count + " elementów";

        }
    }

    //metoda updajtująca tabelę User_Sport
    protected void Update_User_Sport_Table(object sender, EventArgs e)
    {
       
        string userid = Session["userid"].ToString();
        int selectedSportsNumber = 0;
        List<string> sporty = GetSportsFromUserSportTable(userid);
        CheckBoxList checkedListBox1 = (CheckBoxList)pnlCustomers.FindControl("cblCustomerList");
        foreach (ListItem li in checkedListBox1.Items)
        {
            if (li.Selected && !sporty.Contains(li.Text) )
            {
                try
                {
                    ExecuteCommandInsert(li.Value, userid);
                    selectedSportsNumber++;
                }
                catch (Exception ex)
                {
                    HttpContext.Current.Trace.Write(ex.Message);
                }
            }
            else if (!li.Selected && sporty.Contains(li.Text))
            {
                try
                {
                    ExecuteCommandDelete(li.Value, userid);

                }
                catch (Exception ex)
                {
                    HttpContext.Current.Trace.Write(ex.Message);
                }

            }
            else if (li.Selected && sporty.Contains(li.Text))
            {
                selectedSportsNumber++;
            }
        }
        
        if (selectedSportsNumber == 1)
        {
            divDDL.InnerText = "1 element";
        }
        else if (selectedSportsNumber < 5 && selectedSportsNumber > 0)
        {

            divDDL.InnerText = selectedSportsNumber + " elementy";

        }
        else
        {
            divDDL.InnerText = selectedSportsNumber + " elementów";

        }
    

    }
    //metoda wykonująca inserta do user_sport
    protected void ExecuteCommandInsert(string id,string userid)
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

    protected void ExecuteCommandDelete(string id, string userid)
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

    protected void ProcessUpload(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
    {
        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "size", "top.$get(\"" + uploadResult.ClientID + "\").innerHTML = 'Uploaded size: " + AsyncFileUpload1.FileBytes.Length.ToString() + "';", true);
        string fileName = Server.MapPath("./") + "photos\\" + Session["username"] + "image.jpg";
        AsyncFileUpload1.FileName.ToString();
        AsyncFileUpload1.SaveAs(fileName);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "image", "top.$get(\"photo\").src = 'photos/" + Session["username"] + "image.jpg" + "';", true);
        //  ScriptManager.RegisterClientScriptBlock(AsyncFileUpload1, AsyncFileUpload1.GetType(), "img",
        //      "top.document.getElementById('photos').src='"+fileName+"';",
        //      true);
    }
    protected string Sub(string str)
    {
        return (str.Length > 0) ? str.Substring(0, 10) : "";

    }

    protected void DetailsView1_PageIndexChanging(object sender, System.Web.UI.WebControls.DetailsViewPageEventArgs e)
    {

    }

    protected void CheckWygladDropDownList()
    {
        string userid = Session["userid"].ToString();
        SqlConnection con = new SqlConnection(ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT budowa_ciala_id FROM Wyglad WHERE userid = @userid", con);
        cmd.Parameters.AddWithValue("@userid", userid);
        con.Open();
        try
        {
            DDLWyglad = FillWygladDropDownList();

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.FieldCount != 0)
            {
                while(reader.Read())
                    DDLWyglad.SelectedValue = reader.GetInt32(0).ToString();
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

    }

    private string OkreslPlec()
    {

        string userid = Session["userid"].ToString();
        string plec = "Null";
        SqlConnection con = new SqlConnection(ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT plec FROM user_profile WHERE userid = @userid", con);
        cmd.Parameters.AddWithValue("@userid", userid);
        con.Open();
        try
        {
            
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
                plec = reader.GetString(0).ToString();
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

    protected RadioButtonList FillWygladDropDownList()
    {

        SqlConnection con = new SqlConnection(ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT budowa_ciala_id, budowa_ciala_opis FROM Budowa", con);
        try
        {
            SqlDataReader reader = cmd.ExecuteReader();
            DDLWyglad.DataSource = reader;
            DDLWyglad.DataTextField = "budowa_ciala_opis";
            DDLWyglad.DataValueField = "budowa_ciala_id";
            DDLWyglad.DataBind();
        }
        catch (Exception ex)
        {
            HttpContext.Current.Trace.Write(ex.Message);

        }
        finally
        {
            con.Close();

        }
        return DDLWyglad;
    }

    protected void FillWzrost()
    {   
        string userid=Session["userid"].ToString();
        double wzrost = 0.0;
        SqlConnection con = new SqlConnection(ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT wzrost FROM Wyglad where userid=@userid", con);
        cmd.Parameters.AddWithValue("@userid",userid);

        try
        {
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
                wzrost = reader.GetInt32(0);
            reader.Close();

        }
        catch(Exception ex)
        {
            HttpContext.Current.Trace.Write(ex.Message);
        }
        finally
        {
            con.Close();
        }
        if(wzrost!=0.0)
            TBWzrost.Text = wzrost.ToString();

    }

    protected void FillWaga()
    {
        string userid = Session["userid"].ToString();
        double waga = 0.0;
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
        if(waga!=0.0)
        TBWaga.Text = waga.ToString();

    }

    protected void FillBMI()
    {
        string userid = Session["userid"].ToString();
        double waga = 0;
        double wzrost = 0;
        SqlConnection con = new SqlConnection(ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT waga FROM Wyglad where userid=@userid", con);
        SqlCommand cmd2 = new SqlCommand("SELECT wzrost FROM Wyglad where userid=@userid", con);
        cmd.Parameters.AddWithValue("@userid", userid);
        cmd2.Parameters.AddWithValue("@userid", userid);
        try
        {
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
                waga = reader.GetInt32(0);
            reader.Close();
            SqlDataReader reader2 = cmd2.ExecuteReader();
            while (reader2.Read())
                wzrost = reader2.GetInt32(0);
            reader2.Close();

        }
        catch (Exception ex)
        {
            HttpContext.Current.Trace.Write(ex.Message);
        }
        finally
        {
            con.Close();
        }

        double bmi = 0;
        if (waga != 0 && wzrost != 0)
        {
            bmi = waga / (Math.Pow(wzrost / 100, 2.0));
            LBmi.Text = bmi.ToString().Substring(0, 5);
        }
        else
            LBmi.Text = "";
    }


    protected void Update_Wyglad(object sender, EventArgs e)
    {
        int waga = 0;
        int wzrost=0;
        if(TBWaga.Text!="")
            waga = Convert.ToInt32(TBWaga.Text);
        if (TBWzrost.Text != "")
            wzrost = Convert.ToInt32(TBWzrost.Text);
        int budowa_ciala_id=0;
        string userid = Session["userid"].ToString();
        
        SqlConnection con = new SqlConnection(ConnectionString);
        SqlCommand cmd;
        con.Open();
        string command = null;
        
        

        //select budowa_ciała_id
        budowa_ciala_id = Convert.ToInt32(DDLWyglad.SelectedValue);
        try
        {
            if (budowa_ciala_id == 0)
            {
                command = "UPDATE Wyglad set wzrost=@wzrost,waga=@waga,budowa_ciala_id=NULL WHERE userid = @userid";
                cmd = new SqlCommand(command, con);
            }
            else
            {
                command = "UPDATE Wyglad set wzrost=@wzrost,waga=@waga,budowa_ciala_id=@budowa_ciala_id WHERE userid = @userid";
                cmd = new SqlCommand(command, con);
                cmd.Parameters.AddWithValue("@budowa_ciala_id", budowa_ciala_id);
            }

            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Parameters.AddWithValue("@wzrost", wzrost);
            cmd.Parameters.AddWithValue("@waga", waga);
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
        FillBMI();

    }

    /*
    protected void ddl_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {

        DropDownList ddl = DetailsView1.FindControl("DropDownList1") as DropDownList;
        string userid = Session["userid"].ToString();
        if (ddl != null && userid != null)
        {
            string plec;
            
            plec = ddl.SelectedValue;
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE user_profile SET plec = @plec WHERE userid = @userid", con);
                cmd.Parameters.AddWithValue("@userid", userid);
                cmd.Parameters.AddWithValue("@plec", plec);
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
    
    protected void CheckBox(object sender, EventArgs e)
    {
    string bigText="";
    ContentPlaceHolder cph = (ContentPlaceHolder)this.Master.FindControl("ContentPlaceHolder1");
    CheckBoxList cbl = cph.FindControl("cblCustomerList") as CheckBoxList;
    foreach (ListItem li in cbl.Items)
        {
        if (li.Text!=null)
        {
            bigText = bigText + li.Text + " ";
        }
        }
    bigText = bigText.Trim();
    
    Label myLabel = cph.FindControl("iloscwiadomosci") as Label;
    myLabel.Text = bigText;
    }
      
    //pobiera z tabeli Sport dane sport_id oraz sport_opis
    protected Dictionary<int,string> DataSource()
    {
        Dictionary<int,string> sporty = new Dictionary<int,string>();
        SqlConnection con = new SqlConnection(ConnectionString);
        con.Open();

        SqlCommand cmd = new SqlCommand("SELECT DISTINCT [sport_id],[sport_opis] FROM [Sport]", con);
          
        try
          {
              using (SqlDataReader reader = cmd.ExecuteReader())
              {
                  while (reader.Read())
                      sporty.Add(reader.GetInt32(0),reader.GetString(1));
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
    }     * 
     * 
    */
}