using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMSandMasterPage
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DetailsView2_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            if (e.Exception == null)
            {
                if (e.AffectedRows == 1)
                {
                    LabelJokesMess.Text = "Jokes was added sucessfully.";

                }
                else
                {
                    LabelJokesMess.Text = "An error occur during insert operation.";
                    e.KeepInInsertMode = true;
                }
            }
            else
            {
                LabelJokesMess.Text = e.Exception.Message;
                e.ExceptionHandled = true;
                e.KeepInInsertMode = true;
            }
        }
    
    }
}