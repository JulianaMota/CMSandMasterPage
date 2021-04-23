using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMSandMasterPage
{
    public partial class PicturesUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload.HasFile)
            {
                if(TextBoxFileName.Text != "")
                {
                    if(TextBoxFileName.Text.Substring(0,1) != " ")
                    {
                        FileUpload.SaveAs(Server.MapPath("~/images/") + TextBoxFileName.Text);
                        TextBoxFileName.Text = "";
                        LabelMessage.Text = "Sucess Uplaod : "+ FileUpload.PostedFile.FileName + "; " + FileUpload.PostedFile.ContentLength.ToString() + "; " + FileUpload.PostedFile.ContentType;
                    }
                    else
                    {
                        LabelMessage.Text = "Initial space not alloed";
                        TextBoxFileName.Text = "";
                    }
                }
                else
                {
                    LabelMessage.Text = "New file name is missing";
                    TextBoxFileName.Text = "";

                }

            }
            else
            {
                LabelMessage.Text = "File selection missing";
                TextBoxFileName.Text = "";
            }
        }
    }
}