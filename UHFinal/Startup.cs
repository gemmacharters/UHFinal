using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(UHFinal.Startup))]
namespace UHFinal
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
