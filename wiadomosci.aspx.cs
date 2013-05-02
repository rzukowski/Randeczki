using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Base;
public partial class wiadomosci : BaseClass
{
    public static string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["FriendsConnectionString"].ConnectionString;

    public static int mssgPerPage = 10;
    protected void Page_Load(object sender, EventArgs e)
    {
       

        String userid = Session["userid"].ToString();
        Usr.DecrementNotification(userid);
        int i = 1;
        if(!IsPostBack)
            FillSkrzynka(null, new CommandEventArgs("name", i));
        if (IsPostBack)
            GetNumberOfViewed();
    }


    protected void FillSkrzynka(object sender, CommandEventArgs e)
    {

        string userid = Session["userid"].ToString();

        DataClassesDataContext db = new DataClassesDataContext(ConnectionString);



        int numberToSkip = (int.Parse(e.CommandArgument.ToString()) - 1) * mssgPerPage;

        var odp = (from user in db.aspnet_Users
                   join x in db.messages on user.UserId equals x.sendid
                   where x.receivid.ToString() == userid.ToString() orderby x.sentdate descending
                   select new { userid = x.receivid, msgid = x.msgid, sentdate = x.sentdate, mssg = x.mssg, username = user.UserName }).Skip(numberToSkip).Take(mssgPerPage);
        CurrPage.Value = e.CommandArgument.ToString();
        GetNumberOfViewed();
        DataList1.DataSource = odp.ToList();
        DataList1.DataBind();


    }

    protected void GetNumberOfViewed()
    {
        string userid = Session["userid"].ToString();
        int numberOfVisits = Usr.GetNumberOfReceivedMssg(userid);
        int ii = 0;
        int pagesNumberMax = (int)Math.Ceiling((decimal)numberOfVisits / mssgPerPage);
        int page = int.Parse(CurrPage.Value);
        links.Controls.Clear();
        if (pagesNumberMax > 3)
        {
            for (ii = 0; ii <= 3; ii++)
            {
                string text;
                if ((ii == 0 || ii == 3) && page > 1 && page < pagesNumberMax)
                    text = "...";
                else if (page == 1 && ii == 3)
                {
     
                        text = "...";
                }
                else if (page == pagesNumberMax && ii == 0)
                {
                        text = "...";
                }
                else
                    text = (ii + 1).ToString();
                LinkButton anchor = new LinkButton();
                // anchor.PostBackUrl = "Odwiedzili.aspx?odwiedzili="+(ii+1);
                anchor.Text = text;
                anchor.ID = "link" + (ii + 1);

                anchor.Command += new CommandEventHandler(FillSkrzynka);
                anchor.CommandArgument = (ii + 1).ToString();
                links.Controls.Add(anchor);


            }
        }
        else
        {
            for (ii = 0; ii < pagesNumberMax; ii++)
            {
                LinkButton anchor = new LinkButton();
                // anchor.PostBackUrl = "Odwiedzili.aspx?odwiedzili="+(ii+1);
                anchor.Text = (ii + 1).ToString();
                anchor.ID = "link" + (ii + 1);

                anchor.Command += new CommandEventHandler(FillSkrzynka);
                anchor.CommandArgument = (ii + 1).ToString();
                links.Controls.Add(anchor);


            }


        }
    }

}