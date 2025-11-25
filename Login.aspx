<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Ferro_Oriente.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h1 class="h4 mb-3 text-center">Acceso</h1>
                    <p class="text-muted text-center">Ingresa con tu cuenta para gestionar compras o administrar el catálogo.</p>
                    <div class="mb-3">
                        <label for="txtCorreoLogin" class="form-label">Correo</label>
                        <input type="email" id="txtCorreoLogin" class="form-control" placeholder="correo@ferrooriente.com" />
                    </div>
                    <div class="mb-3">
                        <label for="txtPassword" class="form-label">Contraseña</label>
                        <input type="password" id="txtPassword" class="form-control" placeholder="••••••••" />
                    </div>
                    <div class="d-grid mb-2">
                        <button type="button" class="btn btn-primary">Iniciar sesión</button>
                    </div>
                    <div class="text-center small text-muted">
                        <span>Rol por defecto al registrarse: Usuario</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
