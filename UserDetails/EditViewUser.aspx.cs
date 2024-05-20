using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserDetails
{
    public partial class EditViewUser : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["ConnectiongString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                updateGrid();
            }
        }

        private void updateGrid(string sorting = null)
        {
            string strSQL = "EXEC .dbo.SelectUsers";
            using (SqlConnection connection = new SqlConnection(constr))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(strSQL,connection))
                {
                    using (DataTable dt = new DataTable())
                    {
                        da.Fill(dt);
                        if (sorting != null)
                        {
                            DataView strDataView = dt.AsDataView();
                            this.SortDirection  = this.SortDirection == "ASC" ? "DESC" : "ASC";
                            strDataView.Sort = sorting + " " + this.SortDirection;
                            grdUser.DataSource = strDataView;
                        }
                        else
                        {
                            grdUser.DataSource = dt;
                        }
                        grdUser.DataBind();
                    }
                }
            }

        }

        protected void grdUser_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdUser.EditIndex = -1;
            updateGrid();
        }

        protected void grdUser_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != grdUser.EditIndex)
            {
                (e.Row.Cells[4].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this record?');";
            }
        }

        protected void grdUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int userID = Convert.ToInt32(grdUser.DataKeys[e.RowIndex].Values[0]);
            string strSQL = "EXEC .dbo.DeleteUsers @UserID";
            using (SqlConnection connection = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(strSQL, connection))
                {
                    cmd.Parameters.AddWithValue("@UserID", userID);
                    cmd.Connection = connection;
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
            }

            updateGrid();
        }

        protected void grdUser_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = grdUser.Rows[e.RowIndex];
            int userID = Convert.ToInt32(grdUser.DataKeys[e.RowIndex].Values[0]);
            string strUsername = (row.FindControl("txtUserName") as TextBox).Text;
            string strUserNo = (row.FindControl("txtUserNo") as TextBox).Text;

            string strSQL = "EXEC .dbo.UpdateUsers @UserID,@UserName,@UserNo";
            using (SqlConnection connection = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(strSQL, connection))
                {
                    cmd.Parameters.AddWithValue("@UserID", userID);
                    cmd.Parameters.AddWithValue("@UserName", strUsername);
                    cmd.Parameters.AddWithValue("@UserNo", strUserNo);
                    cmd.Connection = connection;
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
            }

            grdUser.EditIndex = -1;
            updateGrid();
        }

        protected void grdUser_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdUser.EditIndex = e.NewEditIndex;
            updateGrid();
        }

        protected void grdUser_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdUser.PageIndex = e.NewPageIndex;
            updateGrid();
        }

        private string SortDirection
        {
            get { return ViewState["SortDirection"] != null ? ViewState["SortDirection"].ToString() : "ASC"; }
            set { ViewState["SortDirection"] = value; }
        }

        protected void grdUser_Sorting(object sender, GridViewSortEventArgs e)
        {
            updateGrid(e.SortExpression);
        }
    }
}