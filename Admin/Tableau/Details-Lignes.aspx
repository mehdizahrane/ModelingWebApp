<%@ Page Title="" Language="C#" MasterPageFile="~/admin-master.master" AutoEventWireup="true" CodeFile="Details-Lignes.aspx.cs" Inherits="Admin_Tableau_Details_Lignes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Détails du tableau :<asp:Label runat="server" ID="lbl_nomTab"></asp:Label></h3>
    <hr />
    <asp:Label runat="server" ID="lbl_msg"></asp:Label>
    <br />
    <div class="well">
        <div class="form-group">
            <label>Intitulé :</label>
            <asp:TextBox runat="server" ID="txt_intituleLigne" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_intituleLigne" CssClass="error-msg" ErrorMessage="Le champ intitulé est obligatoire."></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <asp:Button runat="server" ID="btn_ajouterLigne" CssClass="form-control btn btn-primary" Text="Valider" OnClick="btn_ajouterLigne_Click" />
        </div>
    </div>
    <asp:HiddenField  runat="server" id="action" Value=""/>
    <br />
    <asp:Label runat="server" ID="lbl_result"></asp:Label>
    <asp:GridView runat="server" ID="ligneGrid" AutoGenerateColumns="false" CssClass="table table-bordered">
        <Columns>
            <asp:BoundField HeaderText="Intitulé :" DataField="intitule" />
            <asp:HyperLinkField HeaderText="Modifier :" ControlStyle-CssClass="btn btn-default" Text="Modifier" DataNavigateUrlFields="modify"/>
            <asp:HyperLinkField HeaderText="Supprimer :" ControlStyle-CssClass="btn btn-danger" Text="Supprimer" DataNavigateUrlFields="delete"/>
        </Columns>
    </asp:GridView>
</asp:Content>

