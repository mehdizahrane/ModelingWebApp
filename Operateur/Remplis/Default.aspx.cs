using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using canevasModel;
public partial class Operateur_Remplis_Default : System.Web.UI.Page
{
    canevasEntities ce;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ce = new canevasEntities();

            // Select the authentified user using session

            // The app is still on developpement mode, so I will pick the first user just to make an example
            var user = (user)Session["operateur"];

            // Avoir la liste des tableaux que l'utilisateur a remplis

            var cellules = ce.cellules.Where(x => x.id_user == user.Id).ToList();

            var tabRemplis = new List<tableau>();

            foreach (var x in cellules)
            {
                tabRemplis.Add(x.ligne.tableau);
            }

            // Faire distinct pour les tableaux séléctionnez, car il va y avoir un redondance dans la liste des tableaux 
            tabRemplis = tabRemplis.Distinct().ToList();

            if (tabRemplis.Count > 0)
            {
                //var z = tabRemplis.Select(x => new
                //{
                //    tab = x.nom_tab,
                //    modify = "" + x.Id
                //});
                grid_tab.DataSource = tabRemplis.Select(x => new
                {
                    tab = x.nom_tab,
                    modify = "~/operateur/remplir.aspx?action=modifier&tab=" + x.Id
                });
                grid_tab.DataBind();
                int k = tabRemplis.Count;
                msgLbl.Text = k == 1 ? k + " résultat." : k + " résultats.";

                grid_tab.Visible = true;
            }
            else
            {
                grid_tab.Visible = false;
                msgLbl.Text = "Aucun tableau n'est remplis pour l'instant.";
                msgLbl.CssClass = "alert alert-info";
            }
        }
        catch
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}