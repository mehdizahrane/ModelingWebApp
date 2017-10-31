<%@ Page Title="" Language="C#" MasterPageFile="~/admin-master.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <h1>Bienvenue dans votre compte Admin.</h1>
        <br />
    <h3>Quelque infos :</h3>
    <div class="row">
        <div class="col-md-4 jumbotron text-center">
            <h3> <i class="fa fa-user"></i> 10 Utilisateurs</h3>
        </div>
        <div class="col-md-4 jumbotron text-center">
            <h3><i class="fa fa-bar-chart"></i> 10 Tableaux</h3>
        </div>
        <div class="col-md-4 jumbotron text-center">
            <h3><i class="fa fa-building"></i> 10 Directions</h3>
        </div>
    </div>
    <br />
    <hr />
    <h3>Dernier tableaux créer :</h3>
    <table class="table-bordered table">
        <tr>
            <td>Nom tableau :</td>
            <td>Nombre de colonnes :</td>
            <td>Nombre de lignes :</td>
        </tr>
        <tr>
            <td>X</td>
            <td>4</td>
            <td>6</td>
        </tr>
        <tr>
            <td>X</td>
            <td>4</td>
            <td>6</td>
       </tr>
       <tr>
            <td>X</td>
            <td>4</td>
            <td>6</td>
       </tr>
    </table>
</asp:Content>

