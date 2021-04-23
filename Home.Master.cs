using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

namespace CMSandMasterPage
{
    public partial class Home : System.Web.UI.MasterPage
    {
        SqlConnection conn = new SqlConnection(@"data source = localhost; integrated security = true; database = CMSDB");
        SqlCommand cmd = null;
        SqlDataReader rdr = null;
        string sqlstring = "";
        int userlvl;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                userlvl = (int)Session["mylevel"];
            }
            catch (NullReferenceException nre)
            {
                userlvl = 0;
                Session["mylevel"] = userlvl;
            }
            finally
            {
                TextBoxPass.TextMode = TextBoxMode.Password;
                SetUpPage();
            }
            ShowMainData();

        }

        public void ShowMainData()
        {
            sqlstring = "SELECT * FROM MasterTable WHERE MasterTable.Id = 200";
            try
            {
                conn.Open();
                cmd = new SqlCommand(sqlstring, conn);
                rdr = cmd.ExecuteReader();
                rdr.Read();
                HeaderTitle.InnerText = (string)rdr.GetValue(2);
                Logo.ImageUrl = "~/images/" + (string)rdr.GetValue(1) + ".png";
                LogoFooter.ImageUrl = "~/images/" + (string)rdr.GetValue(1) + ".png";
                author.InnerText = (string)rdr.GetValue(3);
                contact.InnerText = "+45 " + Convert.ToString((int)rdr.GetValue(4));


            }
            catch (Exception ex)
            {
                Labelmessage.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }

        private void SetUpPage()
        {
            if (userlvl == 1)
            {
                Response.Redirect("Items.aspx");
            }
          
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            divLogin.Attributes.CssStyle.Add("display", "block");
        }

        protected void ButtonSignin_Click(object sender, EventArgs e)
        {
            sqlstring = "Select Password FROM MasterTable WHERE Id = 200";

            try
            {
                conn.Open();
                cmd = new SqlCommand(sqlstring, conn);
                object pass = cmd.ExecuteScalar();
                if(TextBoxPass.Text == pass.ToString())
                {
                    userlvl = 1;
                }
                else
                {
                    LabelLoginMess.Text = "Password is not correct";
                }
                
                Session["mylevel"] = userlvl;
                TextBoxPass.Text = string.Empty;
                SetUpPage();

            }
            catch (Exception ex)
            {
                LabelLoginMess.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            divLogin.Attributes.CssStyle.Add("display", "none");

        }
    }
}