<%@ Page Title="" Language="C#" MasterPageFile="~/admin-master.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Tableau_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Tableaux :</h3>
    <br />
    <asp:HyperLink runat="server" NavigateUrl="~/Admin/Tableau/Creer.aspx" CssClass="btn btn-warning" Text="+Ajouter un nouveau tableau"></asp:HyperLink>
    <br />
    <br />
    <asp:GridView runat="server" ID="tabs_grid" CssClass="table table-bordered" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField HeaderText="Intitulé"  DataField="intitule"/>
            <asp:BoundField HeaderText="Description" DataField="desc"/>
            <asp:HyperLinkField HeaderText="Colonnes :" ControlStyle-CssClass="btn btn-default" Text="+Détails" DataNavigateUrlFields="details_col"/>
            <asp:HyperLinkField HeaderText="Lignes :" ControlStyle-CssClass="btn btn-default" Text="+Détails" DataNavigateUrlFields="details_ligne"/>
        </Columns>
    </asp:GridView>
    <asp:Label runat="server" ID="msg"></asp:Label>
</asp:Content>

