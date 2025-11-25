using System;
using Ferro_Oriente.Services;
using Ferro_Oriente.Models;

namespace Ferro_Oriente
{
    public partial class Login : System.Web.UI.Page
    {
        private readonly AuthService _authService = new AuthService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Database.EnsureAdminUser();
                if (Session["UserId"] != null)
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (_authService.TryLogin(txtCorreoLogin.Text.Trim(), txtPassword.Text.Trim(), out UserInfo user, out string message))
            {
                Session["UserId"] = user.Id;
                Session["UserName"] = user.Nombre;
                Session["UserEmail"] = user.Correo;
                Session["UserRole"] = user.Rol;
                Response.Redirect("Default.aspx");
            }
            else
            {
                ShowMessage(message, true);
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            var nombre = txtNombre.Text.Trim();
            var correo = txtCorreoRegistro.Text.Trim();
            var password = txtPasswordRegistro.Text.Trim();
            if (string.IsNullOrWhiteSpace(nombre) || string.IsNullOrWhiteSpace(correo) || string.IsNullOrWhiteSpace(password))
            {
                ShowMessage("Completa todos los campos para registrarte.", true);
                return;
            }

            if (_authService.Register(nombre, correo, password, out string message))
            {
                ShowMessage("Cuenta creada. Ahora puedes iniciar sesión.", false);
                txtNombre.Text = string.Empty;
                txtCorreoRegistro.Text = string.Empty;
                txtPasswordRegistro.Text = string.Empty;
            }
            else
            {
                ShowMessage(message, true);
            }
        }

        private void ShowMessage(string text, bool isError)
        {
            lblMensaje.Text = text;
            lblMensaje.CssClass = "alert mt-2 " + (isError ? "alert-danger" : "alert-success");
        }
    }
}
