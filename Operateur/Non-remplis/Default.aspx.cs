using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using canevasModel;
public partial class Operateur_Non_remplis_Default : System.Web.UI.Page
{
    canevasEntities ce;

 // # Objectif de cette page c'est de séléctionner les tableaux et après afficher 
//  # ceux qui n'ont étais pas encore remplis par l'utilisateur séléctionnez

    protected void Page_Load(object sender, EventArgs e) 
    {
        ce = new canevasEntities();
       
        // Select the authentified user using session

            var user = (user)Session["operateur"];

        // Avoir la liste des tableaux que l'utilisateur a le droit de remplir

            var droit = ce.droit_remplissage.Where(x => x.Id_unit == user.unit_struct && x.fermer == 1).ToList();

            if (droit.Count > 0)
            {
                var tousTab = ce.tableaux.ToList(); // Tous les tableaux
                var cellules = ce.cellules.Where(x => x.id_user == user.Id).ToList(); // Les Cellules remplis par l'utilisteur authentifié
                // Prendre les tableaux remplis
                List<tableau> tabRemplis = new List<tableau>();
                foreach (var x in cellules)
                {
                    tabRemplis.Add(x.ligne.tableau);
                }
                tabRemplis = tabRemplis.Distinct().ToList();

                var tabs = tousTab.Except(tabRemplis).ToList();

                if (tabs.Count > 0)
                {
                    var z = tabs.Select(x => new
                    {
                        tab = x.nom_tab,
                        remplir = "~/Operateur/Remplir.aspx?action=remplir&tab=" + x.Id
                    });
                    tableauGrid.Visible = true;
                    tableauGrid.DataSource = z;
                    tableauGrid.DataBind();
                    byte k = (byte)tabs.Count;
                    msg_lbl.Text = k == 1 ? k + " résultat." : k + " résultats.";
                }
                else
                {
                    tableauGrid.Visible = false;
                    msg_lbl.Text = "Aucun tableau à remplir pour l'instant.";
                    msg_lbl.CssClass = "alert alert-info";
                }
            }
            else
            {
                msg_lbl.Text = "Aucun droit n'est attribué à vous pour effectuer le remplissage.";
                msg_lbl.CssClass = "alert alert-info";
            }

         
    }
}