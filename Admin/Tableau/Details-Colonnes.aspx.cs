using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using canevasModel;
public partial class Admin_Tableau_Details : System.Web.UI.Page
{
    canevasEntities ce;
    protected void Page_Load(object sender, EventArgs e)
    {
        ce = new canevasEntities();
        if (!IsPostBack)
        {
            try
            {
                int id_tab = Convert.ToInt32(Request.QueryString["z"]);
                tableau tab = ce.tableaux.FirstOrDefault(x => x.Id == id_tab);
                nom_tab.Text = tab.nom_tab;

                var y_col = tab.colonnes.Select(x => new
                {
                    idCol = x.Id,
                    intitule = x.intitule,
                    type_col = char.ToUpper(x.type_colonne[0]) + x.type_colonne.Substring(1),
                    modifier = "~/Admin/Tableau/Details-Colonnes.aspx?z="+id_tab+"&col="+x.Id+"&action=modify"
                });

                switch (tab.colonnes.Count)
                {
                    case 0:
                        colonnes_grid.Visible = false;
                        lbl_colonne.Text = "Ce tableau ne contient aucune colonne.";
                        break;
                    case 1:
                        colonnes_grid.Visible = true;
                        break;
                    default:
                        lbl_colonne.Text = tab.colonnes.Count + " colonnes.";
                        break;
                }

                colonnes_grid.DataSource = y_col;
                colonnes_grid.DataBind();
                // End of colounms part
                if (!String.IsNullOrWhiteSpace(Request.QueryString["col"]))
                {
                    if (!String.IsNullOrWhiteSpace(Request.QueryString["action"]) && Request.QueryString["action"].Equals("modify"))
                    {
                        int Id = Convert.ToInt32(Request.QueryString["col"]);
                        if (ce.colonnes.Any(x => x.id_tab == id_tab && x.Id == Id))
                        {
                            var col = ce.colonnes.FirstOrDefault(x => x.id_tab == id_tab && x.Id == Id);
                            txt_colonneNom.Text = col.intitule;
                            type_col.SelectedValue = col.type_colonne;
                            action_lbl.InnerText = "Modifier la colonne : " + col.intitule;
                            action.Value = "modify";
                        }
                        else
                        {
                            action.Value = "add";
                            Response.Redirect("~/Admin/Tableau/Details-Lignes.aspx?z=" + id_tab);
                        }

                    }
                }

            }
            catch
            {
                Response.Redirect("~/Admin/Tableau/Default.aspx");
            }
        }
    }
    // Cette methode effectue l'ajout et la modification de la table 'colonne' meme si que la fonction est nommé autrement
    protected void addColonne_Click(object sender, EventArgs e)
    {
        int id_tab = Convert.ToInt32(Request.QueryString["z"]);
        string intitule = txt_colonneNom.Text;
        
            if (action.Value != "modify")
            {
                if (ce.colonnes.Any(x => x.intitule.Equals(intitule) && x.id_tab == id_tab))
                {
                    lbl_dev.Text = "Cette colonne existe dèjà.";
                    lbl_dev.CssClass = "error-msg";
                }
                else
                {
                    colonne col = new colonne()
                    {
                        intitule = intitule,
                        id_tab = id_tab,
                        type_colonne = type_col.SelectedValue.ToString(),
                        created_at = DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString()
                    };
                    ce.AddTocolonnes(col);
                    ce.SaveChanges();
                }
            }
            else
            {
                int idCol = Convert.ToInt32(Request.QueryString["col"]);
                colonne col = ce.colonnes.FirstOrDefault(x => x.Id == idCol && x.id_tab == id_tab);
                col.intitule = txt_colonneNom.Text;
                col.type_colonne = type_col.SelectedValue;
                ce.SaveChanges();
            }
            
            Response.Redirect("~/Admin/Tableau/Details-Colonnes.aspx?z=" + id_tab);
    }
    protected void colonnes_grid_SelectedIndexChanged(object sender, EventArgs e)
    {
        lbl_dev.Text = colonnes_grid.SelectedValue.ToString();
    }
}