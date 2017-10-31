<%@ Page Title="" Language="C#" MasterPageFile="~/admin-master.master" AutoEventWireup="true" CodeFile="Details-Colonnes.aspx.cs" Inherits="Admin_Tableau_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >

    <h3>Détails du tableau : <asp:Label runat="server" ID="nom_tab"></asp:Label></h3> 
    <asp:Label runat="server" ID="lbl_dev"></asp:Label>
    <hr />
    <div class="well">
        <p runat="server" id="action_lbl"><strong>Ajouter une colonne :</strong></p>
        <asp:HiddenField runat="server" id="action" />
        <div class="form-group">
            <label>Initulé :</label>
            <asp:TextBox runat="server" ID="txt_colonneNom" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_colonneNom" ErrorMessage="Le champ intitulé est obligatoire." CssClass="error-msg"></asp:RequiredFieldValidator>
        </div>
        <div class="from-group">
            <label>Type de colonne :</label>
            <asp:DropDownList runat="server" ID="type_col" CssClass="form-control" >
                <asp:ListItem Value="">Séléctionnez un type</asp:ListItem>
                <asp:ListItem Value="entier">Entier</asp:ListItem> 
                <asp:ListItem Value="text">Text</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="type_col" ErrorMessage="Veulliez séléctionner un type." CssClass="error-msg"></asp:RequiredFieldValidator>
        </div>
        <br />
        <div class="form-group">
            <asp:Button runat="server" ID="addColonne" CssClass="form-control btn btn-primary" Text="Valider" OnClick="addColonne_Click" />
        </div>
    </div>
    <br />
    <asp:Label runat="server" ID="lbl_colonne"></asp:Label>
    <asp:GridView runat="server" ID="colonnes_grid" AutoGenerateColumns="false" CssClass="table table-bordered" DataKeyNames="idCol" OnSelectedIndexChanged="colonnes_grid_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="intitule" HeaderText="Intitulé de la colonne" />
            <asp:BoundField DataField="type_col" HeaderText="Type de la colonne" />
            <asp:HyperLinkField DataNavigateUrlFields="modifier" HeaderText="Modifier" Text="Modifier" ControlStyle-CssClass="btn btn-default" />
            <asp:CommandField HeaderText="Supprimer :" ShowSelectButton="true" SelectText="Supprimer" ControlStyle-CssClass="btn btn-danger" />
        </Columns>
    </asp:GridView>
    <hr />
</asp:Content>

