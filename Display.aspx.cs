using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMSandMasterPage
{
    public partial class Display : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DetailsView3_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            if (e.Exception == null)
            {
                if (e.AffectedRows == 1)
                {
                    LabelDisplay.Text = "Item was added sucessfully.";

                }
                else
                {
                    LabelDisplay.Text = "An error occur during insert operation.";
                    e.KeepInInsertMode = true;
                }
            }
            else
            {
                LabelDisplay.Text = e.Exception.Message;
                e.ExceptionHandled = true;
                e.KeepInInsertMode = true;
            }
        
        }
    }
}