<%@ Page Title="" Language="C#" MasterPageFile="~/operateur-master.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Operateur_Remplis_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Liste des tableaux remplis :</h3>
    <br />
    <asp:Label runat="server" ID="msgLbl"> </asp:Label>
        <asp:GridView runat="server" ID="grid_tab" AutoGenerateColumns="false"   CssClass="table table-bordered">
            <Columns>
                <asp:BoundField DataField="tab" HeaderText ="Tableau :" />
                <asp:HyperLinkField HeaderText="Modifier :" DataNavigateUrlFields="modify" Text="Modifier" ControlStyle-CssClass="btn btn-default" />
            </Columns>
        </asp:GridView>
</asp:Content>

