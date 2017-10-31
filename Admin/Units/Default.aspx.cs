using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using canevasModel;
public partial class Admin_Units_Default : System.Web.UI.Page
{
    canevasEntities ce;
    protected void Page_Load(object sender, EventArgs e)
    {

        ce = new canevasEntities();
        if (!IsPostBack)
        {
            try
            {

                // Remplir la liste des unitès mère 

                var y = ce.unit_struct.ToList().Select(x => new
                {
                    id = x.Id,
                    intitule = x.intitule
                });
                unitMereSelect.DataSource = y;
                unitMereSelect.DataBind();

                // Partie formulaire

                if (!String.IsNullOrWhiteSpace(Request.QueryString["action"]) && Request.QueryString["action"] == "modify")
                {
                    if (!String.IsNullOrWhiteSpace(Request.QueryString["z"]))
                    {
                        string action_var = Request.QueryString["action"].ToString();
                        int Id = Convert.ToInt32(Request.QueryString["z"].ToString());
                        action.Value = "modify";
                        var unitToModify = ce.unit_struct.FirstOrDefault(x => x.Id == Id);
                        intitule_txt.Text = unitToModify.intitule;
                        unitMereSelect.SelectedValue = unitToModify.unit_struct2 != null ? unitToModify.unite_mere+"" : 0+"";
                        lbl_action.Text = "Modifier : " + unitToModify.intitule;
                    }
                }
                else
                {
                    action.Value = "add";
                    lbl_action.Text = "Ajouter une unité structurelle :";
                }

                // Partie des grid
                if (ce.unit_struct.ToList().Count > 0)
                {
                    List<unit_struct> l_units = ce.unit_struct.ToList();
                    var z = l_units.Select(x => new
                    {
                        id = x.Id,
                        intitule = x.intitule,
                        unite_mere = x.unite_mere != null ? x.unit_struct2.intitule : "___",
                        modify = "~/Admin/Units/Default.aspx?action=modify&z="+x.Id
                    });
                    unitsGrid.DataSource = z;
                    unitsGrid.DataBind();
                    unitsGrid.Visible = true;
                    int k = ce.unit_struct.ToList().Count;
                    results_lbl.Text = k == 1 ? k + " résultat." : k + " résultats.";
                }
                else
                {
                    unitsGrid.Visible = false;
                    results_lbl.Text = "Aucune unité structurelle à afficher.";
                }
            }
            catch(Exception ex)
            {
                results_lbl.Text = ex.Message;
            }
        }
    }
    protected void btnValidate_Click(object sender, EventArgs e)
    {
        string action_var = action.Value;
        switch (action_var)
        {
            case "add":
                var unit = new unit_struct()
                {
                    intitule = intitule_txt.Text,
                    unite_mere = Convert.ToInt32(unitMereSelect.SelectedValue),
                    created_at = DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString()
                };
                ce.AddTounit_struct(unit);
                ce.SaveChanges();
                break;
            case "modify":
                int idUnit = Convert.ToInt32(Request.QueryString["z"]);
                var unitModify = ce.unit_struct.FirstOrDefault(x => x.Id == idUnit);
                unitModify.intitule = intitule_txt.Text;
                unitModify.unite_mere = Convert.ToInt32(unitMereSelect.SelectedValue);
                unitModify.updated_at = DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString();
                ce.SaveChanges();
                break;

        }
        
        Response.Redirect("~/Admin/Units/Default.aspx");
    }
}