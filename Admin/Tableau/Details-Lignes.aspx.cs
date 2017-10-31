using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using canevasModel;
public partial class Admin_Tableau_Details_Lignes : System.Web.UI.Page
{
    canevasEntities ce;
    protected void Page_Load(object sender, EventArgs e)
    {
        ce = new canevasEntities();
        if (!IsPostBack)
        {
            try
            {
                int idTab = Convert.ToInt32(Request.QueryString["z"].ToString());
                tableau tab = ce.tableaux.FirstOrDefault(x => x.Id == idTab);
                lbl_nomTab.Text = tab.nom_tab;
                if (tab.lignes.Count > 0)
                {
                    ligneGrid.Visible = true;
                    var y = tab.lignes.Select(x => new
                    {
                        idLigne = x.Id,
                        intitule = x.intitule,
                        modify = "~/Admin/Tableau/Details-Lignes.aspx?z=" + idTab + "&ligne=" + x.Id + "&action=modify",
                        delete = ""
                    });
                    ligneGrid.DataSource = y;
                    ligneGrid.DataBind();
                    lbl_result.Text = tab.lignes.Count == 1 ? tab.lignes.Count + " résultat." : tab.lignes.Count + " résultats.";

                    if (!String.IsNullOrWhiteSpace(Request.QueryString["ligne"]))
                    {
                        if (!String.IsNullOrWhiteSpace(Request.QueryString["action"]) && Request.QueryString["action"].Equals("modify"))
                        {
                            int Id = Convert.ToInt32(Request.QueryString["ligne"]);
                            if (ce.lignes.Any(x => x.id_tab == idTab && x.Id == Id))
                            {
                                var ligne = ce.lignes.FirstOrDefault(x => x.id_tab == idTab && x.Id == Id);
                                txt_intituleLigne.Text = ligne.intitule;
                                action.Value = "modify";
                            }
                            else
                            {
                                action.Value = "add";
                                Response.Redirect("~/Admin/Tableau/Details-Lignes.aspx?z=" + idTab);
                            }

                        }
                    }
                }
                else
                {
                    ligneGrid.Visible = false;
                    lbl_result.Text = "Ce tableau ne contient aucune ligne.";
                }
            }
            catch
            {
                Response.Redirect("~/Admin/Tableau/Default.aspx");
            }
        }
    }
    //Cette méthode effectue l'ajout et la modification de la table "ligne"
    protected void btn_ajouterLigne_Click(object sender, EventArgs e)
    {
        int idTab = Convert.ToInt32(Request.QueryString["z"].ToString());
        string intitule = txt_intituleLigne.Text;
        if (!ce.lignes.Any(x => x.intitule.Equals(intitule) && x.id_tab == idTab))
        {
            if (action.Value != "modify")
            {
                var ligne = new ligne()
                {
                    intitule = intitule,
                    id_tab = idTab,
                    created_at = DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString()
                };
                ce.AddTolignes(ligne);
                ce.SaveChanges();
                Response.Redirect("~/Admin/Tableau/Details-lignes.aspx?z=" + idTab);
            }
            else
            {
                int idLigne = Convert.ToInt32(Request.QueryString["ligne"].ToString());
                ligne ligne = ce.lignes.FirstOrDefault(x => x.id_tab == idTab && x.Id == idLigne);
                ligne.intitule = intitule;
                ce.SaveChanges();
                Response.Redirect("~/Admin/Tableau/Details-lignes.aspx?z=" + idTab);
            }
        }

        else
        {
            lbl_msg.Text = "Cette ligne existe dèjà.";
            lbl_msg.CssClass = "error-msg";
        }
    }
}