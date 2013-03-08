using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
public partial class edytujprofil : System.Web.UI.Page
{
    public static string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["FriendsConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
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
}