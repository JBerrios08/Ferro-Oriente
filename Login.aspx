<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Ferro_Oriente.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <div class="card shadow-sm mb-3">
                <div class="card-body">
                    <h1 class="h4 mb-3 text-center">Acceso</h1>
                    <p class="text-muted text-center">Ingresa con tu cuenta para gestionar compras o administrar el catálogo.</p>
                    <asp:Label ID="lblMensaje" runat="server" CssClass="alert alert-info d-none" EnableViewState="false"></asp:Label>
                    <div class="mb-3">
                        <label for="txtCorreoLogin" class="form-label">Correo</label>
                        <asp:TextBox ID="txtCorreoLogin" runat="server" CssClass="form-control" TextMode="Email" placeholder="correo@ferrooriente.com" />
                    </div>
                    <div class="mb-3">
                        <label for="txtPassword" class="form-label">Contraseña</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="••••••••" />
                    </div>
                    <div class="d-grid mb-2">
                        <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary" Text="Iniciar sesión" OnClick="btnLogin_Click" />
                    </div>
                    <div class="text-center small text-muted">
                        <span>Rol por defecto al registrarse: Usuario</span>
                    </div>
                </div>
            </div>
            <div class="card shadow-sm">
                <div class="card-body">
                    <h2 class="h5 mb-3 text-center">Registrarse</h2>
                    <div class="mb-3">
                        <label for="txtNombre" class="form-label">Nombre</label>
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Tu nombre" />
                    </div>
                    <div class="mb-3">
                        <label for="txtCorreoRegistro" class="form-label">Correo</label>
                        <asp:TextBox ID="txtCorreoRegistro" runat="server" CssClass="form-control" TextMode="Email" placeholder="usuario@correo.com" />
                    </div>
                    <div class="mb-3">
                        <label for="txtPasswordRegistro" class="form-label">Contraseña</label>
                        <asp:TextBox ID="txtPasswordRegistro" runat="server" CssClass="form-control" TextMode="Password" />
                    </div>
                    <div class="d-grid">
                        <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-outline-primary" Text="Crear cuenta" OnClick="btnRegistrar_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
