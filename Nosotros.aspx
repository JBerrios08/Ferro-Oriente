<%@ Page Title="Nosotros" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Nosotros.aspx.cs" Inherits="Ferro_Oriente.Nosotros" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row align-items-center mb-4">
        <div class="col-md-6">
            <h1 class="h3 fw-bold mb-3">Nuestra historia</h1>
            <p class="lead">Ferro Oriente nace como ferretería inspirada en el modelo Vidrí, acercando inventario especializado a proyectos residenciales y comerciales.</p>
            <p class="text-muted">Crecimos escuchando a maestros de obra, ingenieros y DIYers. Hoy mantenemos ese ADN: asesoría cercana, precios competitivos y entregas confiables.</p>
        </div>
        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">Imagen corporativa</h5>
                    <p class="text-muted">Identidad limpia con énfasis en seguridad y productividad. Paleta gris y acentos naranja para reflejar confianza y energía.</p>
                    <div class="d-flex gap-2">
                        <span class="badge rounded-pill bg-dark">Ferro Oriente</span>
                        <span class="badge rounded-pill bg-secondary">Ferretería pro</span>
                        <span class="badge rounded-pill bg-warning text-dark">Listos para ayudarte</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row g-3 mb-4">
        <div class="col-md-4">
            <div class="card h-100 shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">Misión</h5>
                    <p class="text-muted">Entregar soluciones de ferretería integrales con atención rápida, inventario confiable y asesoría técnica.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card h-100 shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">Visión</h5>
                    <p class="text-muted">Ser la referencia en el oriente del país para compras de construcción y mantenimiento en línea.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card h-100 shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">Valores</h5>
                    <ul class="list-unstyled mb-0 text-muted">
                        <li class="mb-2">✔️ Honestidad en precios y stock</li>
                        <li class="mb-2">✔️ Asesoría profesional</li>
                        <li class="mb-2">✔️ Cumplimiento en entregas</li>
                        <li>✔️ Innovación con ticket digital</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
