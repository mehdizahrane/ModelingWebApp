using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using canevasModel;
public partial class Admin_User_Changer_Pass : System.Web.UI.Page
{
    canevasEntities ce;
    protected void Page_Load(object sender, EventArgs e)
    {
        ce = new canevasEntities();
        try
        {
            int Id = Convert.ToInt32(Request.QueryString["x"]);
            if (ce.users.Any(x => x.Id == Id))
            {
                var x = ce.users.FirstOrDefault(y => y.Id == Id);
                nomPrenom_lbl.Text = x.nom + " " + x.prenom;
            }
        }
        catch
        {
            Response.Redirect("~/Admin/User/Default.aspx");
        }
    }
    protected void btnValidate_Click(object sender, EventArgs e)
    {
        try
        {
            int Id = Convert.ToInt32(Request.QueryString["x"]);
            var x = ce.users.FirstOrDefault(y => y.Id == Id);
            x.mdp = firstMdp.Text;
            ce.SaveChanges();
            msg.Text = "Le mot de passe a été modifier avec succées.";
            msg.CssClass = "alert alert-success";
            
        }
        catch(Exception ex)
        {
            msg.Text = ex.Message;
            msg.CssClass = "alert alert-danger";
        }
    }
}