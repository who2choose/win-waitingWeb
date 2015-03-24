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
    public partial class main1 : System.Web.UI.Page
    {
        static string server = "10.238.56.195",
        user = "account",
        password = "password",
        database = "waiting";
        MySql.Data.MySqlClient.MySqlConnection msqlConnection;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
                Response.Redirect("Login.aspx");

            msqlConnection = new MySqlConnection(GetConnectionString());
            try
            {
                msqlConnection.Open();
                loadTaskTiles();
                loadTodoList();
            }
            catch (MySqlException) { }

            banner_welcome_message.InnerText = string.Format("Welcome {0} {1}", ((Session["firstname"] ?? "").ToString()), ((Session["lastname"] ?? "").ToString()));
        }

        private void loadTaskTiles()
        {
            thisistomod.InnerHtml = "";
            DataTable tasks = loadDatabaseIntoTable(string.Format("SELECT name, duration, priority, privacy, description FROM tasks WHERE user_id={0}", Session["user_id"]));
            foreach (DataRow row in tasks.Rows)
            {
                string name = row["name"].ToString();
                string dur = row["duration"].ToString();
                string prio = row["priority"].ToString();
                string priv = ((row["privacy"].ToString().Equals("0")) ? "private" : "public");
                string des = row["description"].ToString();
                thisistomod.InnerHtml += dothedivthing(name, dur, priv, prio, des);
            }
        }

        private void loadTodoList()
        {
            DataTable todolist = loadDatabaseIntoTable(string.Format("SELECT * FROM todo WHERE user_id={0}", Session["user_id"]));
            if (todolist.Rows.Count == 0)
            {
                string command = string.Format("INSERT INTO todo VALUES ({0}, '', '', '', '', '')", Session["user_id"].ToString());
                exacuteCommand(command);
                loadTodoList();
            }
            else
            {
                todolist_textarea1.Value = todolist.Rows[0]["text1"].ToString();
                todolist_textarea2.Value = todolist.Rows[0]["text2"].ToString();
                todolist_textarea3.Value = todolist.Rows[0]["text3"].ToString();
                todolist_textarea4.Value = todolist.Rows[0]["text4"].ToString();
                todolist_textarea5.Value = todolist.Rows[0]["text5"].ToString();
            }
        }

        private string dothedivthing(string taskname, string taskduration, string taskprivacy, string taskpriority, string taskdescription)
        {
            return string.Format("<div class=\"pricing-grid\"><div class=\"basic-plan\"><h3>{0}</h3><p></p></div><ul><li>{1} minutes</li><li>priority {3}</li><li>{2}</li><li>{4}</li></ul><div class=\"sign-up\"><a runat=\"server\"  onserverclick=\"buttonDeleteTask\" class=\"hvr-sweep-to-right button\">Delete</a></div></div>", taskname, taskduration, taskprivacy, taskpriority, taskdescription);
        }

        //begin button calls
        protected void buttonDeleteTask(object sender, EventArgs e) 
        {

        }

        char[] invalidcharacters = new char[] { '\'', '\"', '(', ')', '<', '>', '\\', '/' };
        protected void buttonSaveTodo(object sender, EventArgs e)
        {
            string t1 = (todolist_textarea1.Value.ToString());//.Trim(invalidcharacters);
            string t2 = (todolist_textarea2.Value);//.Trim(invalidcharacters);
            string t3 = (todolist_textarea3.Value);//.Trim(invalidcharacters);
            string t4 = (todolist_textarea4.Value);//.Trim(invalidcharacters);
            string t5 = (todolist_textarea5.Value.ToString());//.Trim(invalidcharacters);
            string command = string.Format("UPDATE todo SET text1='{0}', text2='{1}', text3='{2}', text4='{3}', text5='{4}' WHERE user_id={5}", t1, t2, t3, t4, t5, Session["user_id"].ToString());
            exacuteCommand(command);
        }

        protected void buttonAddTask(object sender, EventArgs e)
        {
            string command = string.Format("INSERT INTO {0} VALUES ('{1}', {2}, {3}, {4}, {5}, '{6}')", "tasks", addtask_name.Value.ToString(), Session["user_id"].ToString(), addtask_duration.SelectedItem.ToString(), addtask_priority.SelectedItem.ToString(), (addtask_privacy.Checked ? 0 : 1), addtask_description.Value.ToString());
            exacuteCommand(command);
            Page_Load(sender, e);
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

        private DataTable loadDatabaseIntoTable(string commandString)
        {
            MySqlDataReader msqlReader = createReader(commandString);
            DataTable dataTable = new DataTable();
            dataTable.Load(msqlReader);
            msqlReader.Close();
            return dataTable;
        }
    }
}