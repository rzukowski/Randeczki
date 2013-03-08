using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pokazprofil : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public int CalculateAge(string birthDate)
    {
        DateTime dt = Convert.ToDateTime(birthDate);  
        DateTime now=new DateTime();
        int age = now.Year - dt.Year;
        if (now.Month < dt.Month || (now.Month == dt.Month && now.Day < dt.Day)) age--;
        return age;
    }
    protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {

    }
}