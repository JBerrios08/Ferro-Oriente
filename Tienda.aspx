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
            <asp:Button ID="btnTodos" runat="server" CssClass="btn btn-outline-primary btn-sm" Text="Todas" OnClick="btnTodos_Click" />
            <asp:Repeater ID="rptCategorias" runat="server" OnItemCommand="rptCategorias_ItemCommand">
                <ItemTemplate>
                    <asp:LinkButton runat="server" CssClass="btn btn-outline-primary btn-sm" CommandName="Filtrar" CommandArgument="<%# Eval(\"Id\") %>">
                        <%# Eval("Nombre") %>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

    <asp:Label ID="lblTiendaMensaje" runat="server" Visible="false" CssClass="alert"></asp:Label>

    <div class="row g-4">
        <div class="col-12 col-lg-8">
            <div class="row g-3" id="gridProductos">
                <asp:Repeater ID="rptProductos" runat="server" OnItemCommand="rptProductos_ItemCommand">
                    <ItemTemplate>
                        <div class="col-12 col-md-6">
                            <div class="card h-100 shadow-sm">
                                <img src="<%# string.IsNullOrWhiteSpace(Eval(\"Imagen\") as string) ? \"https://via.placeholder.com/600x300?text=Producto\" : Eval(\"Imagen\") %>" class="card-img-top" alt="Imagen de producto" />
                                <div class="card-body">
                                    <span class="badge bg-secondary mb-2"><%# Eval("CategoriaNombre") %></span>
                                    <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                    <p class="text-muted">Stock: <%# Eval("Almacen") %></p>
                                    <p class="fw-bold mb-3">$<%# Eval("Precio", "{0:N2}") %></p>
                                    <asp:LinkButton runat="server" CssClass="btn btn-outline-primary w-100" CommandName="Agregar" CommandArgument="<%# Eval(\"Id\") %>">Agregar al carrito</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="col-12 col-lg-4" id="carrito">
            <div class="card h-100 shadow-sm">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h5 class="mb-0">Carrito</h5>
                        <span class="badge bg-primary"><asp:Literal ID="litItems" runat="server" /></span>
                    </div>
                    <asp:Repeater ID="rptCarrito" runat="server">
                        <HeaderTemplate>
                            <ul class="list-group mb-3">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="list-group-item d-flex justify-content-between align-items-start">
                                <div class="me-2 flex-grow-1">
                                    <div class="fw-bold"><%# Eval("Nombre") %></div>
                                    <small class="text-muted">$<%# Eval("Precio", "{0:N2}") %> x <%# Eval("Cantidad") %></small>
                                </div>
                                <div class="text-end">
                                    <div class="fw-semibold">$<%# Eval("Subtotal", "{0:N2}") %></div>
                                </div>
                            </li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                    <div class="d-flex justify-content-between fw-bold mb-3">
                        <span>Total</span>
                        <span>$<asp:Literal ID="litTotal" runat="server" /></span>
                    </div>
                    <asp:Button ID="btnCheckout" runat="server" CssClass="btn btn-success w-100" Text="Confirmar compra" OnClick="btnCheckout_Click" />
                    <asp:Label ID="lblCarritoMensaje" runat="server" Visible="false" CssClass="alert mt-3"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
