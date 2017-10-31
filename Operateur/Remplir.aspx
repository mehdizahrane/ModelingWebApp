<%@ Page Title="" Language="C#" MasterPageFile="~/operateur-master.master" AutoEventWireup="true" CodeFile="Remplir.aspx.cs" Inherits="Operateur_Remplir" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3><asp:Label runat="server" id="lblTitle"></asp:Label></h3>
    <asp:HiddenField runat="server" ID="action" />
    <br />
    <asp:Label runat="server" ID="msg"></asp:Label>
    <br />
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
                <% if(ActionSend.Equals("remplir")){ %>
                    <tr>
                        <td><%=l.intitule %></td>
                        <% foreach (canevasModel.colonne c in table.colonnes){ %>
                            <td>
                                <% if(c.type_colonne == "entier"){ %>
                                    <input type="number" name="<%="c"+Convert.ToString(c.Id+"_l"+l.Id) %>"  value="0" min="0" step="0.01"/>
                                <% } else{ %>
                                    <input type="text" name="<%="c"+Convert.ToString(c.Id+"_l"+l.Id) %>"  value="0"/>
                                <%} %>
                            </td>
                        <% } %>
                    </tr>
                <% } else { %>
                    <tr>
                        <td><%=l.intitule %></td>
                        <% foreach (canevasModel.colonne c in table.colonnes){ %>
                            <td>
                                <% if(c.type_colonne == "entier"){ %>
                                    <input type="number" name="<%="c"+Convert.ToString(c.Id+"_l"+l.Id) %>"  value="<%=c.cellules.FirstOrDefault(x => x.id_colonne == c.Id && x.id_ligne == l.Id).valeur %>" min="0" step="0.01"/>
                                <% } else{ %>
                                    <input type="text" name="<%="c"+Convert.ToString(c.Id+"_l"+l.Id) %>" value="<%=c.cellules.FirstOrDefault(x => x.id_colonne == c.Id && x.id_ligne == l.Id).valeur %>" />
                                <%} %>
                            </td>
                        <% } %>
                    </tr>
                <% } %>
            <% } %>
        </table>
        <button type="reset" value="Effacer" class="btn btn-danger">Initialiser</button>
    &nbsp;
    <asp:Button ID="Button1" Text="Valider" runat="server" CssClass="btn btn-warning" OnClick="Button1_Click"  />
    <%  } else {  %>
    <p>Ce tableau n'est pas encore prêt à remplir.</p>
    <% } %>
</asp:Content>

