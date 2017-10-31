<%@ Page Title="" Language="C#" MasterPageFile="~/dr.master" AutoEventWireup="true" CodeFile="Modifier-Pass.aspx.cs" Inherits="Dri_Modifier_Pass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        
    </style>
    <div class="container">
         <h3>Modifier votre mot de passe :</h3>
        <div class="container">
            <br />
            <asp:Label runat="server" ID="exMsg"></asp:Label>
            <br />
            <asp:CompareValidator runat="server" ControlToCompare="newPass2" Operator="Equal" ControlToValidate="newPass" ErrorMessage="Le champ nouveau mot de passe et retapez mot de passe ne sont pas identiques." CssClass="error-msg"></asp:CompareValidator>
        </div>
        <div class="row">
            <div class="col-md-9">
                <div class="form-group">
                    <label>Ancien mot de passe :</label>&nbsp;
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ancienPass" ErrorMessage="Le champ ancien mot de passe est obligatoire." CssClass="error-msg"></asp:RequiredFieldValidator>
                    <asp:TextBox runat="server" TextMode="Password" id="ancienPass" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Nouveau mot de passe :</label>&nbsp;
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="newPass" ErrorMessage="Le champ nouveau mot de passe est obligatoire." CssClass="error-msg"></asp:RequiredFieldValidator>
                    <asp:TextBox runat="server" TextMode="Password" id="newPass" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <div class="form-group">
                        <label>Retapez nouveau mot de passe :</label>&nbsp;
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="newPass2" ErrorMessage="Le champ retapez mot de passe est obligatoire." CssClass="error-msg"></asp:RequiredFieldValidator>
                        <asp:TextBox runat="server" TextMode="Password" id="newPass2" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Button runat="server" ID="validatePass" CssClass="form-control btn btn-primary" Text="Valider" OnClick="validatePass_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

