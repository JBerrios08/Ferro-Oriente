using System.Collections.Generic;
using System.Linq;
using System.Web.SessionState;
using Ferro_Oriente.Models;

namespace Ferro_Oriente.Services
{
    public static class CartService
    {
        private const string SessionKey = "CartItems";

        public static List<CartItem> GetCart(HttpSessionState session)
        {
            var cart = session[SessionKey] as List<CartItem>;
            if (cart == null)
            {
                cart = new List<CartItem>();
                session[SessionKey] = cart;
            }

            return cart;
        }

        public static void AddItem(HttpSessionState session, Product product, int quantity = 1)
        {
            var cart = GetCart(session);
            var existing = cart.FirstOrDefault(c => c.ProductId == product.Id);
            if (existing != null)
            {
                existing.Cantidad += quantity;
            }
            else
            {
                cart.Add(new CartItem
                {
                    ProductId = product.Id,
                    Nombre = product.Nombre,
                    Precio = product.Precio,
                    Cantidad = quantity,
                    Imagen = product.Imagen
                });
            }
        }

        public static void UpdateQuantity(HttpSessionState session, int productId, int quantity)
        {
            var cart = GetCart(session);
            var item = cart.FirstOrDefault(c => c.ProductId == productId);
            if (item != null)
            {
                if (quantity <= 0)
                {
                    cart.Remove(item);
                }
                else
                {
                    item.Cantidad = quantity;
                }
            }
        }

        public static void Clear(HttpSessionState session)
        {
            session[SessionKey] = new List<CartItem>();
        }

        public static int CountItems(HttpSessionState session)
        {
            var cart = GetCart(session);
            var total = 0;
            foreach (var item in cart)
            {
                total += item.Cantidad;
            }
            return total;
        }

        public static decimal GetTotal(HttpSessionState session)
        {
            var cart = GetCart(session);
            decimal total = 0;
            foreach (var item in cart)
            {
                total += item.Subtotal;
            }
            return total;
        }
    }
}
