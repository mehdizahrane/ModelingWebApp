using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using canevasModel;
public partial class Operateur_Remplir : System.Web.UI.Page
{
    canevasEntities ce;
    public tableau table;
    public string ActionSend;
    protected void Page_Load(object sender, EventArgs e)
    {
        ce = new canevasEntities();
        try
        {

            // Get the session from the user
            var user = (user)Session["operateur"];
            // Avoir les GET depuis le lien
           int idTab = Convert.ToInt32(Request.QueryString["tab"].ToString());
           string actionVar = Request.QueryString["action"].ToString();
           ActionSend = actionVar;
            // Avoir le tableau depuis la base
           table = ce.tableaux.FirstOrDefault(x => x.Id == idTab);
                
           switch (actionVar)
           {
               case "remplir" :
                    // Check if this tab is already filled with data
                   var tab = ce.tableaux.FirstOrDefault(x => x.Id == idTab);
                   if (tab.lignes.First().cellules.Where(x => x.id_user == user.Id).ToList().Count > 0) 
                   {
                       Response.Redirect("~/operateur/Remplis/Default.aspx");
                   }
                   lblTitle.Text = "Remplir le tableau : " + table.nom_tab;
                   action.Value = "remplir";
                   break;
               case "modifier" :
                   lblTitle.Text = "Modifer les valeurs du tableau : " + table.nom_tab;
                   action.Value = "modifier";
                   break;
           }

        }
        catch (Exception ex)
        {
            msg.Text = ex.Message;
            msg.CssClass = "alert alert-danger";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       // msg.Text = table.colonnes.Count+"";
        // Select the appropriate user in the session value
       // msg.Text = Request.Form["c" + 18 + "_l" + 14].ToString();
            var user = (user)Session["operateur"];
             int idTab = Convert.ToInt32(Request.QueryString["tab"]);
             switch (action.Value)
                  {
                      case "remplir":
                          foreach (colonne c in table.colonnes)
                          {
                              foreach (ligne l in table.lignes)
                              {
                                  cellule cell = new cellule();
                                  cell.id_colonne = c.Id;
                                  cell.id_ligne = l.Id;
                                  cell.valeur = Request.Form["c" + c.Id + "_l" + l.Id].ToString();
                                  cell.id_user = user.Id;
                                  cell.created_at = DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString();

                                  ce.AddTocellules(cell);
                              }
                          }
                          ce.SaveChanges();
                          break;
                      case "modifier":
                          var tab = ce.tableaux.FirstOrDefault(x => x.Id == idTab);
                          foreach (var c in tab.colonnes)
                          {
                              foreach (var l in tab.lignes)
                              {
                                  var cell = ce.cellules.FirstOrDefault(x => x.id_ligne == l.Id && x.id_colonne == c.Id);
                                  cell.valeur = Request.Form["c" + c.Id + "_l" + l.Id].ToString();
                                  cell.updated_at = DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString();
                                  ce.SaveChanges();
                              }
                          }
                          break;
                  }
                  Response.Redirect("~/Operateur/Remplis/Default.aspx");
              
    }
}