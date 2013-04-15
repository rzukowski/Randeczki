﻿using System;
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
                FillWojewodztwo();
                FillPlec();
                FillDataUrodzin();
                BuildCheckBox();
                CheckWygladDropDownList();
                FillWzrost();
                FillWaga();
                FillBMI();
                BindOpis();
            }
            catch (Exception ex)
            {
                HttpContext.Current.Trace.Write(ex.Message);
            }

        }
       
    }

    protected void BuildCheckBox()
    {
       

        //dodaje do checkboxlist elementy
        // Dictionary<int, string> sportyCat = DataSource();
        CheckBoxList checkedListBox1 = (CheckBoxList)pnlCustomers.FindControl("cblCustomerList");
        Dictionary<int,string> sporty = Usr.SelectSportIdSportOpis();
        checkedListBox1.DataSource = sporty;
        checkedListBox1.DataTextField = "Value";
        checkedListBox1.DataValueField = "key";
        checkedListBox1.DataBind();

        //        foreach (KeyValuePair<int, string> pair in sportyCat)
        //         {
        //            
        //         checkedListBox1.Items.Add(new ListItem(pair.Key.ToString(),pair.Value));
        //        }
        //idz do metody zaznaczającej dane z bazy
        SelectCheckBox();

    }


    //metoda do zaznaczenia elementów z bazy danych usera w liscie rozwijanej (sport)
    protected void SelectCheckBox()
    {
        List<string> sporty = new List<string>();
        string userid = Session["userid"].ToString();

        sporty = Usr.GetSporty(userid);

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
        System.Threading.Thread.Sleep(2000);
        string userid = Session["userid"].ToString();
        int selectedSportsNumber = 0;
        List<string> sporty = Usr.GetSporty(userid);
        CheckBoxList checkedListBox1 = (CheckBoxList)pnlCustomers.FindControl("cblCustomerList");
        foreach (ListItem li in checkedListBox1.Items)
        {
            if (li.Selected && !sporty.Contains(li.Text) )
            {
                try
                {
                    Usr.ExecuteCommandInsert(li.Value, userid);
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
                    Usr.ExecuteCommandDelete(li.Value, userid);

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
        try
        {
            DDLWyglad = FillWygladDropDownList();


            List<int> budowa = Usr.SelectBudowaCiala(userid);

            foreach (int budo in budowa)
                DDLWyglad.SelectedValue = budo.ToString();


            
        }
        catch (Exception ex)
        {
            HttpContext.Current.Trace.Write(ex.Message);

        }
        finally
        {

           
        }

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
        int wzrost = 0;
        wzrost = Usr.GetWzrost(userid);
        if(wzrost!=0)
            TBWzrost.Text = wzrost.ToString();

    }

    protected void FillWaga()
    {
        string userid = Session["userid"].ToString();
        int waga = 0;
        waga = Usr.GetWaga(userid);
        if(waga!=0)
        TBWaga.Text = waga.ToString();

    }

    protected void FillBMI()
    {
        string userid = Session["userid"].ToString();
        double waga = 0;
        double wzrost = 0;
        waga = Usr.GetWaga(userid);
        wzrost = Usr.GetWzrost(userid);

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

        System.Threading.Thread.Sleep(2000);
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

    protected void FillDataUrodzin()
    {

        string userid = Session["userid"].ToString();
        string birthdate = null;
        birthdate = Usr.GetUserBirthday(userid);

        if (birthdate != null)
        {
            DataUrodzin.Text = birthdate.ToString();

        }

    }

    protected void FillPlec()
    {

        string userid = Session["userid"].ToString();
        int plec = 0;
        plec = Usr.GetPlecId(userid);

        Plec.Items.Add(new ListItem("Mężczyzna","1"));
        Plec.Items.Add(new ListItem("Kobieta", "2"));
        Plec.DataBind();
        if(plec!=0)
        Plec.SelectedValue = plec.ToString();

    }

    protected void FillWojewodztwo()
    {
        string userid = Session["userid"].ToString();
        int wojewodztwo = 17;

        wojewodztwo = Usr.GetUserWojewodztwo(userid);
        
        BindWojewodztwa();
 
        if (wojewodztwo != 17)
            Wojewodztwa.SelectedValue = wojewodztwo.ToString();

    }

    protected void BindWojewodztwa()
    {
        SqlConnection con = new SqlConnection(ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT DISTINCT [wojewodztwo_id],[wojewodztwo] FROM [Wojewodztwa] ORDER BY [wojewodztwo_id] DESC", con);
        
        con.Open();
        try
        {
            SqlDataReader reader = cmd.ExecuteReader();
            Wojewodztwa.DataSource = reader;
            Wojewodztwa.DataTextField = "wojewodztwo";
            Wojewodztwa.DataValueField = "wojewodztwo_id";
            Wojewodztwa.DataBind();
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


    protected void BindOpis()
    {
        string userid = Session["userid"].ToString();
        string opis = null;
        opis = Usr.GetOpis(userid);

        if(opis!=null)
            Opis.Text=opis;
    }

    protected void UpdateDane(object sender, EventArgs e)
    {

        System.Threading.Thread.Sleep(2000);
        string opis = Opis.Text;
        string userid = Session["userid"].ToString();
        string dataUrodzin = DataUrodzin.Text;
        int plec = Convert.ToInt32(Plec.SelectedItem.Value);
        int wojewodztwo = Convert.ToInt32(Wojewodztwa.SelectedItem.Value);

        Usr.UpdateDane(opis, userid, dataUrodzin, plec, wojewodztwo);


    }

}