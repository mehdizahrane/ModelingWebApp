<%@ Page Title="" Language="C#" MasterPageFile="~/dr.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Dri_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Effectuer des recherches :</h3>
    <br />
    <asp:Label runat="server" ID="msg"> </asp:Label>
    <br />
    <br />
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label><strong>Tableau :</strong></label>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tab_dropDow" ErrorMessage="Veuillez séléctioner un tableau." CssClass="error-msg"></asp:RequiredFieldValidator>
                <asp:DropDownList runat="server" ID="tab_dropDow" CssClass="form-control" DataValueField="id" DataTextField="intitule" AppendDataBoundItems="true">
                    <asp:ListItem Value="">Séléctionnez un tableau</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label><strong>Direction :</strong></label>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="directionCheck" ErrorMessage="Veuillez séléctioner une direction." CssClass="error-msg"></asp:RequiredFieldValidator>
                <asp:ListBox ID="directionCheck" SelectionMode="Multiple" runat="server" CssClass="form-control" AppendDataBoundItems="true" DataValueField="id" DataTextField="intitule" >
                    <asp:ListItem Value="">Séléctionnez une direction</asp:ListItem>
                </asp:ListBox>
            </div>
        </div>
    </div>
    <div class="row" >
        <div class="form-group">
             <asp:Button runat="server" ID="btn_Validate" CssClass="form-control btn btn-primary" Text="Valider"  OnClick="btn_Validate_Click" />
        </div>
    </div>
    <div class="container">
        <asp:GridView runat="server" ID="tabGrid" CssClass="table table-bordered" AutoGenerateColumns="true"></asp:GridView>
    </div>
    <script>
      
        
    </script>
</asp:Content>

