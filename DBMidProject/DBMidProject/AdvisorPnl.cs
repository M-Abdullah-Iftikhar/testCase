using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;
using System.Xml.Linq;

namespace DBMidProject
{
    public partial class AdvisorPnl : UserControl
    {

        string fName = "";
        string lName = "";
        string contact = "";
        string email = "";
        DateTime DoB;
        string gender = "";

        public AdvisorPnl()
        {
            InitializeComponent();
            showGrid();
        }

        private void addBtn_Click(object sender, EventArgs e)
        {
            if (checkBoxes() == true)
            {
                if (checkPresence() == false)
                {
                    try
                    {

                        DoB = DateTime.Parse(datePkr.Text);
                        var con = Configuration.getInstance().getConnection();
                        SqlCommand cmd = new SqlCommand("Insert into Person values (@FirstName, @LastName, @Contact, @Email, @DateOfBirth, (select Lookup.Id from Lookup where Value = @Gender)); Insert into Advisor values ((SELECT Max(Id) FROM Person), (select Lookup.Id from Lookup where Value = @Designation), @Salary)", con);
                        cmd.Parameters.AddWithValue("@FirstName", (fNameTxtBx.Text));
                        cmd.Parameters.AddWithValue("@LastName", lNameTxtBx.Text);
                        cmd.Parameters.AddWithValue("@Contact", contactTxtBx.Text);
                        cmd.Parameters.AddWithValue("@Email", emailTxtBx.Text);
                        cmd.Parameters.AddWithValue("@DateOfBirth", DoB);
                        cmd.Parameters.AddWithValue("@Gender", genderCmbBx.Text);
                        cmd.Parameters.AddWithValue("@Designation", designationCmbBx.Text);
                        cmd.Parameters.AddWithValue("@Salary", decimal.Parse(salaryTxtBx.Text));
                        cmd.ExecuteNonQuery();

                        MessageBox.Show("Successfully saved");
                        clearBoxes();
                        showGrid();
                    }
                   catch
                    {
                        MessageBox.Show("An Error Occured While Running the Query");
                    }

                }
                else
                {
                    MessageBox.Show("This Person Already Exists");
                }

            }
            else
            {
                MessageBox.Show("please fill out all the requirements");
            }
        }

        private void removeBtn_Click(object sender, EventArgs e)
        {
            try
            {
                int id = getID();
                var con = Configuration.getInstance().getConnection();
                SqlCommand cmd = new SqlCommand("Delete From Advisor where Id = @Id; ", con);
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.ExecuteNonQuery();

                MessageBox.Show("Successfully Deleted");
                showGrid();
                clearBoxes();
            }
            catch
            {
                MessageBox.Show("An Error Occured While Running the Query");
                clearBoxes() ;
            }
        }

        private void updateBtn_Click(object sender, EventArgs e)
        {

            DoB = DateTime.Parse(datePkr.Text);
            var con = Configuration.getInstance().getConnection();
            int id = getID();
            SqlCommand cmd = new SqlCommand("UPDATE Person SET FirstName = @FirstName, LastName = @LastName, Contact = @Contact, Email = @Email, DateOfBirth = @DateOfBirth, Gender = (select Lookup.Id from Lookup where Value = @Gender) WHERE Id = @Id; UPDATE Advisor SET Designation = (select Lookup.Id from Lookup where Value = @Designation), Salary = @Salary WHERE Id = @Id;", con);
            cmd.Parameters.AddWithValue("@FirstName", (fNameTxtBx.Text));
            cmd.Parameters.AddWithValue("@LastName", lNameTxtBx.Text);
            cmd.Parameters.AddWithValue("@Contact", contactTxtBx.Text);
            cmd.Parameters.AddWithValue("@Email", emailTxtBx.Text);
            cmd.Parameters.AddWithValue("@Id", id);
            cmd.Parameters.AddWithValue("@DateOfBirth", DoB);
            cmd.Parameters.AddWithValue("@Gender", genderCmbBx.Text);
            cmd.Parameters.AddWithValue("@Designation", designationCmbBx.Text);
            cmd.Parameters.AddWithValue("@Salary", decimal.Parse(salaryTxtBx.Text));
            cmd.ExecuteNonQuery();




            MessageBox.Show("Successfully Updated");
            clearBoxes();
            showGrid();
        }

