<%@ Page Title="" Language="C#" MasterPageFile="~/admin-master.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Units_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Unité structurelle :</h3>
    <div class="well">
        <asp:Label runat="server" ID="lbl_action"></asp:Label>
        <br />
        <br />
        <asp:HiddenField runat="server" ID="action" />
        <div class="form-group">
             <label>Intitulé :</label>
            <asp:TextBox runat="server" ID="intitule_txt" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="intitule_txt" ErrorMessage="Le champ intitulé est obligatoire." CssClass="error-msg"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label>Unité mère:</label>
            <asp:DropDownList runat="server" ID="unitMereSelect" CssClass="form-control" AppendDataBoundItems="true" DataValueField="id" DataTextField="intitule">
                <asp:ListItem Value="0">Veulliez séléctionner une unité mère</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="unitMereSelect" ErrorMessage="Veulliez séléctionnez une unité mère." CssClass="error-msg"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <asp:Button  runat="server" ID="btnValidate" Text="Valider" CssClass="form-control btn btn-primary" OnClick="btnValidate_Click"/>
        </div>
    </div>
    <asp:Label runat="server" ID="results_lbl"></asp:Label>
    <asp:GridView runat="server" ID="unitsGrid" CssClass="table table-bordered" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="ID :" />
            <asp:BoundField DataField="intitule" HeaderText="Intitulé :" />
            <asp:BoundField DataField="unite_mere" HeaderText="Unité mère :" />
            <asp:HyperLinkField DataNavigateUrlFields="modify" HeaderText="Modifer: " Text="Modifier" ControlStyle-CssClass="btn btn-default" />
        </Columns>
    </asp:GridView>
</asp:Content>

