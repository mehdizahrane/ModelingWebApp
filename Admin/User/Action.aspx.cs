using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using canevasModel;
public partial class Admin_User_Add : System.Web.UI.Page
{
    canevasEntities ce;
    protected void Page_Load(object sender, EventArgs e)
    {

        ce = new canevasEntities();
        if (!IsPostBack)
        {
            try
            {

                // Select dans le formulaire
                var z = ce.unit_struct.Select(x => new
                {
                    id = x.Id,
                    intitule = x.intitule
                });
                unitSelect.DataSource = z;
                unitSelect.DataBind();


                // Savoir s'il s'agit d'un ajout ou modification

                if (!String.IsNullOrWhiteSpace(Request.QueryString["action"]))
                {
                    if (!String.IsNullOrWhiteSpace(Request.QueryString["z"]))
                    {
                        int id = Convert.ToInt32(Request.QueryString["z"]);
                        var user = ce.users.FirstOrDefault(x => x.Id == id);
                        action.Value = "modify";
                        title_lbl.Text = "Modifier l'utilisateur : " + user.nom + " " + user.prenom;
                        nom_txt.Text = user.nom;
                        prenom_txt.Text = user.prenom;
                        login_txt.Text = user.login;
                        typeSelect.SelectedValue = user.type + "";
                        unitSelect.SelectedValue = user.unit_struct + "";
                        mdpWell.Visible = false;
                    }
                }
                else
                {
                    action.Value = "add";
                    title_lbl.Text = "Ajouter un utilisateur : ";
                    mdpWell.Visible = true;
                }

            }
            catch(Exception ex)
            {
                msg_lbl.Text = ex.Message;
            }
        }
    }
    protected void btnValidate_Click(object sender, EventArgs e)
    {
        string action_var = action.Value;
        switch (action_var)
        {
            case "add":
                var user = new user()
                {
                    nom = nom_txt.Text,
                    prenom = prenom_txt.Text,
                    login = login_txt.Text,
                    type = typeSelect.SelectedValue,
                    unit_struct = Convert.ToInt32(unitSelect.SelectedValue),
                    mdp = mdp_txt.Text,
                    created_at = DateTime.Now.ToShortTimeString() + " " + DateTime.Now.ToShortTimeString()

                };
                ce.AddTousers(user);
                ce.SaveChanges();
                break;
            case "modify":
                int id = Convert.ToInt32(Request.QueryString["z"]);
                var userModify = ce.users.FirstOrDefault(x => x.Id == id);
                userModify.nom = nom_txt.Text;
                userModify.prenom = prenom_txt.Text;
                userModify.login = login_txt.Text;
                userModify.type = typeSelect.SelectedValue;
                userModify.unit_struct = Convert.ToInt32(unitSelect.SelectedValue);
                userModify.updated_at = DateTime.Now.ToShortTimeString() + " " + DateTime.Now.ToShortTimeString();
                ce.SaveChanges();
                break;
        }
        Response.Redirect("~/Admin/User/Default.aspx");
    }
    
}