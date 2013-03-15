using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected string UploadFolderPath = "~/photos/";
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

    }
    
}
