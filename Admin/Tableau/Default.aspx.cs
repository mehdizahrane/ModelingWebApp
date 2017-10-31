using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using canevasModel;
public partial class Admin_Tableau_Default : System.Web.UI.Page
{
    canevasEntities ce;
    protected void Page_Load(object sender, EventArgs e)
    {
        // Vérifier si une valeur existe dans une session transmis
        if (Session["creer-tableau"] != null)
        {
            switch (Session["action"].ToString())
            {
                case "creer-tableau":

                    break;
            }
        }

        //  Selectionnez tous les tableaux, 
        ce = new canevasEntities();
        List<tableau> tabs = ce.tableaux.ToList();
        
        if (tabs.Count > 0)
        {
            var y = tabs.Select(x => new
            {
                intitule = x.nom_tab,
                desc = x.description,
                details_col = "~/Admin/tableau/details-colonnes.aspx?z=" + x.Id,
                details_ligne = "~/Admin/tableau/details-lignes.aspx?z=" + x.Id,
            });
            tabs_grid.DataSource = y;
            tabs_grid.DataBind();
            tabs_grid.Visible = true;
        }
        else
        {
            tabs_grid.Visible = false;
            msg.Text = "Aucun tableau à afficher.";
            msg.CssClass = "alert alert-info";
        }
    }
}