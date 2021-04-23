using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMSandMasterPage
{
    public partial class NotLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContentDisplay.aspx");
        }
    }
}