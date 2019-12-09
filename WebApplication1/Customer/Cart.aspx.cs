using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace WebApplication1.Customer
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = Session["User"].ToString();
            string ConnectionString = ConfigurationManager.ConnectionStrings["Website"].ToString();
            SqlConnection conn = new SqlConnection(ConnectionString);
            SqlCommand sqlCommand = new SqlCommand("viewMyCart", conn);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.AddWithValue("@customer", username);
            conn.Open();
            SqlDataReader ReadProductCart = sqlCommand.ExecuteReader();
            DataTable Datatb = new DataTable();
            TbCart.DataSource = ReadProductCart;
            TbCart.DataBind();
           
            

            conn.Close();
        }
        public void AddtoCart(object sender, EventArgs e)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Website"].ToString();
            SqlConnection conn = new SqlConnection(ConnectionString);
            SqlCommand AddtoCart = new SqlCommand("addToCart", conn);
            AddtoCart.CommandType = CommandType.StoredProcedure;
            string username = Session["User"].ToString();
            string serialno = SerialCartAdd.Text;
            AddtoCart.Parameters.Add(new SqlParameter("@customername", username));
            AddtoCart.Parameters.Add(new SqlParameter("@serial", serialno));
            conn.Open();
            if (serialno == "")
            {
                LabelSerialNumber.Text = "Serial Number Can't be empty";
            }
            try
            {
                AddtoCart.ExecuteNonQuery();
                LabelSerialNumber.Text = "";
            }
            catch (Exception AddtoCartException) {
                GeneralLabel.Text = "";
            }

            conn.Close();
        }
        public void RemoveFromCart(object sender, EventArgs e)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["Website"].ToString();
            SqlConnection conn = new SqlConnection(ConnectionString);
            SqlCommand RemoveFromCart = new SqlCommand("removefromCart", conn);
            RemoveFromCart.CommandType = CommandType.StoredProcedure;
            string username = Session["User"].ToString();
            string serialno = SerialCartRemove.Text;
            RemoveFromCart.Parameters.Add(new SqlParameter("@customername", username));
            RemoveFromCart.Parameters.Add(new SqlParameter("@serial", serialno));
            conn.Open();
            if (serialno == "")
            {
                LabelSerialNumber2.Text = "Serial Number Can't be empty";
            }
            try
            {
                RemoveFromCart.ExecuteNonQuery();
                LabelSerialNumber2.Text = "";
            }
            catch (Exception RemoveFromCartException)
            {
                GeneralLabel2.Text = "";
            }

            conn.Close();
        }
    }
}