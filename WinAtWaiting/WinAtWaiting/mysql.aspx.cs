using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

namespace WinAtWaiting
{
    public partial class mysql1 : System.Web.UI.Page
    {
        static string server = "10.238.56.195",
        user = "account",
        password = "password",
        database = "waiting";

        MySql.Data.MySqlClient.MySqlConnection msqlConnection;

        protected void Page_Load(object sender, EventArgs e)
        {
            lastentered.Text = (Session["command"] ?? "").ToString();
            msqlConnection = new MySqlConnection(GetConnectionString());
            if (msqlConnection.State != ConnectionState.Open)
            {
                try
                {
                    msqlConnection.Open();
                    if ((Session["command"] ?? "").ToString().Contains("SELECT"))
                        loadDatabaseIntoTable(Session["command"].ToString(), gridview);
                    else
                        loadDatabaseIntoTable(("SELECT * FROM " + ddlselect.SelectedItem.ToString()), gridview);
                }
                catch (MySqlException exception)
                {
                    throw (exception);
                }
            }
        }

        private static string GetConnectionString()
        {
            return String.Format("server={0}; user id={1}; password={2}; database={3}; pooling=false", server, user, password, database);
        }

        private void loadDatabaseIntoTable(string commandString, GridView gv)
        {
            MySqlDataReader msqlReader = createReader(commandString);
            DataTable dataTable = new DataTable();
            dataTable.Load(msqlReader);
            gv.DataSource = dataTable;
            gv.DataBind();
            msqlReader.Close();
        }

        private MySqlDataReader createReader(string commandString)
        {
            MySqlCommand msqlCommand = new MySqlCommand(commandString, msqlConnection);
            msqlCommand.CommandType = CommandType.Text;
            return msqlCommand.ExecuteReader();
        }

        protected void exacuteCommand(string command)
        {
            Session["command"] = command;
            MySqlCommand msqlCommand = new MySqlCommand(command, msqlConnection);
            msqlCommand.CommandType = CommandType.Text;
            try
            {
                msqlCommand.ExecuteNonQuery();
            }
            catch (Exception) { }
        }

        protected void buttonselect(object sender, EventArgs e)
        {
            string command = string.Format("SELECT {0} FROM {1}", tbxselect.Text, ddlselect.SelectedValue);
            exacuteCommand(command);
            Response.Redirect("mysql.aspx");
        }

        protected void buttoncommand(object sender, EventArgs e)
        {
            exacuteCommand(input_input.Text);
            Response.Redirect("mysql.aspx");
        }

        protected void buttonupdate(object sender, EventArgs e)
        {
            string command = string.Format("UPDATE {0} SET {1} WHERE {2}", ddlupdate.SelectedValue, tbxupdate1.Text, tbxupdate2.Text);
            exacuteCommand(command);
            Response.Redirect("mysql.aspx");
        }

        protected void buttoninsert(object sender, EventArgs e)
        {
            string command = string.Format("INSERT INTO {0} VALUES {1}", ddlinsert.SelectedValue, tbxinsert.Text);
            exacuteCommand(command);
            Response.Redirect("mysql.aspx");
        }

        protected void buttondelete(object sender, EventArgs e)
        {
            string command = string.Format("DELETE FROM {0} WHERE {1}", ddldelete.SelectedValue, tbxdelete.Text);
            exacuteCommand(command);
            Response.Redirect("mysql.aspx");
        }
    }
}