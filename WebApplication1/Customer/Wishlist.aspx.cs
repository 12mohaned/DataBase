using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication1.Customer
{
    public partial class Wishlist : System.Web.UI.Page
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["Website"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
         

        }
        public void SearchProduct(object sender, EventArgs e) {
            string username = Session["User"].ToString();
            string Wishname = WishListProductName.Text;
            string ConnectionString = ConfigurationManager.ConnectionStrings["Website"].ToString();
            SqlConnection conn = new SqlConnection(ConnectionString);
            SqlCommand sqlCommand = new SqlCommand("showWishlistProduct", conn);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.AddWithValue("@customername", username);
            sqlCommand.Parameters.AddWithValue("@name", Wishname);
            conn.Open();
            SqlDataReader ReadProductWishList = sqlCommand.ExecuteReader();
            DataTable Datatb = new DataTable();
            WishListUser.DataSource = ReadProductWishList;
            WishListUser.DataBind();
            try
            {
               
            }
            catch (Exception ex)
            {
                Response.Write("Make sure you enter correct WishList Name product or you have a WishListName " +
                    "Product");
            }

            conn.Close();
        }
        public void RemoveFromWishList(object sender, EventArgs e)
        {
            string username = Session["User"].ToString();
            string WishList = AddWishListName.Text;
            string SerialNo = RemoveSerialFromWishList.Text;
            string ConnectionString = ConfigurationManager.ConnectionStrings["Website"].ToString();

            SqlConnection conn = new SqlConnection(ConnectionString);
            SqlCommand sqlRemoveFromWishList = new SqlCommand("removefromWishlist", conn);
            sqlRemoveFromWishList.CommandType = CommandType.StoredProcedure;

            sqlRemoveFromWishList.Parameters.Add(new SqlParameter("@customername", username));
            sqlRemoveFromWishList.Parameters.Add(new SqlParameter("@wishlistname ", WishList));
            sqlRemoveFromWishList.Parameters.Add(new SqlParameter("@serial  ", SerialNo));


            conn.Open();

            if (SerialNo == "")
            {
                LabelRemoveSerial.Text = "Serial Number Can't be empty";
            }
            if (WishList == "")
            {
                AddWishListName.Text = "wishList Name Can't be empty";
            }
            try
            {
                sqlRemoveFromWishList.ExecuteNonQuery();

            }
            catch (Exception WishListRemoveException) {
                GeneralLabel.Text = "Serial no is not in the wishList or WishList name is not Right";
            }
            conn.Close();
        }

       
    }
}