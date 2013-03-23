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
            BuildCheckBox();
        }
        catch (Exception ex)
        {

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

        //idz do metody zaznaczającej dane z bazy
        SelectCheckBox();

    }

    //metoda do zaznaczenia elementów z bazy danych usera w liscie rozwijanej (sport)
    protected void SelectCheckBox()
    {
        List<string> sporty = new List<string>();
        SqlConnection con = new SqlConnection(ConnectionString);
        string userid = Session["userid"].ToString();
        
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
    protected void Update_User_Sport_Table()
    {




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