namespace Ferro_Oriente.Models
{
    public class Product
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public decimal Precio { get; set; }
        public int Almacen { get; set; }
        public string Imagen { get; set; }
        public int CategoriaId { get; set; }
        public string CategoriaNombre { get; set; }
    }
}
