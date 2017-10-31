<%@ Page Title="" Language="C#" MasterPageFile="~/operateur-master.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Operateur_Non_remplis_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Liste des tableaux non-remplis :</h3>
    <br />
    <asp:Label runat="server" ID="msg_lbl"></asp:Label>
    <br />
    <asp:GridView runat="server" ID="tableauGrid" AutoGenerateColumns="false" CssClass="table table-bordered">
        <Columns>
            <asp:BoundField DataField="tab" HeaderText ="Tableau :" />
            <asp:HyperLinkField HeaderText="Remplir :" DataNavigateUrlFields="remplir" Text="+Remplir" ControlStyle-CssClass="btn btn-default" />
        </Columns>
    </asp:GridView>
</asp:Content>

