using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using canevasModel;
public partial class _Default : System.Web.UI.Page
{
    canevasEntities ce;
    protected void Page_Load(object sender, EventArgs e)
    {
        ce = new canevasEntities();
        if (!IsPostBack)
        {
            Session["admin"] = null;
            Session["operateur"] = null;
            Session["dri"] = null;
        }

    }
    protected void btn_connect_Click(object sender, EventArgs e)
    {
        string l = login_txt.Text;
        string m = mdp_txt.Text;

        if (ce.users.Any(x => x.login.Equals(l) && x.mdp.Equals(m)))
        {
            var user = ce.users.FirstOrDefault(x => x.login.Equals(l) && x.mdp.Equals(m));
            switch (user.type)
            {
                case "admin":
                    Session.Add("admin", user);
                    Response.Redirect("~/Admin/Default.aspx");
                    break;
                case "operateur":
                    Session.Add("operateur", user);
                    Response.Redirect("~/Operateur/Default.aspx");
                    break;
                case "dri":
                    Session.Add("dri", user);
                    Response.Redirect("~/Dri/Default.aspx");
                    break;
            }
        }
        else
        {
            msg.Visible = true;
        }
    }
}