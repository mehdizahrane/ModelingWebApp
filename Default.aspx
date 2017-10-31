<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta content="mehdi zahrane" name="author" />
    <meta name="application-name" content="Gestion des modèles" />
    <meta name="description" content="Direction régional de casablanca" />
    <meta name="viewport" content="widht: init-scale" />
    <title>Gestion des modèles</title>
    <link href="~/Content/css/style.css" rel="stylesheet" />
    <link href="Content/css/font-awesome/css/font-awesome.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server" class="container">
        <br />
    <div class="container">
        <asp:Image ImageUrl="~/Content/img/header.jpg" runat="server" ID="header" CssClass="img-responsive" style="height: 290px; width: 100%;"/>
        <div class="row">
            <div class="col-md-4">
                &nbsp;
            </div>
            <div class="col-md-4">
                <div class="well">
                    <h3><i class="fa fa-lock" aria-hidden="true"></i> Authentification :</h3>
                    <br />
                    <div class="form-group">
                        <label>Login :</label>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="Le login est obligatoire." ControlToValidate="login_txt" CssClass="error-msg"></asp:RequiredFieldValidator>
                        <asp:TextBox runat="server" ID="login_txt" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Mot de passe :</label> 
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="Le mot de passe est obligatoire." ControlToValidate="mdp_txt" CssClass="error-msg"></asp:RequiredFieldValidator>
                        <asp:TextBox runat="server" ID="mdp_txt" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" ID="msg" Text="Invalid login ou mot de passe." CssClass="error-msg" Visible="false"></asp:Label>
                        <br />
                        <br />
                        <asp:Button  runat="server" ID="btn_connect" CssClass="form-control btn btn-warning" Text="Se connecter" OnClick="btn_connect_Click"/>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                &nbsp;
            </div>
        </div>
    </div>
    </form>
</body>
</html>
