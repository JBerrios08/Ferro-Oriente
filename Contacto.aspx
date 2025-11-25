<%@ Page Title="Contacto" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="Ferro_Oriente.Contacto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row mb-4">
        <div class="col-lg-7 mb-3 mb-lg-0">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h1 class="h4 mb-3">Contáctanos</h1>
                    <p class="text-muted">Envíanos tus dudas sobre stock, cotizaciones o compras en línea. Responderemos a tu correo corporativo.</p>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="txtNombre" class="form-label">Nombre</label>
                            <input type="text" id="txtNombre" class="form-control" placeholder="Tu nombre" />
                        </div>
                        <div class="col-md-6">
                            <label for="txtCorreo" class="form-label">Correo</label>
                            <input type="email" id="txtCorreo" class="form-control" placeholder="correo@empresa.com" />
                        </div>
                        <div class="col-12">
                            <label for="txtMensaje" class="form-label">Mensaje</label>
                            <textarea id="txtMensaje" class="form-control" rows="4" placeholder="Cuéntanos qué necesitas"></textarea>
                        </div>
                        <div class="col-12 d-grid">
                            <button type="button" class="btn btn-primary">Enviar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-5">
            <div class="card h-100 shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">Detalles</h5>
                    <p class="mb-2">Correo corporativo: <strong>ventas@ferrooriente.com</strong></p>
                    <p class="mb-2">Teléfono: <strong>(503) 2222-0000</strong></p>
                    <p class="text-muted">Dirección: Km 5 Carretera al Puerto, Bodega 3. Atendemos de lunes a sábado.</p>
                    <div class="ratio ratio-16x9 rounded overflow-hidden">
                        <div class="bg-light d-flex align-items-center justify-content-center text-muted">Mapa o ubicación</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
