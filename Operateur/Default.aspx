<%@ Page Title="" Language="C#" MasterPageFile="~/operateur-master.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Operateur_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Bienvenue dans votre compte Opérateur.</h1>
    <br />
    <h3>Quelque infos :</h3>
    <div class="row">
        <div class="col-md-4 jumbotron text-center">
            <h3> <i class="fa fa-bar-chart"></i> 10 Tableaux</h3>
        </div>
        <div class="col-md-4 jumbotron text-center">
            <h3><i class="fa fa-bar-chart"></i> 1 Tableau non-rempli</h3>
        </div>
        <div class="col-md-4 jumbotron text-center">
            <h3><i class="fa fa-bar-chart"></i> 9 Tableaux remplis</h3>
        </div>
    </div>
</asp:Content>

