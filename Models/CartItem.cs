using System;

namespace Ferro_Oriente.Models
{
    [Serializable]
    public class CartItem
    {
        public int ProductId { get; set; }
        public string Nombre { get; set; }
        public decimal Precio { get; set; }
        public int Cantidad { get; set; }
        public string Imagen { get; set; }
        public decimal Subtotal => Precio * Cantidad;
    }
}
