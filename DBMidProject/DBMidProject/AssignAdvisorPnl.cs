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
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace DBMidProject
{
    public partial class AssignAdvisorPnl : UserControl
    {
        public AssignAdvisorPnl()
        {
            InitializeComponent();
            showGrid();
            loadCmbBx();
        }

        private void assignBtn_Click(object sender, EventArgs e)
        {

        }

        private void updateBtn_Click(object sender, EventArgs e)
        {

        }

        private void clearBtn_Click(object sender, EventArgs e)
        {

        }

        void showGrid()
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("select project.Title, (Select Person.FirstName Where ProjectAdvisor.AdvisorRole = (select id from Lookup Where value = 'Main Advisor')) as [Main Advisor], (Select Person.FirstName Where ProjectAdvisor.AdvisorRole = (select id from Lookup Where value = 'Co-Advisror')) as [Co-Advisor], (Select Person.FirstName Where ProjectAdvisor.AdvisorRole = (select id from Lookup Where value = 'Industry Advisor')) as [Industry Advisor], AssignmentDate from ((Project Join ProjectAdvisor on project.Id = ProjectAdvisor.ProjectId) join Advisor On Advisor.Id = ProjectAdvisor.AdvisorId) JOIN Person on Advisor.Id = Person.Id;", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
        }

        void loadCmbBx()
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("SELECT FirstName FROM Person", con);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                string firstName = reader["FirstName"].ToString();
                mainAdvCmbBx.Items.Add(firstName);
                coAdvCmbBx.Items.Add(firstName);
                indAdvCmbBx.Items.Add(firstName);
            }
        }
    }
}
