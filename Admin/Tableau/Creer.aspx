<%@ Page Title="" Language="C#" MasterPageFile="~/admin-master.master" AutoEventWireup="true" CodeFile="Creer.aspx.cs" Inherits="Admin_Tableau_Creer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Créer un nouveau tableau :</h3>
    <br />
    <asp:Label runat="server" ID="error_msg"></asp:Label>
    <br />
    <div class="form-group">
        <label>Intitulé :</label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="intitule_input" CssClass="error-msg" ErrorMessage="&nbsp;Le champ intitulé est obligatoire.">
        </asp:RequiredFieldValidator>
        <asp:TextBox runat="server" ID="intitule_input" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label>Description :</label>
        <asp:TextBox runat="server" TextMode="MultiLine" ID="description_input" CssClass="form-control"></asp:TextBox>
    </div>
    <br />
    <div class="form-group">
        <asp:Button runat="server" ID="btn_valider_nouv_tab" CssClass="form-control btn btn-warning" Text="Valider" OnClick="btn_valider_nouv_tab_Click" />
    </div>
</asp:Content>

