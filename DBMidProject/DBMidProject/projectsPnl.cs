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
using Guna.UI2.WinForms.Suite;
using Guna.UI2.WinForms;

namespace DBMidProject
{
    public partial class projectsPnl : UserControl
    {
        string title;
        string description;
        public projectsPnl()
        {
            InitializeComponent();
           
            showGrid();
        }

        private void tableLayoutPanel4_Paint(object sender, PaintEventArgs e)
        {

        }

        private void addBtn_Click(object sender, EventArgs e)
        {
            if (checkBoxes() == true)
            {
                if (checkPresence() == false)
                {
                    try
                    {

                        var con = Configuration.getInstance().getConnection();
                        SqlCommand cmd = new SqlCommand("Insert into Project values (@description, @Title); ", con);
                        cmd.Parameters.AddWithValue("@Title", (titleTxtBx.Text));
                        cmd.Parameters.AddWithValue("@description", descriptionTxtBx.Text);
                       
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
        private void showGrid()
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("Select Title, Description from Project", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
        }
        private bool checkBoxes()
        {
            if (titleTxtBx.Text == null || titleTxtBx.Text == "" ||
                descriptionTxtBx.Text == null || descriptionTxtBx.Text == "")
            {
                return false;
            }
            return true;
        }
        public void clearBoxes()
        {
            titleTxtBx.Text = "";
            descriptionTxtBx.Text = "";
        }

        bool checkPresence()
        {

            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Project WHERE  Title = @Title", con);
            cmd.Parameters.AddWithValue("@Title", title);
           
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

        private void updateBtn_Click(object sender, EventArgs e)
        {
           
            var con = Configuration.getInstance().getConnection();
            int id = getID();
            if (id > 0)
            {
                SqlCommand cmd = new SqlCommand("UPDATE Project SET Description = @Description, Title = @Title WHERE Id = @Id;", con);
                cmd.Parameters.AddWithValue("@Title", titleTxtBx.Text);
                cmd.Parameters.AddWithValue("@Description", descriptionTxtBx.Text);
                cmd.Parameters.AddWithValue("@Id", id);

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
                SqlCommand cmd = new SqlCommand("SELECT Id FROM Project WHERE Title = @Title", con);
                cmd.Parameters.AddWithValue("@Title", title);


                id = (int)cmd.ExecuteScalar();
                return id;
            }
            catch
            {
                return -1;
            }
            


           
        }


        private void clearBtn_Click(object sender, EventArgs e)
        {
            clearBoxes();
            showGrid();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {

                dataGridView1.ClearSelection();

                dataGridView1.Rows[e.RowIndex].Selected = true;

                DataGridViewRow selectedRow = dataGridView1.Rows[e.RowIndex];

                title = selectedRow.Cells["Title"].Value.ToString();
                description = selectedRow.Cells["Description"].Value.ToString();

                titleTxtBx.Text = title;
                descriptionTxtBx.Text = description;
                



            }
        }
    }
}