        private void clearBtn_Click(object sender, EventArgs e)
        {
            clearBoxes();
            showGrid();
        }

        int getID()
        {
            int id = 0;
            DoB = DateTime.Parse(datePkr.Text);
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("SELECT Id FROM Person WHERE  FirstName = @FirstName AND Contact = @Contact AND Email = @Email ", con);
            cmd.Parameters.AddWithValue("@FirstName", fName);
            cmd.Parameters.AddWithValue("@Contact", contact);
            cmd.Parameters.AddWithValue("@Email", email);


            id = (int)cmd.ExecuteScalar();


            return id;
        }


        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
           
        }

       

        bool checkPresence()
        {
           
            DoB = DateTime.Parse(datePkr.Text);
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Person WHERE  FirstName = @FirstName AND LastName = @LastName AND Contact = @Contact AND Email = @Email AND DateOfBirth = @DateOfBirth AND Gender = (select Lookup.Id from Lookup where Value = @Gender)", con);
            cmd.Parameters.AddWithValue("@FirstName", fName);
            cmd.Parameters.AddWithValue("@LastName", lName);
            cmd.Parameters.AddWithValue("@Contact", contact);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@DateOfBirth", DoB);
            cmd.Parameters.AddWithValue("@Gender", gender);

            int rowCount = (int)cmd.ExecuteScalar();

            if (rowCount > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private bool checkBoxes()
        {
            if (designationCmbBx.Text == null || designationCmbBx.Text == "" ||
                fNameTxtBx.Text == null || fNameTxtBx.Text == "" ||
                lNameTxtBx.Text == null || lNameTxtBx.Text == "" ||
                emailTxtBx.Text == null || emailTxtBx.Text == "" ||
                contactTxtBx.Text == null || contactTxtBx.Text == "" ||
                genderCmbBx.Text == null || genderCmbBx.Text == "" ||
                datePkr.Text == null|| 
                salaryTxtBx.Text == null || salaryTxtBx.Text == "")
            {
                return false;
            }
            return true;
        }
        public void clearBoxes()
        {
            designationCmbBx.Text = "";
            fNameTxtBx.Text = "";
            lNameTxtBx.Text = "";
            emailTxtBx.Text = "";
            contactTxtBx.Text = "";
            genderCmbBx.Text = "";
            datePkr.Text = "";
            salaryTxtBx.Text = "";
            fName = "";
            lName = "";
            email = "";
            contact = "";
            gender = "";
            DoB = DateTime.MinValue;
        }


        private void showGrid()
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("Select  FirstName, LastName, Contact, Email, DateOfBirth, (Select Value from Lookup WHERE Id = Designation) AS Designation, Salary, (Select Value from Lookup WHERE Id = Gender) AS Gender from Advisor JOIN Person ON Advisor.Id = Person.Id", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
        }

       
        

        
        private void dataGridView1_CellClick_1(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {

                dataGridView1.ClearSelection();

                dataGridView1.Rows[e.RowIndex].Selected = true;

                DataGridViewRow selectedRow = dataGridView1.Rows[e.RowIndex];

                string desig = selectedRow.Cells["Designation"].Value.ToString();
                string sal = selectedRow.Cells["Salary"].Value.ToString();
                fName = selectedRow.Cells["FirstName"].Value.ToString();
                lName = selectedRow.Cells["LastName"].Value.ToString();
                contact = selectedRow.Cells["Contact"].Value.ToString();
                email = selectedRow.Cells["Email"].Value.ToString();
                string date = selectedRow.Cells["DateOfBirth"].Value.ToString();
                gender = selectedRow.Cells["Gender"].Value.ToString();

                fNameTxtBx.Text = fName;
                lNameTxtBx.Text = lName;
                salaryTxtBx.Text = sal;
                contactTxtBx.Text = contact;
                emailTxtBx.Text = email;
                datePkr.Text = date;
                designationCmbBx.Text = desig;
                DoB = DateTime.Parse(date);
                

            }
        }
    }
}
