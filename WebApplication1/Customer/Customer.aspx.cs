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
    public partial class Customer : System.Web.UI.Page
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["Website"].ToString();

       
        protected void Page_Load(object sender, EventArgs e)
        {
        
            SqlConnection conn = new SqlConnection(ConnectionString);
            conn.Open();
            SqlDataAdapter Sl = new SqlDataAdapter("SELECT serial_no,product_name, category, product_description, price, available, vendor_username FROM Product order by price ASC", conn);
            DataTable Datatb = new DataTable();
            Sl.Fill(Datatb);
            TbProducts.DataSource = Datatb;
            TbProducts.DataBind();

            conn.Close();

        }
        public void ContactsGridView_RowCommand(object sender, GridViewCommandEventArgs GridVieww) {
            
            foreach (GridViewRow gr in TbProducts.Rows)
            {
                string cell_1_Value = gr.Cells[0].Text;           
                if (GridVieww.CommandName == "AddtoCart")
                {
                   
                }
            }
        }
        public void AddWishList(object sender, EventArgs e)
        {
            
            Boolean f = false;
            SqlConnection conn = new SqlConnection(ConnectionString);
            SqlCommand sqlCreateWishList = new SqlCommand("createList", conn);
            sqlCreateWishList.CommandType = CommandType.StoredProcedure;
            conn.Open();
            string username = Session["User"].ToString();
            string wishName = WishName.Text;
            sqlCreateWishList.Parameters.Add(new SqlParameter("@customername", username));
            sqlCreateWishList.Parameters.Add(new SqlParameter("@name", wishName));

            if (wishName == "")
            {
                LabelWishName.Text = "Wish Name Can't be Empty !";
            }
            else
            {
                try
                {
                    sqlCreateWishList.ExecuteNonQuery();
                    LabelWishName.Text = "";
                }
                catch (Exception exceptipn) {
                    LabelWishName.Text = "Wish Name Can't be Repeated !";

                }
            }

           conn.Close();
        }
        public void AddCredit(object sender, EventArgs e)
        {
            Boolean validation = true;
            string username = Session["User"].ToString();
            SqlConnection conn = new SqlConnection(ConnectionString);
            SqlCommand AddCreditCard = new SqlCommand("AddCreditCard", conn);
            AddCreditCard.CommandType = CommandType.StoredProcedure;
            
            String CreditCardNumber = CardNumber.Text;
            String Cvv = cvv_code.Text;
            String Date = ExpiryDate.Text;

            AddCreditCard.Parameters.Add(new SqlParameter("@creditcardnumber",CreditCardNumber ));
            AddCreditCard.Parameters.Add(new SqlParameter("@cvv", Cvv));
            AddCreditCard.Parameters.Add(new SqlParameter("@expirydate", Date));
            AddCreditCard.Parameters.Add(new SqlParameter("@customername", username));

            if (CreditCardNumber == "") {
                CardNumberLabel.Text = "Card Number Can't be empty";
                validation = false;
            }
            if (Cvv == "") {
                CvvCodeLabel.Text = "Cvv can't be empty";
                validation = false;
            }
            if (Date == "") {
                ExpiryDateLabel.Text = "Date Can't be Empty";
                validation = false;
            }
            if (validation) {

            }
            conn.Open();
            try
            {
                AddCreditCard.ExecuteNonQuery();
                CustomerNameLabel.Text = "";
                CardNumberLabel.Text = "";
                CvvCodeLabel.Text = "";
                ExpiryDateLabel.Text = "";

            }

            catch (Exception exception) {
                CustomerNameLabel.Text = "Credit Can't be Repeated";
                Response.Write(exception.Message);
            }
            conn.Close();
        }
        public void AddSerialno(object sender, EventArgs e)
        {
            string username = Session["User"].ToString();
            SqlConnection conn = new SqlConnection(ConnectionString);
            SqlCommand AddtoWishList = new SqlCommand("AddtoWishlist ", conn);
            String Serialno = SerialNo.Text;
            String WishName = WishNameProduct.Text;
            if (Serialno == "")
            {
                LabelSerialNo.Text = "Serial No Can't be Empty";
            }
            if (WishName == "")
            {
                LabelWishNameProduct.Text = "WishName Product Can't be Empty";
            }
           
            AddtoWishList.CommandType = CommandType.StoredProcedure;
            AddtoWishList.Parameters.Add(new SqlParameter("@customername", username));
            AddtoWishList.Parameters.Add(new SqlParameter("@wishlistname", WishName));
            AddtoWishList.Parameters.Add(new SqlParameter("@serial", Serialno));
            conn.Open();
            try
            {
                AddtoWishList.ExecuteNonQuery();
            }
            catch (Exception WishListProductException) {
                LabelWishNameProduct.Text = "";
                LabelSerialNo.Text = "";
                GeneralLabel.Text = "Wish List name has to exist or product has to exists";
                Response.Write(WishListProductException.Message);
            }
            GeneralLabel.Text = "";
            conn.Close();
        }
        public void AddCart(object sender, EventArgs e)
        {


        }
    }
}