using System;
using System.Collections.Generic;
using Ferro_Oriente.Models;
using MySql.Data.MySqlClient;

namespace Ferro_Oriente.Services
{
    public class CatalogService
    {
        public List<Category> GetCategories()
        {
            var categories = new List<Category>();
            using (var conn = Database.GetConnection())
            {
                conn.Open();
                const string sql = "SELECT id, nombre, descripcion FROM categorias ORDER BY nombre";
                using (var cmd = new MySqlCommand(sql, conn))
                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        categories.Add(new Category
                        {
                            Id = reader.GetInt32("id"),
                            Nombre = reader.GetString("nombre"),
                            Descripcion = reader.IsDBNull(reader.GetOrdinal("descripcion")) ? null : reader.GetString("descripcion")
                        });
                    }
                }
            }

            return categories;
        }

        public List<Product> GetProducts(int? categoryId = null)
        {
            var products = new List<Product>();
            using (var conn = Database.GetConnection())
            {
                conn.Open();
                var sql = @"SELECT i.id, i.nombre, i.precio, i.almacen, i.imagen, i.categoria_id, c.nombre AS categoria_nombre
FROM inventario i LEFT JOIN categorias c ON c.id = i.categoria_id";
                if (categoryId.HasValue)
                {
                    sql += " WHERE i.categoria_id = @categoriaId";
                }

                sql += " ORDER BY i.nombre";

                using (var cmd = new MySqlCommand(sql, conn))
                {
                    if (categoryId.HasValue)
                    {
                        cmd.Parameters.AddWithValue("@categoriaId", categoryId.Value);
                    }

                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            products.Add(new Product
                            {
                                Id = reader.GetInt32("id"),
                                Nombre = reader.GetString("nombre"),
                                Precio = reader.GetDecimal("precio"),
                                Almacen = reader.GetInt32("almacen"),
                                Imagen = reader.IsDBNull(reader.GetOrdinal("imagen")) ? null : reader.GetString("imagen"),
                                CategoriaId = reader.IsDBNull(reader.GetOrdinal("categoria_id")) ? 0 : reader.GetInt32("categoria_id"),
                                CategoriaNombre = reader.IsDBNull(reader.GetOrdinal("categoria_nombre")) ? "Sin categoría" : reader.GetString("categoria_nombre")
                            });
                        }
                    }
                }
            }

            return products;
        }

        public Product GetProductById(int productId)
        {
            using (var conn = Database.GetConnection())
            {
                conn.Open();
                const string sql = @"SELECT i.id, i.nombre, i.precio, i.almacen, i.imagen, i.categoria_id, c.nombre AS categoria_nombre
FROM inventario i LEFT JOIN categorias c ON c.id = i.categoria_id WHERE i.id = @id LIMIT 1";
                using (var cmd = new MySqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@id", productId);
                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return new Product
                            {
                                Id = reader.GetInt32("id"),
                                Nombre = reader.GetString("nombre"),
                                Precio = reader.GetDecimal("precio"),
                                Almacen = reader.GetInt32("almacen"),
                                Imagen = reader.IsDBNull(reader.GetOrdinal("imagen")) ? null : reader.GetString("imagen"),
                                CategoriaId = reader.IsDBNull(reader.GetOrdinal("categoria_id")) ? 0 : reader.GetInt32("categoria_id"),
                                CategoriaNombre = reader.IsDBNull(reader.GetOrdinal("categoria_nombre")) ? "Sin categoría" : reader.GetString("categoria_nombre")
                            };
                        }
                    }
                }
            }

            return null;
        }

        public string CrearTicket(int usuarioId, List<CartItem> items)
        {
            if (items == null || items.Count == 0)
            {
                throw new InvalidOperationException("No hay productos en el carrito.");
            }

            using (var conn = Database.GetConnection())
            {
                conn.Open();
                using (var tx = conn.BeginTransaction())
                {
                    try
                    {
                        var numero = "FO-" + DateTime.UtcNow.ToString("yyyyMMddHHmmss");
                        decimal total = 0;
                        foreach (var item in items)
                        {
                            total += item.Subtotal;
                        }

                        const string insertTicket = @"INSERT INTO tickets (numero_ticket, usuario_id, total) VALUES (@numero, @usuarioId, @total); SELECT LAST_INSERT_ID();";
                        long ticketId;
                        using (var cmd = new MySqlCommand(insertTicket, conn, tx))
                        {
                            cmd.Parameters.AddWithValue("@numero", numero);
                            cmd.Parameters.AddWithValue("@usuarioId", usuarioId);
                            cmd.Parameters.AddWithValue("@total", total);
                            ticketId = (long)cmd.ExecuteScalar();
                        }

                        const string insertDetalle = @"INSERT INTO ticket_detalle (ticket_id, producto_id, precio_unitario, cantidad, subtotal) 
VALUES (@ticketId, @productoId, @precio, @cantidad, @subtotal);";
                        foreach (var item in items)
                        {
                            using (var cmd = new MySqlCommand(insertDetalle, conn, tx))
                            {
                                cmd.Parameters.AddWithValue("@ticketId", ticketId);
                                cmd.Parameters.AddWithValue("@productoId", item.ProductId);
                                cmd.Parameters.AddWithValue("@precio", item.Precio);
                                cmd.Parameters.AddWithValue("@cantidad", item.Cantidad);
                                cmd.Parameters.AddWithValue("@subtotal", item.Subtotal);
                                cmd.ExecuteNonQuery();
                            }
                        }

                        tx.Commit();
                        return numero;
                    }
                    catch
                    {
                        tx.Rollback();
                        throw;
                    }
                }
            }
        }
    }
}
