using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using Ferro_Oriente.Models;
using Ferro_Oriente.Services;

namespace Ferro_Oriente
{
    public partial class Tienda : System.Web.UI.Page
    {
        private readonly CatalogService _catalog = new CatalogService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCategorias();
                CargarProductos(null);
                RefrescarCarrito();
            }
        }

        private void CargarCategorias()
        {
            var categorias = _catalog.GetCategories();
            rptCategorias.DataSource = categorias;
            rptCategorias.DataBind();
        }

        private void CargarProductos(int? categoriaId)
        {
            var productos = _catalog.GetProducts(categoriaId);
            rptProductos.DataSource = productos;
            rptProductos.DataBind();
            lblTiendaMensaje.Visible = productos.Count == 0;
            lblTiendaMensaje.CssClass = "alert alert-warning";
            lblTiendaMensaje.Text = productos.Count == 0 ? "No hay productos en esta categoría." : string.Empty;
        }

        private void RefrescarCarrito()
        {
            var cart = CartService.GetCart(Session);
            rptCarrito.DataSource = cart;
            rptCarrito.DataBind();
            litItems.Text = CartService.CountItems(Session).ToString();
            litTotal.Text = CartService.GetTotal(Session).ToString("N2");
            ((SiteMaster)Master).litCartCount.Text = litItems.Text;
        }

        protected void btnTodos_Click(object sender, EventArgs e)
        {
            ViewState["CategoriaSeleccionada"] = null;
            CargarProductos(null);
        }

        protected void rptCategorias_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Filtrar")
            {
                int categoriaId;
                if (int.TryParse(e.CommandArgument.ToString(), out categoriaId))
                {
                    ViewState["CategoriaSeleccionada"] = categoriaId;
                    CargarProductos(categoriaId);
                }
            }
        }

        protected void rptProductos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Agregar")
            {
                int productId;
                if (int.TryParse(e.CommandArgument.ToString(), out productId))
                {
                    var product = _catalog.GetProductById(productId);
                    if (product != null)
                    {
                        CartService.AddItem(Session, product);
                        RefrescarCarrito();
                        MostrarMensajeCarrito("Producto agregado al carrito.", false);
                    }
                    else
                    {
                        MostrarMensajeCarrito("No se pudo agregar el producto.", true);
                    }
                }
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            var cart = CartService.GetCart(Session);
            if (cart.Count == 0)
            {
                MostrarMensajeCarrito("Agrega productos al carrito para continuar.", true);
                return;
            }

            if (Session["UserId"] == null)
            {
                MostrarMensajeCarrito("Inicia sesión para finalizar la compra.", true);
                return;
            }

            try
            {
                var ticket = _catalog.CrearTicket(Convert.ToInt32(Session["UserId"]), new List<CartItem>(cart));
                CartService.Clear(Session);
                RefrescarCarrito();
                MostrarMensajeCarrito($"Compra confirmada. Ticket: {ticket}.", false);
            }
            catch (Exception ex)
            {
                MostrarMensajeCarrito("Error al guardar el ticket: " + ex.Message, true);
            }
        }

        private void MostrarMensajeCarrito(string mensaje, bool error)
        {
            lblCarritoMensaje.Visible = true;
            lblCarritoMensaje.Text = mensaje;
            lblCarritoMensaje.CssClass = "alert " + (error ? "alert-danger" : "alert-success") + " mt-3";
        }
    }
}
