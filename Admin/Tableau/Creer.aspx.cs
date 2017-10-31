using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using canevasModel;
public partial class Admin_Tableau_Creer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_valider_nouv_tab_Click(object sender, EventArgs e)
    {
        canevasEntities ce = new canevasEntities();
        try
        {
            tableau tab = new tableau();
            tab.nom_tab = intitule_input.Text;
            tab.etat = 1; // 1 signifie que l'état est ouvert , 0 cloturé.
            if (description_input.Text != "")
            {
                tab.description = description_input.Text;
            }
            tab.created_at = DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString();
            tab.updated_at = DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString();
            ce.AddTotableaux(tab);
            ce.SaveChanges();

            //var droitRemplissage = new List<droit_remplissage>();
             // fermer == 1 ? "Ouvert" | fermer == 0 "fermer" 
            foreach(unit_struct unit in ce.unit_struct.ToList())
            {
                ce.AddTodroit_remplissage(new droit_remplissage() { Id_tab = tab.Id, Id_unit = unit.Id, fermer = 1 });

            }
            ce.SaveChanges();
            Session.Add("action", "creer-tableau");
            Response.Redirect("~/Admin/Tableau/Default.aspx");
        }
        catch 
        {
            error_msg.Text = "Un tableau existé dèjà portant le même intitulé.";
        }
    }
}