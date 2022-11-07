using store_management.helpers;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace store_management.views
{
    public partial class FormLogin : Form
    {
        private DatabaseConnect db = new DatabaseConnect();
        private Helper helper = new Helper();

        public FormLogin()
        {
            InitializeComponent();
        }

        private void textBox1_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (textBox1.Text.Length == 0)
            {
                dangNhapBtn.Enabled = false;
            } else
            {
                dangNhapBtn.Enabled = true;
            }
        }

        private void FormLogin_Load(object sender, EventArgs e)
        {
            dangNhapBtn.Enabled = false;
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            if (textBox1.Text.Length == 0)
            {
                dangNhapBtn.Enabled = false;
            }
            else
            {
                dangNhapBtn.Enabled = true;
            }
        }

        private void dangNhapBtn_Click(object sender, EventArgs e)
        {
            string email = textBox1.Text;
            string password = textBox2.Text;
            string sql = "SELECT * FROM NhanVien WHERE email = '" + email + "' AND password = '" + password + "\'";
            var res = db.DataReader(sql);
            if (res.Rows.Count != 0)
            {
                MessageBox.Show("Đăng nhập thành công!", "Thông báo", MessageBoxButtons.OK);
                Dashboard dashboard = new Dashboard(res.Rows[0][1].ToString());
                this.Hide();
                dashboard.Show();
            } else
            {
                MessageBox.Show("Email hoặc mật khẩu không đúng!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void thoatBtn_Click(object sender, EventArgs e)
        {
            Environment.Exit(1);
        }
    }
}
