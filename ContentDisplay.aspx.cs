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

    public partial class ContentDisplay : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(@"data source = localhost; integrated security = true; database = CMSDB");
        SqlCommand cmd = null;
        SqlDataReader rdr = null;
        string sqlstringHeaderItem = "";
        string sqlstringSecundaryItems = "";
        string sqlstringJoke = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            ShowDisplay();
        }

        public void ShowDisplay()
        {
            sqlstringHeaderItem = "Select Headline, Description, Picture, PictureCaption FROM ItemS, DisplaySelection WHERE Items.ItemId = DisplaySelection.HearderItemID AND DisplaySelection.Id = 2000";
            sqlstringSecundaryItems = "Select Headline, Description, Picture, PictureCaption FROM ItemS, SecondSectionItems WHERE Items.ItemId = SecondSectionItems.ItemID AND SecondSectionItems.SelectionID = 2000";
            sqlstringJoke = "Select JokeQuestion, JokeImage, JokeAnswer, ImageCaption FROM Jokes, DisplaySelection WHERE Jokes.JokeId = DisplaySelection.JokeID AND DisplaySelection.Id = 2000";
            try
            {
                conn.Open();
                cmd = new SqlCommand(sqlstringHeaderItem, conn);
                rdr = cmd.ExecuteReader();
                RepeaterHeaderItem.DataSource = rdr;
                RepeaterHeaderItem.DataBind();
                conn.Close();
                conn.Open();
                cmd = new SqlCommand(sqlstringSecundaryItems, conn);
                rdr = cmd.ExecuteReader();
                RepeaterSeundaryItems.DataSource = rdr;
                RepeaterSeundaryItems.DataBind();
                conn.Close();
                conn.Open();
                cmd = new SqlCommand(sqlstringJoke, conn);
                rdr = cmd.ExecuteReader();
                RepeaterJoke.DataSource = rdr;
                RepeaterJoke.DataBind();
                conn.Close();


            }
            catch (Exception ex)
            {
                LabelMessageHeader.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }
    }
}