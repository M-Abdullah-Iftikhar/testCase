namespace DBMidProject
{
    partial class AdvisorForm
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

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(AdvisorForm));
            this.tableLayoutPanel2 = new System.Windows.Forms.TableLayoutPanel();
            this.backBtn = new Guna.UI2.WinForms.Guna2GradientButton();
            this.groupsBtn = new Guna.UI2.WinForms.Guna2GradientButton();
            this.markEvaluationBtn = new Guna.UI2.WinForms.Guna2GradientButton();
            this.evaluationBtn = new Guna.UI2.WinForms.Guna2GradientButton();
            this.generateReportBtn = new Guna.UI2.WinForms.Guna2GradientButton();
            this.guna2PictureBox3 = new Guna.UI2.WinForms.Guna2PictureBox();
            this.headerLbl = new Guna.UI2.WinForms.Guna2HtmlLabel();
            this.tableLayoutPanel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.guna2PictureBox3)).BeginInit();
            this.SuspendLayout();
            // 
            // tableLayoutPanel2
            // 
            this.tableLayoutPanel2.ColumnCount = 1;
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tableLayoutPanel2.Controls.Add(this.guna2PictureBox3, 0, 0);
            this.tableLayoutPanel2.Controls.Add(this.backBtn, 0, 9);
            this.tableLayoutPanel2.Controls.Add(this.generateReportBtn, 0, 8);
            this.tableLayoutPanel2.Controls.Add(this.evaluationBtn, 0, 6);
            this.tableLayoutPanel2.Controls.Add(this.markEvaluationBtn, 0, 4);
            this.tableLayoutPanel2.Controls.Add(this.groupsBtn, 0, 2);
            this.tableLayoutPanel2.Dock = System.Windows.Forms.DockStyle.Left;
            this.tableLayoutPanel2.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel2.Name = "tableLayoutPanel2";
            this.tableLayoutPanel2.RowCount = 10;
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 23.07692F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.692307F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.692307F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.692307F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.692307F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.692307F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.692307F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.692307F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.692307F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 15.38461F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel2.Size = new System.Drawing.Size(165, 546);
            this.tableLayoutPanel2.TabIndex = 5;
            // 
            // backBtn
            // 
            this.backBtn.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.backBtn.Animated = true;
            this.backBtn.AutoRoundedCorners = true;
            this.backBtn.BackColor = System.Drawing.Color.Transparent;
            this.backBtn.BorderColor = System.Drawing.Color.Cyan;
            this.backBtn.BorderRadius = 19;
            this.backBtn.BorderThickness = 3;
            this.backBtn.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.backBtn.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.backBtn.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.backBtn.DisabledState.FillColor2 = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.backBtn.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.backBtn.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(192)))), ((int)(((byte)(192)))));
            this.backBtn.FillColor2 = System.Drawing.Color.MediumSpringGreen;
            this.backBtn.Font = new System.Drawing.Font("Segoe UI Semibold", 9F, System.Drawing.FontStyle.Bold);
            this.backBtn.ForeColor = System.Drawing.Color.Black;
            this.backBtn.Location = new System.Drawing.Point(3, 503);
            this.backBtn.Name = "backBtn";
            this.backBtn.Size = new System.Drawing.Size(80, 40);
            this.backBtn.TabIndex = 9;
            this.backBtn.Text = "Back";
            this.backBtn.Click += new System.EventHandler(this.backBtn_Click);
            // 
            // groupsBtn
            // 
            this.groupsBtn.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupsBtn.Animated = true;
            this.groupsBtn.AutoRoundedCorners = true;
            this.groupsBtn.BackColor = System.Drawing.Color.Transparent;
            this.groupsBtn.BorderColor = System.Drawing.Color.Cyan;
            this.groupsBtn.BorderRadius = 17;
            this.groupsBtn.BorderThickness = 3;
            this.groupsBtn.DefaultAutoSize = true;
            this.groupsBtn.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.groupsBtn.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.groupsBtn.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.groupsBtn.DisabledState.FillColor2 = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.groupsBtn.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.groupsBtn.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(192)))), ((int)(((byte)(192)))));
            this.groupsBtn.FillColor2 = System.Drawing.Color.MediumSpringGreen;
            this.groupsBtn.Font = new System.Drawing.Font("Segoe UI Semibold", 9F, System.Drawing.FontStyle.Bold);
            this.groupsBtn.ForeColor = System.Drawing.Color.Black;
            this.groupsBtn.Location = new System.Drawing.Point(3, 171);
            this.groupsBtn.Name = "groupsBtn";
            this.groupsBtn.Size = new System.Drawing.Size(159, 36);
            this.groupsBtn.TabIndex = 4;
            this.groupsBtn.Text = "Groups";
            // 
            // markEvaluationBtn
            // 
            this.markEvaluationBtn.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.markEvaluationBtn.Animated = true;
            this.markEvaluationBtn.AutoRoundedCorners = true;
            this.markEvaluationBtn.BackColor = System.Drawing.Color.Transparent;
            this.markEvaluationBtn.BorderColor = System.Drawing.Color.Cyan;
            this.markEvaluationBtn.BorderRadius = 17;
            this.markEvaluationBtn.BorderThickness = 3;
            this.markEvaluationBtn.DefaultAutoSize = true;
            this.markEvaluationBtn.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.markEvaluationBtn.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.markEvaluationBtn.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.markEvaluationBtn.DisabledState.FillColor2 = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.markEvaluationBtn.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.markEvaluationBtn.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(192)))), ((int)(((byte)(192)))));
            this.markEvaluationBtn.FillColor2 = System.Drawing.Color.MediumSpringGreen;
            this.markEvaluationBtn.Font = new System.Drawing.Font("Segoe UI Semibold", 9F, System.Drawing.FontStyle.Bold);
            this.markEvaluationBtn.ForeColor = System.Drawing.Color.Black;
            this.markEvaluationBtn.Location = new System.Drawing.Point(3, 255);
            this.markEvaluationBtn.Name = "markEvaluationBtn";
            this.markEvaluationBtn.Size = new System.Drawing.Size(159, 36);
            this.markEvaluationBtn.TabIndex = 6;
            this.markEvaluationBtn.Text = "Mark Evaluations";
            // 
            // evaluationBtn
            // 
            this.evaluationBtn.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.evaluationBtn.Animated = true;
            this.evaluationBtn.AutoRoundedCorners = true;
            this.evaluationBtn.BackColor = System.Drawing.Color.Transparent;
            this.evaluationBtn.BorderColor = System.Drawing.Color.Cyan;
            this.evaluationBtn.BorderRadius = 17;
            this.evaluationBtn.BorderThickness = 3;
            this.evaluationBtn.DefaultAutoSize = true;
            this.evaluationBtn.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.evaluationBtn.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.evaluationBtn.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.evaluationBtn.DisabledState.FillColor2 = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.evaluationBtn.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.evaluationBtn.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(192)))), ((int)(((byte)(192)))));
            this.evaluationBtn.FillColor2 = System.Drawing.Color.MediumSpringGreen;
            this.evaluationBtn.Font = new System.Drawing.Font("Segoe UI Semibold", 9F, System.Drawing.FontStyle.Bold);
            this.evaluationBtn.ForeColor = System.Drawing.Color.Black;
            this.evaluationBtn.Location = new System.Drawing.Point(3, 339);
            this.evaluationBtn.Name = "evaluationBtn";
            this.evaluationBtn.Size = new System.Drawing.Size(159, 36);
            this.evaluationBtn.TabIndex = 7;
            this.evaluationBtn.Text = "Evaluations";
            // 
            // generateReportBtn
            // 
            this.generateReportBtn.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.generateReportBtn.Animated = true;
            this.generateReportBtn.AutoRoundedCorners = true;
            this.generateReportBtn.BackColor = System.Drawing.Color.Transparent;
            this.generateReportBtn.BorderColor = System.Drawing.Color.Cyan;
            this.generateReportBtn.BorderRadius = 17;
            this.generateReportBtn.BorderThickness = 3;
            this.generateReportBtn.DefaultAutoSize = true;
            this.generateReportBtn.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.generateReportBtn.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.generateReportBtn.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.generateReportBtn.DisabledState.FillColor2 = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.generateReportBtn.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.generateReportBtn.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(192)))), ((int)(((byte)(192)))));
            this.generateReportBtn.FillColor2 = System.Drawing.Color.MediumSpringGreen;
            this.generateReportBtn.Font = new System.Drawing.Font("Segoe UI Semibold", 9F, System.Drawing.FontStyle.Bold);
            this.generateReportBtn.ForeColor = System.Drawing.Color.Black;
            this.generateReportBtn.Location = new System.Drawing.Point(3, 423);
            this.generateReportBtn.Name = "generateReportBtn";
            this.generateReportBtn.Size = new System.Drawing.Size(159, 36);
            this.generateReportBtn.TabIndex = 8;
            this.generateReportBtn.Text = "Generate Reports";
            // 
            // guna2PictureBox3
            // 
            this.guna2PictureBox3.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.guna2PictureBox3.BackColor = System.Drawing.Color.Transparent;
            this.guna2PictureBox3.Image = ((System.Drawing.Image)(resources.GetObject("guna2PictureBox3.Image")));
            this.guna2PictureBox3.ImageRotate = 0F;
            this.guna2PictureBox3.Location = new System.Drawing.Point(3, 3);
            this.guna2PictureBox3.Name = "guna2PictureBox3";
            this.guna2PictureBox3.Size = new System.Drawing.Size(159, 120);
            this.guna2PictureBox3.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.guna2PictureBox3.TabIndex = 13;
            this.guna2PictureBox3.TabStop = false;
            this.guna2PictureBox3.UseTransparentBackground = true;
            // 
            // headerLbl
            // 
            this.headerLbl.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.headerLbl.BackColor = System.Drawing.Color.Transparent;
            this.headerLbl.Font = new System.Drawing.Font("Script MT Bold", 36F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.headerLbl.ForeColor = System.Drawing.Color.Honeydew;
            this.headerLbl.Location = new System.Drawing.Point(296, 12);
            this.headerLbl.Name = "headerLbl";
            this.headerLbl.Size = new System.Drawing.Size(128, 74);
            this.headerLbl.TabIndex = 14;
            this.headerLbl.Text = "menu";
            // 
            // AdvisorForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Aquamarine;
            this.ClientSize = new System.Drawing.Size(862, 546);
            this.Controls.Add(this.headerLbl);
            this.Controls.Add(this.tableLayoutPanel2);
            this.Name = "AdvisorForm";
            this.Text = " ";
            this.tableLayoutPanel2.ResumeLayout(false);
            this.tableLayoutPanel2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.guna2PictureBox3)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel2;
        private Guna.UI2.WinForms.Guna2GradientButton backBtn;
        private Guna.UI2.WinForms.Guna2GradientButton groupsBtn;
        private Guna.UI2.WinForms.Guna2GradientButton markEvaluationBtn;
        private Guna.UI2.WinForms.Guna2GradientButton evaluationBtn;
        private Guna.UI2.WinForms.Guna2GradientButton generateReportBtn;
        private Guna.UI2.WinForms.Guna2PictureBox guna2PictureBox3;
        private Guna.UI2.WinForms.Guna2HtmlLabel headerLbl;
    }
}