using store_management.helpers;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace store_management.views
{
    public partial class Dashboard : Form
    {
        private DatabaseConnect db = new DatabaseConnect();
        private Helper h = new Helper();
        string name = "";

        public Dashboard(string name) : this()
        {
            this.name = name;
        }
       
        public Dashboard()
        {
            InitializeComponent();
        }

        private void formNhanVienBtn_Click(object sender, EventArgs e)
        {
            FormNhanVien form = new FormNhanVien();
            form.Show();
        }

        private void formKhachHangBtn_Click(object sender, EventArgs e)
        {
            FormKhachHang form = new FormKhachHang();
            form.Show();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            FormHoaDonBan form = new FormHoaDonBan();
            form.Show();
        }

        private void Dashboard_Load(object sender, EventArgs e)
        {
            string sql = "SELECT COUNT(MaKH) AS v FROM KhachHang";
            var res = db.DataReader(sql);
            label9.Text = res.Rows[0][0].ToString();

            sql = "SELECT COUNT(MaNV) AS v FROM NhanVien";
            res = db.DataReader(sql);
            label15.Text = res.Rows[0][0].ToString();

            sql = "SELECT SUM(TriGia) FROM HoaDonNhap WHERE YEAR(NgayNhap) = '2022'";
            res = db.DataReader(sql);
            label16.Text = res.Rows[0][0].ToString() + " VND";

            sql = "SELECT SUM(TriGia) FROM HoaDonBan WHERE YEAR(NgayBan) = '2022'";
            res = db.DataReader(sql);
            label7.Text = res.Rows[0][0].ToString() + " VND";

            sql = "SELECT SUM(SLBan) FROM ChiTietHDB";
            res = db.DataReader(sql);
            label14.Text = res.Rows[0][0].ToString();

            sql = "SELECT COUNT(MaSP) FROM SanPham";
            res = db.DataReader(sql);
            label8.Text = res.Rows[0][0].ToString();

            label17.Text = "Xin chào, " + name;
        }

        private void Dashboard_FormClosing(object sender, FormClosingEventArgs e)
        {
            Environment.Exit(1);
        }

        private void dangXuatBtn_Click(object sender, EventArgs e)
        {
            FormLogin form = new FormLogin();
            form.Show();
            this.Hide();
        }
    }
}
 