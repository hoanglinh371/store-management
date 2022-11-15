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
    public partial class FormNhanVien : Form
    {
        private DatabaseConnect db = new DatabaseConnect();
        private Helper helper = new Helper();
        public FormNhanVien()
        {
            InitializeComponent();
        }
        private void AddComboBox()
        {
            var dict = new Dictionary<int, string>();
            dict.Add(0, "Nữ");
            dict.Add(1, "Nam");
            cbGioiTinh.DataSource = new BindingSource(dict, null);
            cbGioiTinh.DisplayMember = "Value";
            cbGioiTinh.ValueMember = "Key";
        }

        private void FormNhanVien_Load(object sender, EventArgs e)
        {
            loadDataGridView();
            AddComboBox();
            btnThem.Enabled = true;
            btnLuu.Enabled = false;
            btnXoa.Enabled = false;
            btnSua.Enabled = false;
            btnDong.Enabled = true;         
            HienChiTiet(false);
        }

        private void loadDataGridView()
        {
            string sql = "SELECT * FROM DSNV";
            dgvNhanVien.DataSource = db.DataReader(sql);
            dgvNhanVien.Columns[0].HeaderText = "Mã Nhân Viên";
            dgvNhanVien.Columns[1].HeaderText = "Tên Nhân Viên";
            dgvNhanVien.Columns[2].HeaderText = "Ngày Sinh";
            dgvNhanVien.Columns[3].HeaderText = "Giới Tính";
            dgvNhanVien.Columns[4].HeaderText = "Địa Chỉ";
            dgvNhanVien.Columns[5].HeaderText = "Số Điện Thoại";
            //dgvNhanVien.AllowUserToAddRows = false;
            //dgvNhanVien.EditMode = DataGridViewEditMode.EditProgrammatically;
        }
        private void HienChiTiet(bool hien)
        {
            groupBox1.Enabled = hien;
            txtMaNV.Enabled = hien;
            txtTenNV.Enabled = hien;
            dtpNgaySinh.Enabled = hien;
            cbGioiTinh.Enabled = hien;
            txtDiaChi.Enabled = hien;
            txtSDT.Enabled = hien;
        }
        private void Reset()
        {
            txtTenNV.Text = "";
            txtDiaChi.Text = "";
            txtSDT.Text = "";
            dtpNgaySinh.Value = DateTime.Today;
            txtTenNV.Focus();
        }
         private void dgvNhanVien_CellClick_1(object sender, DataGridViewCellEventArgs e)
        {
            btnSua.Enabled = true;
            btnXoa.Enabled = true;
            btnThem.Enabled = false;
            btnLuu.Enabled = false;
            txtMaNV.Text = dgvNhanVien.CurrentRow.Cells[0].Value.ToString();
            txtTenNV.Text = dgvNhanVien.CurrentRow.Cells[1].Value.ToString();
            dtpNgaySinh.Value = (DateTime)dgvNhanVien.CurrentRow.Cells[2].Value;
            cbGioiTinh.Text = dgvNhanVien.CurrentRow.Cells[3].Value.ToString();
            txtDiaChi.Text = dgvNhanVien.CurrentRow.Cells[4].Value.ToString();
            txtSDT.Text = dgvNhanVien.CurrentRow.Cells[5].Value.ToString();
        }
        private void btnThem_Click_1(object sender, EventArgs e)
        {
            txtMaNV.Text = helper.CreateKey("NV");
            HienChiTiet(true);
            btnXoa.Enabled = false;
            btnLuu.Enabled = true;
            btnSua.Enabled = false;
            Reset();
        }

        private void btnLuu_Click_1(object sender, EventArgs e)
        {
            string sql = "";
            if (btnThem.Enabled == true)
            {
                if (txtMaNV.Text.Length == 0)
                {
                    MessageBox.Show("Bạn phải nhập mã nhân viên", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    txtMaNV.Focus();
                    return;
                }
                if (txtTenNV.Text.Length == 0)
                {
                    MessageBox.Show("Bạn phải nhập tên nhân viên", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    txtTenNV.Focus();
                    return;
                }
                if (txtDiaChi.Text.Length == 0)
                {
                    MessageBox.Show("Bạn phải nhập địa chỉ", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    txtDiaChi.Focus();
                    return;
                }
                if (txtSDT.Text.Length == 0)
                {
                    MessageBox.Show("Bạn phải nhập số điện thoại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    txtSDT.Focus();
                    return;
                }

                sql = "INSERT INTO NhanVien(MaNV, TenNV, NgaySinh, GioiTinh, DiaChi, SDT) " +
                    "VALUES ('" + txtMaNV.Text + "'," +
                    "'" + txtTenNV.Text + "'," +
                    "'" + dtpNgaySinh.Value.ToString("yyyy-MM-dd") + "'," +
                    "'" + cbGioiTinh.SelectedValue + "'," +
                    "'" + txtDiaChi.Text + "'," +
                    "'" + txtSDT.Text + "')";
                db.DataChange(sql);
                sql = "SELECT * FROM DSNV";
                dgvNhanVien.DataSource = db.DataReader(sql);
                Reset();
            }
        }    
        private void btnXoa_Click_1(object sender, EventArgs e)
        {
            string sql = "DELETE FROM NhanVien WHERE MaNV = N'" + txtMaNV.Text + "'";
            if (MessageBox.Show("Bạn có chắc chắn xóa mã nhân viên không ?" + txtMaNV.Text + "  Nếu có ấn nút Yes, không thì ấn nút No",
                "Xóa sản phẩm", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                db.DataChange(sql);
                DataTable dtSP = db.DataReader(sql);
                sql = "SELECT * FROM DSNV";
                dgvNhanVien.DataSource = db.DataReader(sql);
                Reset();
            }
        }
        private void btnSua_Click(object sender, EventArgs e)
        {
            string sql;
            sql = "UPDATE NhanVien SET ";
            sql += " TenNV = N'" + txtTenNV.Text + "',";
            sql += " NgaySinh = '" + dtpNgaySinh.Value.ToString("yyyy-MM-dd") + "',";
            sql += " DiaChi = N'" + txtDiaChi.Text + "',";
            sql += " SDT = N'" + txtSDT.Text + "' ";
            sql += " WHERE MaNV = N'" + txtMaNV.Text + "'";
            db.DataChange(sql);
            sql = "SELECT * FROM DSNV";
            dgvNhanVien.DataSource = db.DataReader(sql);
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM DSNV WHERE ";
            if(txtTKTenNV.Text.Length == 0)
            {
                sql = "SELECT * FROM DSNV";
            }
            else if (txtTKTenNV.Text.Length == 0)
            {
                MessageBox.Show("Bạn phải nhập tên nhân viên cần tìm kiếm", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtTKTenNV.Focus();
                return;
            } else
            {
                sql += " TenNV like N'%" + txtTKTenNV.Text + "%'";
            }
            dgvNhanVien.DataSource = db.DataReader(sql);
        }

        private void btnDong_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
