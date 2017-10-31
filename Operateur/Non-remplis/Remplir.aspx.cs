using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using canevasModel;
public partial class Operateur_Non_remplis_Remplir : System.Web.UI.Page
{
    canevasEntities ce;
    public tableau table;
    protected void Page_Load(object sender, EventArgs e)
    {
        ce = new canevasEntities();

       table = ce.tableaux.FirstOrDefault();
       nom_tab.Text = table.nom_tab;
        //DataTable dt = new DataTable();
        ////dt.Columns.Add(new DataColumn("-", typeof(string)));
        //foreach (colonne c in tab.colonnes)
        //{
        //    dt.Columns.Add(new DataColumn(c.intitule, typeof(TextBox)));
        //    DataRow dr = dt.NewRow();
        //    dr[c.intitule] = new TextBox();
        //    dt.Rows.Add(dr);
        //}
        //table_grid.DataSource = dt;
        //table_grid.DataBind();
    }
    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        nom_tab.Text = Request.Form["c5_l4"].ToString();

    }
}