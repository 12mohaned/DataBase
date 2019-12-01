using System;
using System.Collections;
using System.Configuration;
using System.Linq;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace Commerce
{

    public partial class Default : System.Web.UI.Page
    {
        public void Register(object sender, EventArgs args)
        {
            if (username.Text == "")
            {
                username.BorderColor = System.Drawing.Color.Red;
                LabelUsername.Text = "Username Can't be Empty";
            }
            else
            {
                username.BorderColor = System.Drawing.Color.Green;

                LabelUsername.Text = "";
            }

            if (FirstName.Text == "")
            {
                FirstName.BorderColor = System.Drawing.Color.Red;
                LabelFirstname.Text = "Firstname Can't be Empty";
            }
            else
            {
                FirstName.BorderColor = System.Drawing.Color.Green;
                LabelFirstname.Text = "";
            }

            if (LastName.Text == "")
            {
                LastName.BorderColor = System.Drawing.Color.Red;
                LabelLastname.Text = "Last name Cant be Empty";
            }
            else
            {
                LastName.BorderColor = System.Drawing.Color.Green;

                LabelLastname.Text = "";
            }

            if (Email.Text == "")
            {

                Email.BorderColor = System.Drawing.Color.Red;
                LabelEmail.Text = "Email Can't be Empty";

            }
            else
            {
                Email.BorderColor = System.Drawing.Color.Green;

                LabelEmail.Text = "";
            }
            if (Password.Text != Repeat_Password.Text)
            {
                Password.BorderColor = System.Drawing.Color.Red;
                Repeat_Password.BorderColor = System.Drawing.Color.Red;
            }
            else
            {
                LabelPassword.Text = "";
            }
            if (Password.Text == "" | Repeat_Password.Text == "")
            {
                if (Password.Text == "" && Repeat_Password.Text == "")
                {
                    Password.BorderColor = System.Drawing.Color.Red;
                    Repeat_Password.BorderColor = System.Drawing.Color.Red;

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
                        LabelPassword.Text = "";
                        Repeat_Password.BorderColor = System.Drawing.Color.Red;
                        Password.BorderColor = System.Drawing.Color.Green;
                    }
                }

            }
            else
            {
                if (Password.Text != Repeat_Password.Text)
                {
                    LabelPassword.Text = "Password should match with each other";
                    Password.BorderColor = System.Drawing.Color.Red;
                    Repeat_Password.BorderColor = System.Drawing.Color.Red;

                }
                else
                {
                    LabelPassword.Text = "";
                    Password.BorderColor = System.Drawing.Color.Green;
                    Repeat_Password.BorderColor = System.Drawing.Color.Green;
                }
            }



        }
    }
}
