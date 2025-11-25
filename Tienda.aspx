<%@ Page Title="Tienda" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tienda.aspx.cs" Inherits="Ferro_Oriente.Tienda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3 mb-3">
        <div>
            <h1 class="h3 mb-0">Tienda</h1>
            <p class="text-muted mb-0">Explora el catálogo por categoría y agrega productos al carrito.</p>
        </div>
        <div class="d-flex gap-2 flex-wrap">
            <button type="button" class="btn btn-outline-primary btn-sm">Construcción</button>
            <button type="button" class="btn btn-outline-primary btn-sm">Eléctrico</button>
            <button type="button" class="btn btn-outline-primary btn-sm">Pintura</button>
            <button type="button" class="btn btn-outline-primary btn-sm">Ferretería</button>
        </div>
    </div>

    <div class="row g-4">
        <div class="col-12 col-md-4 col-lg-3">
            <div class="card h-100 shadow-sm">
                <div class="card-body">
                    <span class="badge bg-secondary mb-2">Construcción</span>
                    <h5 class="card-title">Varilla corrugada 3/8"</h5>
                    <p class="text-muted">Ideal para refuerzo estructural en losas y vigas.</p>
                    <p class="fw-bold mb-3">$4.20</p>
                    <a class="btn btn-outline-primary w-100" href="#">Agregar al carrito</a>
                </div>
            </div>
        </div>
        <div class="col-12 col-md-4 col-lg-3">
            <div class="card h-100 shadow-sm">
                <div class="card-body">
                    <span class="badge bg-secondary mb-2">Eléctrico</span>
                    <h5 class="card-title">Reflector LED 50W</h5>
                    <p class="text-muted">Luz fría IP65, carcasa de aluminio para exterior.</p>
                    <p class="fw-bold mb-3">$18.99</p>
                    <a class="btn btn-outline-primary w-100" href="#">Agregar al carrito</a>
                </div>
            </div>
        </div>
        <div class="col-12 col-md-4 col-lg-3">
            <div class="card h-100 shadow-sm">
                <div class="card-body">
                    <span class="badge bg-secondary mb-2">Pintura</span>
                    <h5 class="card-title">Sellador acrílico galón</h5>
                    <p class="text-muted">Preparación de muros con alto cubrimiento y rápido secado.</p>
                    <p class="fw-bold mb-3">$12.50</p>
                    <a class="btn btn-outline-primary w-100" href="#">Agregar al carrito</a>
                </div>
            </div>
        </div>
        <div class="col-12 col-md-4 col-lg-3">
            <div class="card h-100 shadow-sm">
                <div class="card-body">
                    <span class="badge bg-secondary mb-2">Ferretería</span>
                    <h5 class="card-title">Cerradura tubular</h5>
                    <p class="text-muted">Acabado satinado, incluye tres llaves y kit de instalación.</p>
                    <p class="fw-bold mb-3">$9.80</p>
                    <a class="btn btn-outline-primary w-100" href="#">Agregar al carrito</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
