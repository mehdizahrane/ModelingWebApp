<%@ Page Title="" Language="C#" MasterPageFile="~/operateur-master.master" AutoEventWireup="true" CodeFile="Remplir.aspx.cs" Inherits="Operateur_Non_remplis_Remplir" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>

    </style>
    <h3>Remplir le tableau : <asp:Label runat="server" ID="nom_tab"></asp:Label></h3>
    <br />
    <asp:GridView runat="server" ID="table_grid" AutoGenerateColumns="true" CssClass="table table-bordered">
    </asp:GridView>
    <%
        if (table.colonnes.Count > 0 && table.lignes.Count > 0)
        {
    %>
        <table class="table table-bordered" style="font-size: 12px;  border: 2px solid black;">
            <!-- Begin of columns to table -->

            <tr class="bg-warning" >
                <th>-</th>
                <%  foreach (canevasModel.colonne c in table.colonnes){ %>
                    <th>    <%=c.intitule %>    </th>
                <% } %>
            </tr>
            <!-- End of columns to table -->
            <% foreach (canevasModel.ligne l in table.lignes) { %>
                <tr>
                    <td><%=l.intitule %></td>
                    <% foreach (canevasModel.colonne c in table.colonnes){ %>
                        <td>
                            <input type="text" name="<%="c"+Convert.ToString(c.Id+"_l"+l.Id) %>"  value="0"/>
                        </td>
                    <% } %>
                </tr>
            <% } %>
        </table>
        <button type="reset" value="Effacer" class="btn btn-warning">Initialiser</button>
    &nbsp;
    <asp:Button ID="Button1" Text="Valider" runat="server" CssClass="btn btn-warning" OnClick="Unnamed1_Click" />
    <%  } else {  %>
    <p>Ce tableau n'est pas encore prêt à remplir.</p>
    <% } %>
</asp:Content>

