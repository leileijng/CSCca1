using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Task_4.Startup))]
namespace Task_4
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
