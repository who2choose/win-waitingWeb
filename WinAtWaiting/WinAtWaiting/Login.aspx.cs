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
    public partial class login2 : System.Web.UI.Page
    {
        static string server = "10.238.56.195",
        user = "account",
        password = "password",
        database = "waiting";
        MySql.Data.MySqlClient.MySqlConnection msqlConnection;

        protected void Page_Load(object sender, EventArgs e)
        {
            form_error.Visible = false;
            text_email_error.Visible = false;
            form_register.Visible = ((Boolean)(Session["regVis"] ?? false));
            form_login.Visible = ((Boolean)(Session["loginVis"] ?? true));

            msqlConnection = new MySqlConnection(GetConnectionString());
            try { msqlConnection.Open(); }
            catch (MySqlException)
            {
                form_login.Visible = false;
                form_error.Visible = true;
            }
        }

        //begin button calls from aspx
        protected void buttonLogin(object sender, EventArgs e)
        {
            string command = string.Format("SELECT user_id, name_first, name_last FROM user WHERE (email='{0}' AND password='{1}')", text_email.Value.ToString(), text_password.Value.ToString());
            DataTable dataTable = loadData(command);
            if (dataTable.Rows.Count == 0)
            {
                text_email_error.Visible = true;
            }
            else
            {
                Session["user_id"] = dataTable.Rows[0]["user_id"];
                Session["firstname"] = dataTable.Rows[0]["name_first"];
                Session["lastname"] = dataTable.Rows[0]["name_last"];
                msqlConnection.Close();
                Response.Redirect("main.aspx");
            }
        }

        protected void buttonLoginPage(object sender, EventArgs e)
        {
            Session["regVis"] = false;
            form_register.Visible = (Boolean)Session["regVis"];
            Session["loginVis"] = true;
            form_login.Visible = (Boolean)Session["loginVis"];
        }

        protected void buttonRegisterPage(object sender, EventArgs e)
        {
            Session["loginVis"] = false;
            form_login.Visible = (Boolean)Session["loginVis"];
            Session["regVis"] = true;
            form_register.Visible = (Boolean)Session["regVis"];
        }

        char[] invalidcharacters = new char[] { '\'', '\"', '(', ')', '<', '>', '\\', '/' };

        protected void buttonRegister(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(text_reg_email.Value.ToString()) || string.IsNullOrEmpty(text_reg_fname.Value.ToString()) || string.IsNullOrEmpty(text_reg_lname.Value.ToString()) || string.IsNullOrEmpty(text_reg_pass.Value.ToString()))
                {
                    text_reg_error.InnerText = "Please fill out all of the above information";
                    text_reg_error.Visible = true;
                }
                else if (string.IsNullOrEmpty(text_reg_pass.Value.ToString()) || string.IsNullOrEmpty(text_reg_conpass.Value.ToString()) || !(text_reg_pass.Value.ToString()).Equals(text_reg_conpass.Value.ToString()))
                {
                    text_reg_error.InnerText = "Please make sure passwords match";
                    text_reg_error.Visible = true;
                }
                else if ((text_reg_email.Value.ToString().IndexOfAny(invalidcharacters) != -1) || (text_reg_fname.Value.ToString().IndexOfAny(invalidcharacters) != -1) || (text_reg_lname.Value.ToString().IndexOfAny(invalidcharacters) != -1) || (text_reg_pass.Value.ToString().IndexOfAny(invalidcharacters) != -1))
                {
                    text_reg_error.InnerText = "Invalid Characters Users. Please Try Again";
                    text_reg_error.Visible = true;
                }
                else
                {
                    string command = string.Format("SELECT email FROM user WHERE (email='{0}')", text_reg_email.Value.ToString());
                    DataTable dataTable = loadData(command);
                    if (dataTable.Rows.Count == 0)
                    {
                        try
                        {
                            //create user
                            command = string.Format("INSERT INTO user VALUES (null, '{0}', '{1}', '{2}', '{3}')",
                                text_reg_fname.Value.ToString(), text_reg_lname.Value.ToString(), text_reg_email.Value.ToString(), text_reg_pass.Value.ToString());
                            exacuteCommand(command);
                            Session["loginVis"] = true;
                            form_login.Visible = (Boolean)Session["loginVis"];
                            Session["regVis"] = false;
                            form_register.Visible = (Boolean)Session["regVis"];
                        }
                        catch (Exception)
                        {
                            text_reg_error.InnerText = "Invalid Characters Users. Please Try Again";
                            text_reg_error.Visible = true;
                        }
                    }
                    else
                    {
                        text_reg_error.InnerText = "Email already in use";
                        text_reg_error.Visible = true;
                    }
                }
            }
            catch (Exception)
            {
                text_reg_error.InnerText = "Invalid Characters Users. Please Try Again";
                text_reg_error.Visible = true;
            }
        }

        //begin database management
        private static string GetConnectionString()
        {
            return String.Format("server={0}; user id={1}; password={2}; database={3}; pooling=false", server, user, password, database);
        }

        private DataTable loadData(string commandString)
        {
            MySqlDataReader msqlReader = createReader(commandString);
            DataTable dataTable = new DataTable();
            dataTable.Load(msqlReader);
            msqlReader.Close();
            return dataTable;
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
    }
}