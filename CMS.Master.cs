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
    public partial class CMS : System.Web.UI.MasterPage
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
                SetUpPage();
            }

        }
        private void SetUpPage()
        {
            if (userlvl == 1)
            {
                ShowMainData();
            }
            else
            {
                Response.Redirect("NotLogin.aspx");
            }
        }

        public void ShowMainData()
        {
            sqlstring = "SELECT* FROM MasterTable WHERE MasterTable.Id = 200";
            try
            {
                conn.Open();
                cmd = new SqlCommand(sqlstring, conn);
                rdr = cmd.ExecuteReader();
                rdr.Read();
                HeaderTitle.InnerText = (string)rdr.GetValue(2);
                Logo.ImageUrl = "~/images/" +(string)rdr.GetValue(1) + ".png";
                LogoFooter.ImageUrl = "~/images/" +(string)rdr.GetValue(1) + ".png";
                author.InnerText = (string)rdr.GetValue(3);
                contact.InnerText = "+45 " +Convert.ToString((int)rdr.GetValue(4));
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

        protected void ButtonLogout_Click(object sender, EventArgs e)
        {
            userlvl = 0;
            Session["mylevel"] = userlvl;
            Response.Redirect("ContentDisplay.aspx");
        }
    }
}