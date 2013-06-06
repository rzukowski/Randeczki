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
using System.IO;
using System.Security.Cryptography;
using System.Web.Security;

public partial class zmienhaslo : BaseClass
{

    

    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void TryToChangePass(object sender, EventArgs e)
    {
       string username = Session["username"].ToString();

       if (UserPassNew.Text == UserPassRepeat.Text)
       {
           if (Membership.ValidateUser(username, UserPass.Text))
           {
               if (Usr.SaveNewPassToDb(UserPassNew.Text, username))
                   Info.Text = "Hasło zmienione";
               else
               {
                   Info.Text = "Nie udało się zmienić hasła";

               }
           }
           else
           {
               Info.Text = "Podałeś złe hasło";

           }

       }

       else
       {
           Info.Text = "Nowe hasło i powtórzenie hasła nie pasują do siebie";

       }

    }
}