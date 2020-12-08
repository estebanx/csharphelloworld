using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;

namespace CsharpHelloWorld.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;

        public string HostName { get; set; }
        public string Ip { get; set; }

        public IndexModel(ILogger<IndexModel> logger)
        {
            _logger = logger;
        }

        public void OnGet()
        {
            this.HostName = Dns.GetHostName();
            var ipaddress = Dns.GetHostAddresses(HostName).Where(f => f.AddressFamily == System.Net.Sockets.AddressFamily.InterNetwork);
            this.Ip = ipaddress.FirstOrDefault().ToString();
        }
    }
}
