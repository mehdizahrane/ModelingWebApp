using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using canevasModel;
public partial class Admin_User_Default : System.Web.UI.Page
{
    canevasEntities ce;
    protected void Page_Load(object sender, EventArgs e)
    {
        ce = new canevasEntities();
        if (ce.users.ToList().Count > 0)
        {
            var users = ce.users.ToList();
            var y = users.Select(x => new
            {
                id = x.Id,
                nom_prenom = x.nom + " " + x.prenom,
                login = x.login,
                type = x.type,
                unit = x.unit_struct != null ? x.unit_struct1.intitule : "____",
                modify = "~/Admin/User/Action.aspx?action=modify&z=" + x.Id,
                change_pass = "~/Admin/User/Changer-Pass-User.aspx?x="+x.Id
            });
            userGrid.Visible = true;
            userGrid.DataSource = y;
            userGrid.DataBind();
            int k = ce.users.ToList().Count;
            result_lbl.Text = k == 1 ? k + " résultat." : k + " résultats.";
        }
        else
        {
            result_lbl.Text = "Aucun utilisateur à afficher.";
            userGrid.Visible = false;
        }
    }
}