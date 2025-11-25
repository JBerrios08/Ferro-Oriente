<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ferro_Oriente._Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="homeCarousel" class="carousel slide mb-4" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#homeCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Hero 1"></button>
            <button type="button" data-bs-target="#homeCarousel" data-bs-slide-to="1" aria-label="Hero 2"></button>
            <button type="button" data-bs-target="#homeCarousel" data-bs-slide-to="2" aria-label="Hero 3"></button>
        </div>
        <div class="carousel-inner rounded shadow-sm">
            <div class="carousel-item active bg-dark text-white" style="height: 360px;">
                <div class="h-100 d-flex flex-column justify-content-center align-items-center text-center p-4">
                    <h1 class="display-5 fw-bold">Soluciones para tu proyecto</h1>
                    <p class="lead">Herramientas, materiales y asesoría técnica en un solo lugar.</p>
                    <a class="btn btn-primary btn-lg" href="Tienda.aspx">Ir a la tienda</a>
                </div>
            </div>
            <div class="carousel-item bg-secondary text-white" style="height: 360px;">
                <div class="h-100 d-flex flex-column justify-content-center align-items-center text-center p-4">
                    <h2 class="fw-bold">Categorías profesionales</h2>
                    <p class="mb-3">Construcción, electricidad, pintura y más, con stock actualizado.</p>
                    <a class="btn btn-outline-light" href="Tienda.aspx">Ver productos</a>
                </div>
            </div>
            <div class="carousel-item bg-primary text-white" style="height: 360px;">
                <div class="h-100 d-flex flex-column justify-content-center align-items-center text-center p-4">
                    <h2 class="fw-bold">Entrega rápida</h2>
                    <p class="mb-3">Compra en línea y recibe tu ticket por correo con detalles en PDF.</p>
                    <a class="btn btn-light" href="Contacto.aspx">Contáctanos</a>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#homeCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Anterior</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#homeCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Siguiente</span>
        </button>
    </div>

    <section class="mb-5">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2 class="h4 mb-0">Categorías</h2>
            <a class="btn btn-link" href="Tienda.aspx">Ver todo</a>
        </div>
        <div class="row g-3">
            <div class="col-12 col-md-3">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Construcción</h5>
                        <p class="card-text text-muted">Cemento, bloques, varillas, soldadura y herramientas de obra.</p>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-3">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Eléctrico</h5>
                        <p class="card-text text-muted">Cableado, luminarias LED, tubería EMT y accesorios.</p>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-3">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Pintura</h5>
                        <p class="card-text text-muted">Esmaltes, selladores, brochas y rodillos profesionales.</p>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-3">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Ferretería</h5>
                        <p class="card-text text-muted">Tornillería, anclajes, cerraduras y accesorios de fijación.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section>
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2 class="h4 mb-0">Productos destacados</h2>
            <a class="btn btn-primary" href="Tienda.aspx">Comprar ahora</a>
        </div>
        <div class="row g-4">
            <div class="col-12 col-md-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Taladro percutor 1/2"</h5>
                        <p class="text-muted">750W, velocidad variable, ideal para concreto y acero.</p>
                        <span class="badge bg-success">En stock</span>
                    </div>
                    <div class="card-footer bg-white border-top-0">
                        <a class="btn btn-outline-primary w-100" href="Tienda.aspx">Agregar al carrito</a>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Kit pintura interior</h5>
                        <p class="text-muted">Incluye rodillo, brocha, bandeja y cinta de enmascarar.</p>
                        <span class="badge bg-warning text-dark">Popular</span>
                    </div>
                    <div class="card-footer bg-white border-top-0">
                        <a class="btn btn-outline-primary w-100" href="Tienda.aspx">Agregar al carrito</a>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Juego de llaves combinadas</h5>
                        <p class="text-muted">Estuche de 12 piezas en acero al cromo vanadio.</p>
                        <span class="badge bg-info text-dark">Nuevo</span>
                    </div>
                    <div class="card-footer bg-white border-top-0">
                        <a class="btn btn-outline-primary w-100" href="Tienda.aspx">Agregar al carrito</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
