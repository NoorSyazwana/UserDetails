using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace UserDetails
{
    public partial class CreateUser : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["ConnectiongString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                lblInfo.Text = string.Empty;
                lblInfo.Visible= false;
                txtUsername.Text = string.Empty;
                txtUserNo.Text = string.Empty;
            }
        }

        protected void btnCreateUser_Click(object sender, EventArgs e)
        {
            //Update User Details to database
            string strSQL = "EXEC .dbo.InsertUsers @UserName,@UserNo";
            using (SqlConnection connection = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(strSQL, connection))
                {
                    cmd.Parameters.AddWithValue("@UserName",txtUsername.Text);
                    cmd.Parameters.AddWithValue("@UserNo", txtUserNo.Text);
                    cmd.Connection = connection;
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
            }

            lblInfo.Visible = true;
            lblInfo.Text = "Successfully add user record.";
            txtUsername.Text = string.Empty;
            txtUserNo.Text = string.Empty;

        }
    }
}