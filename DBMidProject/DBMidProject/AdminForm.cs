using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DBMidProject
{
    public partial class AdminForm : Form
    {
        public AdminForm()
        {
            InitializeComponent();
            hideAll();
        }

        private void studentBtn_Click(object sender, EventArgs e)
        {
            hideAll();
            showStudent();
        }

        private void advisorBtn_Click(object sender, EventArgs e)
        {
            hideAll();
            showAdvisor();
        }

        private void projectsBtn_Click(object sender, EventArgs e)
        {
            hideAll();
            showProject();
        }

        private void assignAdvisorBtn_Click(object sender, EventArgs e)
        {
            hideAll();
            showAssognAdvisor();
        }

        void showAssognAdvisor()
        {
            assignAdvisorBtn.ForeColor = Color.White;
            assignAdvisorPnl1.Visible = true;
            headerLbl.Text = "Assign Advisors";

        }
        void showProject()
        {
            projectsBtn.ForeColor = Color.White;
            projectsPnl1.Visible = true;
            headerLbl.Text = "Manage Projects";
            projectsPnl1.clearBoxes();
        }
        public void showStudent()
        {
            studentBtn.ForeColor = Color.White;
            studentPnl1.Visible = true;
            headerLbl.Text = "Manage Students";
            studentPnl1.clearBoxes();
        }
        public void showAdvisor()
        {
            advisorBtn.ForeColor = Color.White;
            advisorPnl1.Visible = true;
            headerLbl.Text = "Manage Advisors";
            advisorPnl1.clearBoxes();
        }

        public void hideAll()
        {
            studentBtn.ForeColor = Color.Black;
            advisorBtn.ForeColor = Color.Black;
            projectsBtn.ForeColor = Color.Black;
            assignAdvisorBtn.ForeColor = Color.Black;
            projectsPnl1.Visible = false;
            advisorPnl1.Visible = false;
            studentPnl1.Visible = false;
            assignAdvisorPnl1.Visible = false;
            headerLbl.Text = string.Empty;

        }

        private void backBtn_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form1 form = new Form1();
            form.Show();
        }
    }
}
