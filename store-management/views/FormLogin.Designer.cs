namespace store_management.views
{
    partial class FormLogin
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
            this.title = new System.Windows.Forms.Label();
            this.emailLb = new System.Windows.Forms.Label();
            this.passwordLb = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.dangNhapBtn = new System.Windows.Forms.Button();
            this.thoatBtn = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // title
            // 
            this.title.AutoSize = true;
            this.title.Font = new System.Drawing.Font("Segoe UI Semibold", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.title.Location = new System.Drawing.Point(140, 23);
            this.title.Name = "title";
            this.title.Size = new System.Drawing.Size(304, 25);
            this.title.TabIndex = 0;
            this.title.Text = "PHẦN MỀM QUẢN LÝ CỬA HÀNG";
            // 
            // emailLb
            // 
            this.emailLb.AutoSize = true;
            this.emailLb.Location = new System.Drawing.Point(143, 84);
            this.emailLb.Name = "emailLb";
            this.emailLb.Size = new System.Drawing.Size(36, 15);
            this.emailLb.TabIndex = 1;
            this.emailLb.Text = "Email";
            // 
            // passwordLb
            // 
            this.passwordLb.AutoSize = true;
            this.passwordLb.Location = new System.Drawing.Point(143, 129);
            this.passwordLb.Name = "passwordLb";
            this.passwordLb.Size = new System.Drawing.Size(57, 15);
            this.passwordLb.TabIndex = 2;
            this.passwordLb.Text = "Mật khẩu";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(237, 81);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(205, 23);
            this.textBox1.TabIndex = 3;
            this.textBox1.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(237, 126);
            this.textBox2.Name = "textBox2";
            this.textBox2.PasswordChar = '*';
            this.textBox2.Size = new System.Drawing.Size(205, 23);
            this.textBox2.TabIndex = 4;
            // 
            // dangNhapBtn
            // 
            this.dangNhapBtn.Location = new System.Drawing.Point(131, 186);
            this.dangNhapBtn.Name = "dangNhapBtn";
            this.dangNhapBtn.Size = new System.Drawing.Size(97, 37);
            this.dangNhapBtn.TabIndex = 5;
            this.dangNhapBtn.Text = "Đăng nhập";
            this.dangNhapBtn.UseVisualStyleBackColor = true;
            this.dangNhapBtn.Click += new System.EventHandler(this.dangNhapBtn_Click);
            // 
            // thoatBtn
            // 
            this.thoatBtn.Location = new System.Drawing.Point(357, 186);
            this.thoatBtn.Name = "thoatBtn";
            this.thoatBtn.Size = new System.Drawing.Size(97, 37);
            this.thoatBtn.TabIndex = 7;
            this.thoatBtn.Text = "Thoát";
            this.thoatBtn.UseVisualStyleBackColor = true;
            this.thoatBtn.Click += new System.EventHandler(this.thoatBtn_Click);
            // 
            // FormLogin
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(584, 261);
            this.Controls.Add(this.thoatBtn);
            this.Controls.Add(this.dangNhapBtn);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.passwordLb);
            this.Controls.Add(this.emailLb);
            this.Controls.Add(this.title);
            this.Name = "FormLogin";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "FormLogin";
            this.Load += new System.EventHandler(this.FormLogin_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Label title;
        private Label emailLb;
        private Label passwordLb;
        private TextBox textBox1;
        private TextBox textBox2;
        private Button dangNhapBtn;
        private Button thoatBtn;
    }
}