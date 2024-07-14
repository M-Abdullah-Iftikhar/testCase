using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System;
using System.IO;
using System.Text.RegularExpressions;

namespace DBMidProject
{
    public partial class Form1 : Form
    {
        


        public Form1()
        {
            InitializeComponent();

        }


        void LoadCSV()
        {
            string filePath = "projectData.csv";

            if (!File.Exists(filePath))
            {
                Console.WriteLine("File not found: " + filePath);
                return;
            }

            using (StreamReader reader = new StreamReader(filePath))
            {
                int a = 0;
                while (!reader.EndOfStream)
                {
                    string line = reader.ReadLine();

                    string[] fields = line.Split(',');
                    foreach (string field in fields)
                    {
                        Console.WriteLine($"{field}");
                    }
                    if (a > 0)
                    {
                        if (fields[8] != null && fields[8] != "")
                        {
                            Console.WriteLine(fields[8]);
                            Console.WriteLine(fields[7]);
                            
                            //LoadDataToDBStudent(a, fields[2]);
                            //LoadDataToDBPerson(fields[3], fields[4], fields[5], fields[6], date, gender);
                            loadProjects(fields[7], fields[8]);
                        }


                    }
                   
                    
                    a++;

                    Console.WriteLine(); 
                }
            }
            MessageBox.Show("Successfully saved");
        }

        void loadProjects(string title, string des)
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("Insert into Project values (@Description, @Title);", con);
            cmd.Parameters.AddWithValue("@Title", title);
            cmd.Parameters.AddWithValue("@Description", des);
            cmd.ExecuteNonQuery();
        }
        void LoadDataToDBStudent(int id, string regNo)
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("Insert into Student values (@Id, @RegistrationNo);", con);
            cmd.Parameters.AddWithValue("@Id", id);
            cmd.Parameters.AddWithValue("@RegistrationNo", regNo);
            cmd.ExecuteNonQuery();
        }

        void LoadDataToDBPerson(string fName, string lName, string contact, string email, DateTime dateTime, int gender)
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("INSERT INTO Person VALUES ( @FirstName, @LastName, @Contact, @Email, @DateOfBirth, @Gender)", con);
            cmd.Parameters.AddWithValue("@FirstName", fName);
            cmd.Parameters.AddWithValue("@LastName", lName);
            cmd.Parameters.AddWithValue("@Contact", contact);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@DateOfBirth", dateTime);
            cmd.Parameters.AddWithValue("@Gender", gender);
            cmd.ExecuteNonQuery();
        }

        private void button1_Click(object sender, EventArgs e)
        {
          
        }

        private void guna2Button1_Click(object sender, EventArgs e)
        {

        }

        private void studentBtn_Click(object sender, EventArgs e)
        {

        }

        private void advisorBtn_Click(object sender, EventArgs e)
        {

        }

        private void projectsBtn_Click(object sender, EventArgs e)
        {

        }

        private void groupsBtn_Click(object sender, EventArgs e)
        {

        }

        private void assignAdvisorBtn_Click(object sender, EventArgs e)
        {

        }

        private void markEvaluationBtn_Click(object sender, EventArgs e)
        {

        }

        private void evaluationBtn_Click(object sender, EventArgs e)
        {

        }

        private void generateReportBtn_Click(object sender, EventArgs e)
        {

        }

        private void exitBtn_Click(object sender, EventArgs e)
        {

        }


        private void studentBtn_Click_1(object sender, EventArgs e)
        {
            this.Hide();
            AdminForm adminForm = new AdminForm();
            adminForm.Show();
        }

        private void advisorBtn_Click_1(object sender, EventArgs e)
        {
            this.Hide();
            AdvisorForm advisorForm = new AdvisorForm();
            advisorForm.Show();
        }

        private void projectsBtn_Click_1(object sender, EventArgs e)
        {

        }

        private void groupsBtn_Click_1(object sender, EventArgs e)
        {

        }

        private void assignAdvisorBtn_Click_1(object sender, EventArgs e)
        {

        }

        private void markEvaluationBtn_Click_1(object sender, EventArgs e)
        {

        }

        private void evaluationBtn_Click_1(object sender, EventArgs e)
        {

        }

        private void generateReportBtn_Click_1(object sender, EventArgs e)
        {

        }

        private void exitBtn_Click_1(object sender, EventArgs e)
        {
            this.Close();
        }

        void showProject()
        {
        }
    }
}
