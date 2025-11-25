using System;
using Ferro_Oriente.Models;
using MySql.Data.MySqlClient;

namespace Ferro_Oriente.Services
{
    public class AuthService
    {
        public bool Register(string nombre, string correo, string password, out string message)
        {
            message = string.Empty;
            try
            {
                using (var conn = Database.GetConnection())
                {
                    conn.Open();
                    const string sql = @"INSERT INTO usuarios (nombre, correo, password_hash, rol, estado) 
VALUES (@nombre, @correo, @hash, 'Usuario', 1);";
                    using (var cmd = new MySqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@nombre", nombre);
                        cmd.Parameters.AddWithValue("@correo", correo);
                        cmd.Parameters.AddWithValue("@hash", Database.HashPassword(password));
                        cmd.ExecuteNonQuery();
                        return true;
                    }
                }
            }
            catch (MySqlException ex)
            {
                if (ex.Number == 1062)
                {
                    message = "Ya existe un usuario con ese correo.";
                }
                else
                {
                    message = "Error al registrar: " + ex.Message;
                }
            }
            catch (Exception ex)
            {
                message = "Error inesperado: " + ex.Message;
            }

            return false;
        }

        public bool TryLogin(string correo, string password, out UserInfo user, out string message)
        {
            user = null;
            message = string.Empty;
            using (var conn = Database.GetConnection())
            {
                conn.Open();
                const string sql = @"SELECT id, nombre, correo, rol, estado, password_hash, fecha_registro 
FROM usuarios WHERE correo = @correo LIMIT 1";
                using (var cmd = new MySqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@correo", correo);
                    using (var reader = cmd.ExecuteReader())
                    {
                        if (!reader.Read())
                        {
                            message = "Correo o contraseña inválida.";
                            return false;
                        }

                        var hash = reader.GetString("password_hash");
                        if (!string.Equals(hash, Database.HashPassword(password), StringComparison.Ordinal))
                        {
                            message = "Correo o contraseña inválida.";
                            return false;
                        }

                        var active = reader.GetBoolean("estado");
                        if (!active)
                        {
                            message = "La cuenta está desactivada.";
                            return false;
                        }

                        user = new UserInfo
                        {
                            Id = reader.GetInt32("id"),
                            Nombre = reader.GetString("nombre"),
                            Correo = reader.GetString("correo"),
                            Rol = reader.GetString("rol"),
                            Activo = active,
                            FechaRegistro = reader.GetDateTime("fecha_registro")
                        };
                        return true;
                    }
                }
            }
        }
    }
}
