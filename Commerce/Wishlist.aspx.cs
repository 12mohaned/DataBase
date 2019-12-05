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
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void AddWishList(object sender, EventArgs e)
        {
            Boolean f = false;
            string ConnectionString = ConfigurationManager.ConnectionStrings["Website"].ToString();
            SqlConnection conn = new SqlConnection(ConnectionString);
            SqlCommand sqlCreateWishList = new SqlCommand("createList", conn);
            SqlCommand sqlCheckWishList = new SqlCommand("CheckWishList", conn);

            sqlCreateWishList.CommandType = CommandType.StoredProcedure;
            sqlCheckWishList.CommandType = CommandType.StoredProcedure;
            string username = Username.Text;
            string wishName = WishName.Text;
            sqlCreateWishList.Parameters.Add(new SqlParameter("@customername", username));
            sqlCreateWishList.Parameters.Add(new SqlParameter("@name", wishName));

            sqlCheckWishList.Parameters.Add(new SqlParameter("@Username",username));
            sqlCheckWishList.Parameters.Add(new SqlParameter("@WishName", wishName));

            conn.Open();


            SqlDataReader rd = sqlCheckWishList.ExecuteReader();
           
            if (wishName == "")
            {
                LabelWishName.Text = "Wish Name Can't be Empty !";
            }
            else
            {
                while (rd.Read())
                {
                    if (rd[0] == wishName)
                    {
                        f = true;
                        break;
                    }
                }
                rd.Close();
                if (f)
                {
                   
                    LabelWishName.Text = "Wish Name Can't be Repeated!";

                }
                else
                {
                    
                    DataTable WishListTable = new DataTable("WishList");
                    WishListTable.Columns.Add("UserName", typeof(String));
                    WishListTable.Columns.Add("WishListName", typeof(String));
                    DataRow row = WishListTable.NewRow();
                    row["UserName"] = Username.Text;
                    row["WishListName"] = WishName.Text;
                    WishListUser.DataSource = WishListTable;
                    WishListUser.DataBind();
                    sqlCreateWishList.ExecuteNonQuery();
                }
            }
            conn.Close();
        }
    }
}
