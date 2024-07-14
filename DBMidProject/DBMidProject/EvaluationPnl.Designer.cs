namespace DBMidProject
{
    partial class EvaluationPnl
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.label6 = new System.Windows.Forms.Label();
            this.datePkr = new Guna.UI2.WinForms.Guna2DateTimePicker();
            this.tableLayoutPanel2 = new System.Windows.Forms.TableLayoutPanel();
            this.tableLayoutPanel3 = new System.Windows.Forms.TableLayoutPanel();
            this.clearBtn = new Guna.UI2.WinForms.Guna2GradientButton();
            this.addBtn = new Guna.UI2.WinForms.Guna2GradientButton();
            this.removeBtn = new Guna.UI2.WinForms.Guna2GradientButton();
            this.updateBtn = new Guna.UI2.WinForms.Guna2GradientButton();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.regNoTxtBx = new Guna.UI2.WinForms.Guna2TextBox();
            this.fNameTxtBx = new Guna.UI2.WinForms.Guna2TextBox();
            this.lNameTxtBx = new Guna.UI2.WinForms.Guna2TextBox();
            this.emailTxtBx = new Guna.UI2.WinForms.Guna2TextBox();
            this.contactTxtBx = new Guna.UI2.WinForms.Guna2TextBox();
            this.genderCmbBx = new Guna.UI2.WinForms.Guna2ComboBox();
            this.tableLayoutPanel4 = new System.Windows.Forms.TableLayoutPanel();
            this.label7 = new System.Windows.Forms.Label();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.guna2Elipse1 = new Guna.UI2.WinForms.Guna2Elipse(this.components);
            this.tableLayoutPanel2.SuspendLayout();
            this.tableLayoutPanel3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.tableLayoutPanel4.SuspendLayout();
            this.tableLayoutPanel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // label6
            // 
            this.label6.Anchor = System.Windows.Forms.AnchorStyles.Right;
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Segoe UI Semibold", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(265, 70);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(84, 17);
            this.label6.TabIndex = 5;
            this.label6.Text = "Gender        ";
            // 
            // datePkr
            // 
            this.datePkr.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.datePkr.AutoRoundedCorners = true;
            this.datePkr.BackColor = System.Drawing.Color.Transparent;
            this.datePkr.BorderRadius = 15;
            this.datePkr.Checked = true;
            this.datePkr.FillColor = System.Drawing.Color.Aquamarine;
            this.datePkr.Font = new System.Drawing.Font("Segoe UI Semibold", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.datePkr.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.datePkr.Format = System.Windows.Forms.DateTimePickerFormat.Long;
            this.datePkr.Location = new System.Drawing.Point(355, 101);
            this.datePkr.MaxDate = new System.DateTime(9998, 12, 31, 0, 0, 0, 0);
            this.datePkr.MinDate = new System.DateTime(1753, 1, 1, 0, 0, 0, 0);
            this.datePkr.Name = "datePkr";
            this.datePkr.Size = new System.Drawing.Size(182, 33);
            this.datePkr.TabIndex = 9;
            this.datePkr.UseTransparentBackground = true;
            this.datePkr.Value = new System.DateTime(2024, 3, 3, 10, 11, 12, 293);
            // 
            // tableLayoutPanel2
            // 
            this.tableLayoutPanel2.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.tableLayoutPanel2.ColumnCount = 2;
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 23F));
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 77F));
            this.tableLayoutPanel2.Controls.Add(this.tableLayoutPanel3, 0, 0);
            this.tableLayoutPanel2.Controls.Add(this.dataGridView1, 1, 0);
            this.tableLayoutPanel2.Location = new System.Drawing.Point(3, 209);
            this.tableLayoutPanel2.Name = "tableLayoutPanel2";
            this.tableLayoutPanel2.RowCount = 1;
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tableLayoutPanel2.Size = new System.Drawing.Size(595, 205);
            this.tableLayoutPanel2.TabIndex = 0;
            // 
            // tableLayoutPanel3
            // 
            this.tableLayoutPanel3.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.tableLayoutPanel3.ColumnCount = 1;
            this.tableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tableLayoutPanel3.Controls.Add(this.clearBtn, 0, 5);
            this.tableLayoutPanel3.Controls.Add(this.addBtn, 0, 1);
            this.tableLayoutPanel3.Controls.Add(this.removeBtn, 0, 2);
            this.tableLayoutPanel3.Controls.Add(this.updateBtn, 0, 3);
            this.tableLayoutPanel3.Location = new System.Drawing.Point(3, 3);
            this.tableLayoutPanel3.Name = "tableLayoutPanel3";
            this.tableLayoutPanel3.RowCount = 7;
            this.tableLayoutPanel3.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10.1942F));
            this.tableLayoutPanel3.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 15.92346F));
            this.tableLayoutPanel3.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 15.92346F));
            this.tableLayoutPanel3.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 15.92346F));
            this.tableLayoutPanel3.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 15.92346F));
            this.tableLayoutPanel3.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 15.92118F));
            this.tableLayoutPanel3.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10.19076F));
            this.tableLayoutPanel3.Size = new System.Drawing.Size(130, 199);
            this.tableLayoutPanel3.TabIndex = 0;
            // 
            // clearBtn
            // 
            this.clearBtn.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.clearBtn.Animated = true;
            this.clearBtn.AutoRoundedCorners = true;
            this.clearBtn.BackColor = System.Drawing.Color.Transparent;
            this.clearBtn.BorderColor = System.Drawing.Color.Cyan;
            this.clearBtn.BorderRadius = 11;
            this.clearBtn.BorderThickness = 3;
            this.clearBtn.DefaultAutoSize = true;
            this.clearBtn.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.clearBtn.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.clearBtn.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.clearBtn.DisabledState.FillColor2 = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.clearBtn.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.clearBtn.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(192)))), ((int)(((byte)(192)))));
            this.clearBtn.FillColor2 = System.Drawing.Color.MediumSpringGreen;
            this.clearBtn.Font = new System.Drawing.Font("Segoe UI Semibold", 9F, System.Drawing.FontStyle.Bold);
            this.clearBtn.ForeColor = System.Drawing.Color.Black;
            this.clearBtn.Location = new System.Drawing.Point(3, 147);
            this.clearBtn.Name = "clearBtn";
            this.clearBtn.Size = new System.Drawing.Size(124, 25);
            this.clearBtn.TabIndex = 8;
            this.clearBtn.Text = "Clear";
            // 
            // addBtn
            // 
            this.addBtn.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.addBtn.Animated = true;
            this.addBtn.AutoRoundedCorners = true;
            this.addBtn.BackColor = System.Drawing.Color.Transparent;
            this.addBtn.BorderColor = System.Drawing.Color.Cyan;
            this.addBtn.BorderRadius = 11;
            this.addBtn.BorderThickness = 3;
            this.addBtn.DefaultAutoSize = true;
            this.addBtn.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.addBtn.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.addBtn.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.addBtn.DisabledState.FillColor2 = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.addBtn.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.addBtn.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(192)))), ((int)(((byte)(192)))));
            this.addBtn.FillColor2 = System.Drawing.Color.MediumSpringGreen;
            this.addBtn.Font = new System.Drawing.Font("Segoe UI Semibold", 9F, System.Drawing.FontStyle.Bold);
            this.addBtn.ForeColor = System.Drawing.Color.Black;
            this.addBtn.Location = new System.Drawing.Point(3, 23);
            this.addBtn.Name = "addBtn";
            this.addBtn.Size = new System.Drawing.Size(124, 25);
            this.addBtn.TabIndex = 5;
            this.addBtn.Text = "Add";
            // 
            // removeBtn
            // 
            this.removeBtn.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.removeBtn.Animated = true;
            this.removeBtn.AutoRoundedCorners = true;
            this.removeBtn.BackColor = System.Drawing.Color.Transparent;
            this.removeBtn.BorderColor = System.Drawing.Color.Cyan;
            this.removeBtn.BorderRadius = 11;
            this.removeBtn.BorderThickness = 3;
            this.removeBtn.DefaultAutoSize = true;
            this.removeBtn.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.removeBtn.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.removeBtn.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.removeBtn.DisabledState.FillColor2 = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.removeBtn.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.removeBtn.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(192)))), ((int)(((byte)(192)))));
            this.removeBtn.FillColor2 = System.Drawing.Color.MediumSpringGreen;
            this.removeBtn.Font = new System.Drawing.Font("Segoe UI Semibold", 9F, System.Drawing.FontStyle.Bold);
            this.removeBtn.ForeColor = System.Drawing.Color.Black;
            this.removeBtn.Location = new System.Drawing.Point(3, 54);
            this.removeBtn.Name = "removeBtn";
            this.removeBtn.Size = new System.Drawing.Size(124, 25);
            this.removeBtn.TabIndex = 6;
            this.removeBtn.Text = "Remove";
            // 
            // updateBtn
            // 
            this.updateBtn.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.updateBtn.Animated = true;
            this.updateBtn.AutoRoundedCorners = true;
            this.updateBtn.BackColor = System.Drawing.Color.Transparent;
            this.updateBtn.BorderColor = System.Drawing.Color.Cyan;
            this.updateBtn.BorderRadius = 11;
            this.updateBtn.BorderThickness = 3;
            this.updateBtn.DefaultAutoSize = true;
            this.updateBtn.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.updateBtn.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.updateBtn.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.updateBtn.DisabledState.FillColor2 = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.updateBtn.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.updateBtn.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(192)))), ((int)(((byte)(192)))));
            this.updateBtn.FillColor2 = System.Drawing.Color.MediumSpringGreen;
            this.updateBtn.Font = new System.Drawing.Font("Segoe UI Semibold", 9F, System.Drawing.FontStyle.Bold);
            this.updateBtn.ForeColor = System.Drawing.Color.Black;
            this.updateBtn.Location = new System.Drawing.Point(3, 85);
            this.updateBtn.Name = "updateBtn";
            this.updateBtn.Size = new System.Drawing.Size(124, 25);
            this.updateBtn.TabIndex = 7;
            this.updateBtn.Text = "Update";
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataGridView1.Location = new System.Drawing.Point(139, 3);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 51;
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.Size = new System.Drawing.Size(453, 199);
            this.dataGridView1.TabIndex = 1;
            // 
            // regNoTxtBx
            // 
            this.regNoTxtBx.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.regNoTxtBx.AutoRoundedCorners = true;
            this.regNoTxtBx.BorderRadius = 15;
            this.regNoTxtBx.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.regNoTxtBx.DefaultText = "";
            this.regNoTxtBx.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.regNoTxtBx.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.regNoTxtBx.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.regNoTxtBx.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.regNoTxtBx.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.regNoTxtBx.Font = new System.Drawing.Font("Segoe UI Semibold", 7.8F, System.Drawing.FontStyle.Bold);
            this.regNoTxtBx.ForeColor = System.Drawing.Color.Black;
            this.regNoTxtBx.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.regNoTxtBx.Location = new System.Drawing.Point(55, 23);
            this.regNoTxtBx.Name = "regNoTxtBx";
            this.regNoTxtBx.PasswordChar = '\0';
            this.regNoTxtBx.PlaceholderText = "Registeration Number";
            this.regNoTxtBx.SelectedText = "";
            this.regNoTxtBx.Size = new System.Drawing.Size(182, 33);
            this.regNoTxtBx.TabIndex = 7;
            // 
            // fNameTxtBx
            // 
            this.fNameTxtBx.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.fNameTxtBx.AutoRoundedCorners = true;
            this.fNameTxtBx.BorderRadius = 15;
            this.fNameTxtBx.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.fNameTxtBx.DefaultText = "";
            this.fNameTxtBx.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.fNameTxtBx.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.fNameTxtBx.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.fNameTxtBx.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.fNameTxtBx.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.fNameTxtBx.Font = new System.Drawing.Font("Segoe UI Semibold", 7.8F, System.Drawing.FontStyle.Bold);
            this.fNameTxtBx.ForeColor = System.Drawing.Color.Black;
            this.fNameTxtBx.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.fNameTxtBx.Location = new System.Drawing.Point(55, 62);
            this.fNameTxtBx.Name = "fNameTxtBx";
            this.fNameTxtBx.PasswordChar = '\0';
            this.fNameTxtBx.PlaceholderText = "First Name";
            this.fNameTxtBx.SelectedText = "";
            this.fNameTxtBx.Size = new System.Drawing.Size(182, 33);
            this.fNameTxtBx.TabIndex = 10;
            // 
            // lNameTxtBx
            // 
            this.lNameTxtBx.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.lNameTxtBx.AutoRoundedCorners = true;
            this.lNameTxtBx.BorderRadius = 15;
            this.lNameTxtBx.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.lNameTxtBx.DefaultText = "";
            this.lNameTxtBx.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.lNameTxtBx.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.lNameTxtBx.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.lNameTxtBx.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.lNameTxtBx.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.lNameTxtBx.Font = new System.Drawing.Font("Segoe UI Semibold", 7.8F, System.Drawing.FontStyle.Bold);
            this.lNameTxtBx.ForeColor = System.Drawing.Color.Black;
            this.lNameTxtBx.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.lNameTxtBx.Location = new System.Drawing.Point(55, 101);
            this.lNameTxtBx.Name = "lNameTxtBx";
            this.lNameTxtBx.PasswordChar = '\0';
            this.lNameTxtBx.PlaceholderText = "Last Name";
            this.lNameTxtBx.SelectedText = "";
            this.lNameTxtBx.Size = new System.Drawing.Size(182, 33);
            this.lNameTxtBx.TabIndex = 11;
            // 
            // emailTxtBx
            // 
            this.emailTxtBx.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.emailTxtBx.AutoRoundedCorners = true;
            this.emailTxtBx.BorderRadius = 15;
            this.emailTxtBx.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.emailTxtBx.DefaultText = "";
            this.emailTxtBx.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.emailTxtBx.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.emailTxtBx.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.emailTxtBx.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.emailTxtBx.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.emailTxtBx.Font = new System.Drawing.Font("Segoe UI Semibold", 7.8F, System.Drawing.FontStyle.Bold);
            this.emailTxtBx.ForeColor = System.Drawing.Color.Black;
            this.emailTxtBx.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.emailTxtBx.Location = new System.Drawing.Point(55, 140);
            this.emailTxtBx.Name = "emailTxtBx";
            this.emailTxtBx.PasswordChar = '\0';
            this.emailTxtBx.PlaceholderText = "Email";
            this.emailTxtBx.SelectedText = "";
            this.emailTxtBx.Size = new System.Drawing.Size(182, 33);
            this.emailTxtBx.TabIndex = 12;
            // 
            // contactTxtBx
            // 
            this.contactTxtBx.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.contactTxtBx.AutoRoundedCorners = true;
            this.contactTxtBx.BorderRadius = 15;
            this.contactTxtBx.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.contactTxtBx.DefaultText = "";
            this.contactTxtBx.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.contactTxtBx.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.contactTxtBx.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.contactTxtBx.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.contactTxtBx.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.contactTxtBx.Font = new System.Drawing.Font("Segoe UI Semibold", 7.8F, System.Drawing.FontStyle.Bold);
            this.contactTxtBx.ForeColor = System.Drawing.Color.Black;
            this.contactTxtBx.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.contactTxtBx.Location = new System.Drawing.Point(355, 23);
            this.contactTxtBx.Name = "contactTxtBx";
            this.contactTxtBx.PasswordChar = '\0';
            this.contactTxtBx.PlaceholderText = "Contact Number";
            this.contactTxtBx.SelectedText = "";
            this.contactTxtBx.Size = new System.Drawing.Size(182, 33);
            this.contactTxtBx.TabIndex = 13;
            // 
            // genderCmbBx
            // 
            this.genderCmbBx.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.genderCmbBx.AutoRoundedCorners = true;
            this.genderCmbBx.BackColor = System.Drawing.Color.Transparent;
            this.genderCmbBx.BorderRadius = 17;
            this.genderCmbBx.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.genderCmbBx.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.genderCmbBx.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.genderCmbBx.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.genderCmbBx.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.genderCmbBx.ForeColor = System.Drawing.Color.Black;
            this.genderCmbBx.ItemHeight = 30;
            this.genderCmbBx.Items.AddRange(new object[] {
            "Male",
            "Female"});
            this.genderCmbBx.Location = new System.Drawing.Point(355, 62);
            this.genderCmbBx.Name = "genderCmbBx";
            this.genderCmbBx.Size = new System.Drawing.Size(182, 36);
            this.genderCmbBx.TabIndex = 8;
            // 
            // tableLayoutPanel4
            // 
            this.tableLayoutPanel4.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.tableLayoutPanel4.ColumnCount = 5;
            this.tableLayoutPanel4.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 8.874332F));
            this.tableLayoutPanel4.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 31.67142F));
            this.tableLayoutPanel4.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 18.9085F));
            this.tableLayoutPanel4.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 31.67142F));
            this.tableLayoutPanel4.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 8.874331F));
            this.tableLayoutPanel4.Controls.Add(this.regNoTxtBx, 1, 1);
            this.tableLayoutPanel4.Controls.Add(this.fNameTxtBx, 1, 2);
            this.tableLayoutPanel4.Controls.Add(this.lNameTxtBx, 1, 3);
            this.tableLayoutPanel4.Controls.Add(this.emailTxtBx, 1, 4);
            this.tableLayoutPanel4.Controls.Add(this.contactTxtBx, 3, 1);
            this.tableLayoutPanel4.Controls.Add(this.genderCmbBx, 3, 2);
            this.tableLayoutPanel4.Controls.Add(this.label6, 2, 2);
            this.tableLayoutPanel4.Controls.Add(this.label7, 2, 3);
            this.tableLayoutPanel4.Controls.Add(this.datePkr, 3, 3);
            this.tableLayoutPanel4.Location = new System.Drawing.Point(3, 3);
            this.tableLayoutPanel4.Name = "tableLayoutPanel4";
            this.tableLayoutPanel4.RowCount = 6;
            this.tableLayoutPanel4.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10.11315F));
            this.tableLayoutPanel4.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 19.94565F));
            this.tableLayoutPanel4.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 19.94322F));
            this.tableLayoutPanel4.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 19.94322F));
            this.tableLayoutPanel4.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 19.94322F));
            this.tableLayoutPanel4.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10.11156F));
            this.tableLayoutPanel4.Size = new System.Drawing.Size(595, 200);
            this.tableLayoutPanel4.TabIndex = 1;
            // 
            // label7
            // 
            this.label7.Anchor = System.Windows.Forms.AnchorStyles.Right;
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Segoe UI Semibold", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(264, 109);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(85, 17);
            this.label7.TabIndex = 6;
            this.label7.Text = "Date of Birth";
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.BackColor = System.Drawing.Color.MediumSpringGreen;
            this.tableLayoutPanel1.ColumnCount = 1;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tableLayoutPanel1.Controls.Add(this.tableLayoutPanel2, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.tableLayoutPanel4, 0, 0);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 2;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 49.46043F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50.53957F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(601, 417);
            this.tableLayoutPanel1.TabIndex = 4;
            // 
            // guna2Elipse1
            // 
            this.guna2Elipse1.BorderRadius = 25;
            this.guna2Elipse1.TargetControl = this;
            // 
            // EvaluationPnl
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.tableLayoutPanel1);
            this.Name = "EvaluationPnl";
            this.Size = new System.Drawing.Size(601, 417);
            this.tableLayoutPanel2.ResumeLayout(false);
            this.tableLayoutPanel3.ResumeLayout(false);
            this.tableLayoutPanel3.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.tableLayoutPanel4.ResumeLayout(false);
            this.tableLayoutPanel4.PerformLayout();
            this.tableLayoutPanel1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label label6;
        private Guna.UI2.WinForms.Guna2DateTimePicker datePkr;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel2;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel3;
        private Guna.UI2.WinForms.Guna2GradientButton clearBtn;
        private Guna.UI2.WinForms.Guna2GradientButton addBtn;
        private Guna.UI2.WinForms.Guna2GradientButton removeBtn;
        private Guna.UI2.WinForms.Guna2GradientButton updateBtn;
        private System.Windows.Forms.DataGridView dataGridView1;
        private Guna.UI2.WinForms.Guna2TextBox regNoTxtBx;
        private Guna.UI2.WinForms.Guna2TextBox fNameTxtBx;
        private Guna.UI2.WinForms.Guna2TextBox lNameTxtBx;
        private Guna.UI2.WinForms.Guna2TextBox emailTxtBx;
        private Guna.UI2.WinForms.Guna2TextBox contactTxtBx;
        private Guna.UI2.WinForms.Guna2ComboBox genderCmbBx;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel4;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private Guna.UI2.WinForms.Guna2Elipse guna2Elipse1;
    }
}
