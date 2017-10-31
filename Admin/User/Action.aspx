<%@ Page Title="" Language="C#" MasterPageFile="~/admin-master.master" AutoEventWireup="true" CodeFile="Action.aspx.cs" Inherits="Admin_User_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3><asp:Label runat="server" id="title_lbl"></asp:Label></h3>
    <asp:HiddenField ID="action"   runat="server"/>
    <asp:Label runat="server" ID="msg_lbl"></asp:Label>
    <div class="row">
        <div class="col-md-6">
             <div class="form-group">
                 <label>Nom :</label>
                 <asp:TextBox runat="server" ID="nom_txt" CssClass="form-control"></asp:TextBox>
                 <asp:RequiredFieldValidator CssClass="error-msg" runat="server" ControlToValidate="nom_txt" ErrorMessage="Le champ nom est obligatoire."></asp:RequiredFieldValidator>
             </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label>Prènom :</label>
                <asp:TextBox runat="server" ID="prenom_txt" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="error-msg" runat="server" ControlToValidate="prenom_txt" ErrorMessage="Le champ prènom est obligatoire."></asp:RequiredFieldValidator>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
             <div class="form-group">
                 <label>Login :</label>
                 <asp:TextBox runat="server" ID="login_txt" CssClass="form-control"></asp:TextBox>
                 <asp:RequiredFieldValidator CssClass="error-msg" runat="server" ControlToValidate="login_txt" ErrorMessage="Le champ login est obligatoire."></asp:RequiredFieldValidator>
             </div>
        </div>
         <div class="col-md-6" runat="server" id="mdpWell">
            <div class="form-group">
                <label>Mot de passe :</label>
                <asp:TextBox runat="server" ID="mdp_txt" TextMode="Password" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="error-msg" runat="server" ControlToValidate="mdp_txt" ErrorMessage="Le champ mot de passe est obligatoire."></asp:RequiredFieldValidator>
            </div>
         </div>
    </div>
    <div class="row">
        <div class="col-md-6">
             <div class="form-group">
                 <label>Type :</label>
                 <asp:DropDownList runat="server" CssClass="form-control" ID="typeSelect">
                     <asp:ListItem Value="">Veulliez séléctioner un type</asp:ListItem>
                     <asp:ListItem Value="admin">Administrateur</asp:ListItem>
                     <asp:ListItem Value="dri">Directeur régional</asp:ListItem>
                     <asp:ListItem Value="operateur">Opèrateur</asp:ListItem>
                 </asp:DropDownList>
                 <asp:RequiredFieldValidator CssClass="error-msg" runat="server" ControlToValidate="typeSelect" ErrorMessage="Veulliez séléctionner un type."></asp:RequiredFieldValidator>
             </div>
        </div>
         <div class="col-md-6">
             <div class="form-group">
                 <label>Unité structurelle :</label>
                 <asp:DropDownList runat="server" ID="unitSelect" CssClass="form-control" AppendDataBoundItems="true" DataValueField="id" DataTextField="intitule">
                     <asp:ListItem Value="">Veulliez séléctionner une unité</asp:ListItem>
                 </asp:DropDownList>
                 <asp:RequiredFieldValidator CssClass="error-msg" runat="server" ControlToValidate="mdp_txt" ErrorMessage="Veulliez séléctionner une unité structurelle."></asp:RequiredFieldValidator>
             </div>
         </div>
    </div>
    <br />
    <div class="form-group">
        <asp:Button runat="server" ID="btnValidate" CssClass="form-control btn btn-primary" Text="Valider" OnClick="btnValidate_Click" />
    </div>
</asp:Content>

