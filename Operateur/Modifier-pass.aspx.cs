using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using canevasModel;
public partial class Operateur_Modifier_passaspx : System.Web.UI.Page
{
    canevasEntities ce;
    protected void Page_Load(object sender, EventArgs e)
    {
        ce = new canevasEntities();

    }
    protected void validatePass_Click(object sender, EventArgs e)
    {
        try
        {
            var user = (user)Session["operateur"];
            if (user.mdp.Equals(ancienPass.Text))
            {
                var nextUser = ce.users.FirstOrDefault(x => x.Id == user.Id);
                nextUser.mdp = newPass.Text;
                ce.SaveChanges();
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                exMsg.Text = "L'ancien mot de passe entré n'est pas valide.";
                exMsg.CssClass = "alert alert-danger";
            }
        }
        catch (Exception ex)
        {
            exMsg.Text = ex.Message;
            exMsg.CssClass = "alert alert-danger";
        }
    }
}