<%@ Page Title="" Language="C#" MasterPageFile="~/admin-master.master" AutoEventWireup="true" CodeFile="Changer-Pass-User.aspx.cs" Inherits="Admin_User_Changer_Pass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Modifier mot de passe de l'utilisateur : <asp:Label runat="server" ID="nomPrenom_lbl"></asp:Label></h3>
    <br />
    <asp:CompareValidator runat="server" CssClass="error-msg" ErrorMessage="Les deux mot de passe entré ne sont pas identiques." ControlToValidate="firstMdp" ControlToCompare="secondMdp"  Type="String" ></asp:CompareValidator>
    <br />
    <asp:Label runat="server" ID="msg"></asp:Label>
    <br />
    <br />
    <div class="form-group">
        <label>Entrez le nouveau mot de passe :</label>
        <asp:TextBox runat="server" ID="firstMdp" CssClass="form-control" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="firstMdp" ErrorMessage="Ce champ est obligatoire." CssClass="error-msg"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group">
        <label>Retapez le nouveau mot de passe :</label>
        <asp:TextBox runat="server" ID="secondMdp" CssClass="form-control" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="secondMdp" ErrorMessage="Ce champ est obligatoire." CssClass="error-msg"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group">
        <asp:Button runat="server" ID="btnValidate" CssClass="form-control btn btn-primary" Text="Valider" OnClick="btnValidate_Click" />
    </div> 
</asp:Content>

