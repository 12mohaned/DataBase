using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication1
{
    public partial class VendorRegister : System.Web.UI.Page
    {
        protected void Register(object sender, EventArgs e)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(ConnectionString);
            SqlCommand RegisterCMD = new SqlCommand("vendorregister", conn);
            RegisterCMD.CommandType = CommandType.StoredProcedure;
            Boolean validation = true;
            string Username = user.Text;
            string firstname = Password.Text;
            string lastname = LastName.Text;
            string email = Email.Text;
            string password = Password.Text;
            string Comapny = Company_name.Text;
            string bankAccount = BankAccount.Text;

            if (user.Text == "")
            {
                user.BorderColor = System.Drawing.Color.Red;
                LabelUsername.Text = "Username Can't be Empty";
                validation = false;
            }
            else
            {
                user.BorderColor = System.Drawing.Color.Green;
                Username = user.Text;
                LabelUsername.Text = "";

            }

            if (FirstName.Text == "")
            {
                FirstName.BorderColor = System.Drawing.Color.Red;
                LabelFirstname.Text = "Firstname Can't be Empty";
                validation = false;
            }
            else
            {
                FirstName.BorderColor = System.Drawing.Color.Green;
                LabelFirstname.Text = "";
                firstname = FirstName.Text;
            }

            if (LastName.Text == "")
            {
                LastName.BorderColor = System.Drawing.Color.Red;
                LabelLastname.Text = "Last name Cant be Empty";
                validation = false;
            }
            else
            {
                LastName.BorderColor = System.Drawing.Color.Green;
                lastname = LastName.Text;
                LabelLastname.Text = "";
            }

            if (Email.Text == "")
            {

                Email.BorderColor = System.Drawing.Color.Red;
                LabelEmail.Text = "Email Can't be Empty";
                validation = false;
            }
            else
            {
                Email.BorderColor = System.Drawing.Color.Green;
                email = Email.Text;
                LabelEmail.Text = "";
            }

            if (Password.Text != Repeat_Password.Text)
            {
                validation = false;
                Password.BorderColor = System.Drawing.Color.Red;
                Repeat_Password.BorderColor = System.Drawing.Color.Red;
            }
            else
            {
                LabelPassword.Text = "";
            }
            if (Password.Text == "" | Repeat_Password.Text == "")
            {
                validation = false;
                if (Password.Text == "" && Repeat_Password.Text == "")
                {
                    Password.BorderColor = System.Drawing.Color.Red;
                    Repeat_Password.BorderColor = System.Drawing.Color.Red;
                    LabelPassword.Text = "Password Can't be Empty";
                }
                else
                {
                    if (Password.Text == "")
                    {
                        Password.BorderColor = System.Drawing.Color.Red;
                        LabelPassword.Text = "Password Can't be Empty";

                    }
                    else
                    {
                        if (Repeat_Password.Text == "")
                        {
                            LabelPassword.Text = "";
                            Repeat_Password.BorderColor = System.Drawing.Color.Red;
                            Password.BorderColor = System.Drawing.Color.Green;

                        }
                    }
                }

            }
            else
            {
                if (Password.Text != Repeat_Password.Text)
                {
                    validation = false;
                    LabelPassword.Text = "Password should match with each other";

                    Password.BorderColor = System.Drawing.Color.Red;
                    Repeat_Password.BorderColor = System.Drawing.Color.Red;

                }
                else
                {
                    LabelPassword.Text = "";
                    Password.BorderColor = System.Drawing.Color.Green;
                    Repeat_Password.BorderColor = System.Drawing.Color.Green;
                    password = Password.Text;
                }
            }
            if (Company_name.Text == "")
            {
                Company_name.BorderColor = System.Drawing.Color.Red;
                Labelcompany.Text = "Company name Can't be Empty";
                validation = false;
            }
            else {
                Company_name.BorderColor = System.Drawing.Color.Green;
                Labelcompany.Text = "";
            }

            if (BankAccount.Text == "")
            {
                BankAccount.BorderColor = System.Drawing.Color.Red;
                LabelBankAccount.Text = "bank Account can be empty";
            }
            else {
                BankAccount.BorderColor = System.Drawing.Color.Green;
                LabelBankAccount.Text = "";
            }
            if (validation)
            {
                RegisterCMD.Parameters.Add(new SqlParameter("@username", Username));
                RegisterCMD.Parameters.Add(new SqlParameter("@first_name", firstname));
                RegisterCMD.Parameters.Add(new SqlParameter("@last_name", lastname));
                RegisterCMD.Parameters.Add(new SqlParameter("@password", password));
                RegisterCMD.Parameters.Add(new SqlParameter("@email", email));

                conn.Open();
                RegisterCMD.ExecuteNonQuery();
                conn.Close();

            }

        }
    }
}
