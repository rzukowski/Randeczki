using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;

public partial class szukajprzyjaciol : System.Web.UI.Page
{
    public static string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["FriendsConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BuildWojewodztwaCheckBox();
        }
    }

    protected void AddWojewodztwoParameter(object sender, EventArgs e)
    {

        List<string> wojewodztwa = new List<string>();
        CheckBoxList checkedListBox1 = (CheckBoxList)pnlWojewodztwa.FindControl("cblWojewodztwa");

        foreach (ListItem li in checkedListBox1.Items)
        {
            if (li.Selected)
            {
                if (li.Text == "Cała Polska")
                {
                    wojewodztwa = GetAllWojewodztwa();
                    break;

                }
                else
                {
                    wojewodztwa.Add(li.Value);

                }

            }
            else if(checkedListBox1.Items.Count==0)
            { 
                wojewodztwa = GetAllWojewodztwa(); 
            }

        }

        SqlDataSource1.SelectParameters["wojewodztwo_id"].DefaultValue= string.Join(",", wojewodztwa);
    }

    private List<string> GetAllWojewodztwa()
    {
        SqlConnection con = new SqlConnection(ConnectionString);
        List<string> wojewodztwa = new List<string>();

        con.Open();

        SqlCommand cmd = new SqlCommand("SELECT wojewodztwo_id FROM Wojewodztwa WHERE wojewodztwo_id <> '17' AND wojewodztwo_id IS NOT NULL", con);
        try
        {
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                    wojewodztwa.Add(reader.GetInt32(0).ToString());
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
        return wojewodztwa;
    }

    protected void BuildWojewodztwaCheckBox()
    {

        CheckBoxList checkedListBox1 = (CheckBoxList)pnlWojewodztwa.FindControl("cblWojewodztwa");
        SqlConnection con = new SqlConnection(ConnectionString);
        con.Open();

        SqlCommand cmd = new SqlCommand("SELECT wojewodztwo_id, wojewodztwo FROM Wojewodztwa WHERE wojewodztwo_id IS NOT NULL ORDER BY wojewodztwo_id DESC", con);
        SqlDataReader reader = cmd.ExecuteReader();

        checkedListBox1.DataSource = reader;
        checkedListBox1.DataTextField = "wojewodztwo";
        checkedListBox1.DataValueField = "wojewodztwo_id";
        checkedListBox1.DataBind();
        con.Close();

    }

}