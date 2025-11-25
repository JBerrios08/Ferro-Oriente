using System;
using System.Web;
using Ferro_Oriente.Services;

namespace Ferro_Oriente
{
    public class Global : HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            try
            {
                Database.EnsureAdminUser();
            }
            catch
            {
                // La inicialización de usuario admin es best-effort para no bloquear la aplicación.
            }
        }
    }
}
