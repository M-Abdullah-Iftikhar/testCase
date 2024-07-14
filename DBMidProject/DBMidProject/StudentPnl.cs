using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Serialization;
using static System.ComponentModel.Design.ObjectSelectorEditor;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace DBMidProject
{
    public partial class StudentPnl : UserControl
    {
        string regNo;
        string fName;
        string lName;
        string contact;
        string email;
        DateTime DoB;
        string gender;
        string country;
        string password;
        string department;


        public StudentPnl()
        {
            InitializeComponent();
            showGrid();
            clearBoxes();
        }

        private void tableLayoutPanel3_Paint(object sender, PaintEventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void guna2GradientButton2_Click(object sender, EventArgs e)
        {
            //add button
        }

        private void removeBtn_Click(object sender, EventArgs e)
        {
            //remove button
        }

        private void updateBtn_Click(object sender, EventArgs e)
        {
            //update btn
        }

        private void showGrid()
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("Select RegistrationNo, FirstName, LastName, Contact, Email, DateOfBirth, (Select Value Gender from Lookup WHERE Id = Gender) AS Gender from Student inner JOIN Person ON Student.Id = Person.Id", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            guna2DataGridView1.DataSource = dt;
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
                        SqlCommand cmd = new SqlCommand("Insert into Person values (@FirstName, @LastName, @Contact, @Email, @DateOfBirth, (select Lookup.Id from Lookup where Value = @Gender)); Insert into Student (Id, RegistrationNo) values ((SELECT Max(Id) FROM Person), @RegisterationNo) ", con);
                        cmd.Parameters.AddWithValue("@FirstName", (fNameTxtBx.Text));
                        cmd.Parameters.AddWithValue("@LastName", lNameTxtBx.Text);
                        cmd.Parameters.AddWithValue("@Contact", contactTxtBx.Text);
                        cmd.Parameters.AddWithValue("@Email", emailTxtBx.Text);
                        cmd.Parameters.AddWithValue("@DateOfBirth", DoB);
                        cmd.Parameters.AddWithValue("@Gender", genderCmbBx.Text);
                        cmd.Parameters.AddWithValue("@RegisterationNo", regNoTxtBx.Text);
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

       

       

        private void removeBtn_Click_1(object sender, EventArgs e)
        {

            try 
            {
                int id = getID();
                var con = Configuration.getInstance().getConnection();
                SqlCommand cmd = new SqlCommand("Delete From Student where Id = @Id; ", con);
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.ExecuteNonQuery();

                MessageBox.Show("Successfully Deleted");
                showGrid();
            }
            catch
            {
                MessageBox.Show("An Error Occured While Running the Query");
                clearBoxes();
            }
           
        }

        private void updateBtn_Click_1(object sender, EventArgs e)
        {
            DoB = DateTime.Parse(datePkr.Text);
            var con = Configuration.getInstance().getConnection();
            int id = getID();

            if(id>0)
            {
                SqlCommand cmd = new SqlCommand("UPDATE Person SET FirstName = @FirstName, LastName = @LastName, Contact = @Contact, Email = @Email, DateOfBirth = @DateOfBirth, Gender = (select Lookup.Id from Lookup where Value = @Gender) WHERE Id = @Id; UPDATE Student SET RegistrationNo = @RegisterationNo WHERE Id = @Id;", con);
                cmd.Parameters.AddWithValue("@FirstName", (fNameTxtBx.Text));
                cmd.Parameters.AddWithValue("@LastName", lNameTxtBx.Text);
                cmd.Parameters.AddWithValue("@Contact", contactTxtBx.Text);
                cmd.Parameters.AddWithValue("@Email", emailTxtBx.Text);
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.Parameters.AddWithValue("@DateOfBirth", DoB);
                cmd.Parameters.AddWithValue("@RegisterationNo", regNoTxtBx.Text);
                cmd.Parameters.AddWithValue("@Gender", genderCmbBx.Text);
                cmd.ExecuteNonQuery();


                MessageBox.Show("Successfully Updated");
                clearBoxes();
                showGrid();
            }
            else
            {
                MessageBox.Show("Please Select a column to update first");
            }    
           
        }

        int getID()
        {
            try
            {
                int id = 0;
                var con = Configuration.getInstance().getConnection();
                SqlCommand cmd = new SqlCommand("SELECT Id FROM Person WHERE FirstName = @FirstName AND Contact = @Contact AND Email = @Email ", con);
                cmd.Parameters.AddWithValue("@FirstName", fName);
                cmd.Parameters.AddWithValue("@Contact", contact);
                cmd.Parameters.AddWithValue("@Email", email);

                MessageBox.Show(fName + " " + contact + " " + email);


                id = (int)cmd.ExecuteScalar();


                return id;
            }
            catch
            {
                return -1;
            }
            
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
            if (regNoTxtBx.Text == null || regNoTxtBx.Text == "" ||
                fNameTxtBx.Text == null || fNameTxtBx.Text == "" ||
                lNameTxtBx.Text == null || lNameTxtBx.Text == "" ||
                emailTxtBx.Text == null || emailTxtBx.Text == "" ||
                contactTxtBx.Text == null || contactTxtBx.Text == "" ||
                genderCmbBx.Text == null || genderCmbBx.Text == "" ||
                datePkr.Text == null)
            {
                return false;
            }
            return true;
        }
        public void clearBoxes()
        {

            regNoTxtBx.Text = "";
            fNameTxtBx.Text = "";
            lNameTxtBx.Text = "";
            emailTxtBx.Text = "";
            contactTxtBx.Text = "";
            genderCmbBx.Text = "";
            datePkr.Text = "";
            regNo = "";
            fName = "";
            lName = "";
            email = "";
            contact = "";
            gender = "";
            DoB = DateTime.MinValue;
        }

        private void datePkr_ValueChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
           
        }



        private void clearBtn_Click(object sender, EventArgs e)
        {
            clearBoxes();
            showGrid();
        }

        private void guna2DataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {

                guna2DataGridView1.ClearSelection();

                guna2DataGridView1.Rows[e.RowIndex].Selected = true;

                DataGridViewRow selectedRow = guna2DataGridView1.Rows[e.RowIndex];

                regNo = selectedRow.Cells["RegistrationNo"].Value.ToString();
                fName = selectedRow.Cells["FirstName"].Value.ToString();
                lName = selectedRow.Cells["LastName"].Value.ToString();
                contact = selectedRow.Cells["Contact"].Value.ToString();
                email = selectedRow.Cells["Email"].Value.ToString();
                string date = selectedRow.Cells["DateOfBirth"].Value.ToString();
                gender = selectedRow.Cells["Gender"].Value.ToString();


                fNameTxtBx.Text = fName;
                lNameTxtBx.Text = lName;
                regNoTxtBx.Text = regNo;
                contactTxtBx.Text = contact;
                emailTxtBx.Text = email;
                genderCmbBx.Text = gender;
                datePkr.Text = date;

                DoB = DateTime.Parse(date);
                

            }
        }
    }
}
