using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMSandMasterPage
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            if(e.Exception == null)
            {
                if(e.AffectedRows == 1)
                {
                    LabelItmesMess.Text = "Item was added sucessfully.";

                }
                else
                {
                    LabelItmesMess.Text = "An error occur during insert operation.";
                    e.KeepInInsertMode = true;
                }
            }
            else
            {
                LabelItmesMess.Text = e.Exception.Message;
                e.ExceptionHandled = true;
                e.KeepInInsertMode = true;
            }
        }
    }
}