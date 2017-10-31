using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using canevasModel;
using System.Data;
public partial class Dri_Default : System.Web.UI.Page
{
    canevasEntities ce;
    protected void Page_Load(object sender, EventArgs e)
    {
        ce = new canevasEntities();
        if (!IsPostBack)
        {

            var y_tab = ce.tableaux.Select(x => new
            {
                id = x.Id,
                intitule = x.nom_tab
            });
            tab_dropDow.DataSource = y_tab;
            tab_dropDow.DataBind();

            var y_direction = ce.unit_struct.Where(z => z.unit_struct2 != null).Select(x => new
            {
                id = x.Id,
                intitule = x.intitule
            });
            directionCheck.DataSource = y_direction;
            directionCheck.DataBind();
        }
    }
    protected void btn_Validate_Click(object sender, EventArgs e)
    {
        int countSelected = -1;
        foreach (ListItem item in directionCheck.Items)
        {
            if (item.Selected)
            {
                countSelected = countSelected + 1;
            }
        }

            int idTab = Convert.ToInt32(tab_dropDow.SelectedValue);
            var tab = ce.tableaux.FirstOrDefault(x => x.Id == idTab);

        if (countSelected != -1)
        {
            
            if (countSelected > 0)
            {
               //
            }
            else
            {
                int direction = Convert.ToInt32(directionCheck.SelectedValue);
                // Check if tab is filled or not by the selected direction
                if (tab.lignes.First().cellules.Any(x => x.user.unit_struct == direction ))
                {
                    //
                    DataTable dt = new DataTable();
                    dt.Columns.Add(new DataColumn("-", typeof(string)));
                    foreach (var col in tab.colonnes)
                    {
                        dt.Columns.Add(new DataColumn(col.intitule, typeof(string)));
                    }
                    foreach (var ligne in tab.lignes)
                    {
                        DataRow dr = dt.NewRow();
                        dr["-"] = ligne.intitule;
                        foreach (var col in tab.colonnes)
                        {
                            dr[col.intitule] = ce.cellules.FirstOrDefault(x => x.id_colonne == col.Id && x.id_ligne == ligne.Id && x.user.unit_struct == direction).valeur;
                        }
                        dt.Rows.Add(dr);
                    }
                    tabGrid.DataSource = dt;
                    tabGrid.DataBind();
                    tabGrid.Visible = true;
                    msg.Text = "";
                    msg.CssClass = "";
                }
                else
                {
                    tabGrid.Visible = false;
                    msg.Text = "Aucun résultat, vérifier si ce tableau est remplis par la direction choisis.";
                    msg.CssClass = "alert alert-warning";
                }
                
            }
        }
        
    }
}