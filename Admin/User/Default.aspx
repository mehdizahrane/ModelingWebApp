<%@ Page Title="" Language="C#" MasterPageFile="~/admin-master.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>List des utilisateurs : </h3>
    <asp:HyperLink runat="server" NavigateUrl="~/Admin/User/Action.aspx" CssClass="btn btn-default">+Ajouter un utilisateur</asp:HyperLink>
    <br />
    <asp:Label runat="server" ID="result_lbl"></asp:Label>
    <asp:GridView runat="server" ID="userGrid" CssClass="table table-bordered" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="login" HeaderText="Login :" />
            <asp:BoundField DataField="nom_prenom" HeaderText="Nom & prènom :" />
            <asp:BoundField DataField="type" HeaderText="Type :" />
            <asp:BoundField DataField="unit" HeaderText="Unité structurelle :" />
            <asp:HyperLinkField DataNavigateUrlFields="change_pass" HeaderText="Changer mot de passe :" Text="Changer" ControlStyle-CssClass="btn btn-warning" />
            <asp:HyperLinkField DataNavigateUrlFields="modify" HeaderText="Modifier :" Text="Modifier" ControlStyle-CssClass="btn btn-default" />
        </Columns>
    </asp:GridView>
</asp:Content>

