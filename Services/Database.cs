using System;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;
using Ferro_Oriente.Models;
using MySql.Data.MySqlClient;

namespace Ferro_Oriente.Services
{
    public static class Database
    {
        public static MySqlConnection GetConnection()
        {
            var connStr = ConfigurationManager.ConnectionStrings["MySqlConn"]?.ConnectionString;
            if (string.IsNullOrWhiteSpace(connStr))
            {
                throw new InvalidOperationException("No se encontró la cadena de conexión MySqlConn en Web.config.");
            }

            return new MySqlConnection(connStr);
        }

        public static string HashPassword(string password)
        {
            using (var sha = SHA256.Create())
            {
                var bytes = Encoding.UTF8.GetBytes(password);
                var hash = sha.ComputeHash(bytes);
                return Convert.ToBase64String(hash);
            }
        }

        public static void EnsureAdminUser()
        {
            var correo = ConfigurationManager.AppSettings["AdminSeedEmail"];
            var password = ConfigurationManager.AppSettings["AdminSeedPassword"];
            if (string.IsNullOrWhiteSpace(correo) || string.IsNullOrWhiteSpace(password))
            {
                return;
            }

            using (var conn = GetConnection())
            {
                conn.Open();
                const string existsSql = "SELECT COUNT(*) FROM usuarios WHERE correo = @correo";
                using (var cmd = new MySqlCommand(existsSql, conn))
                {
                    cmd.Parameters.AddWithValue("@correo", correo);
                    var count = Convert.ToInt32(cmd.ExecuteScalar());
                    if (count > 0)
                    {
                        return;
                    }
                }

                const string insertSql = @"INSERT INTO usuarios (nombre, correo, password_hash, rol, estado) 
VALUES (@nombre, @correo, @hash, 'Administrador', 1);";
                using (var cmd = new MySqlCommand(insertSql, conn))
                {
                    cmd.Parameters.AddWithValue("@nombre", "Administrador Inicial");
                    cmd.Parameters.AddWithValue("@correo", correo);
                    cmd.Parameters.AddWithValue("@hash", HashPassword(password));
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}
