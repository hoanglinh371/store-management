using store_management.helpers;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.ComponentModel.Design.ObjectSelectorEditor;

namespace store_management.views
{
    public partial class FormKhachHang : Form
    {
        private DatabaseConnect db = new DatabaseConnect();
        private Helper helper = new Helper();
        public FormKhachHang()
        {
            InitializeComponent();
        }

        private void FormKhachHang_Load(object sender, EventArgs e)
        {
            loadDataGridView();
            HienChiTiet(false);
            btnThem.Enabled = true;
            btnLuu.Enabled = false;
            btnXoa.Enabled = false;
            btnSua.Enabled = false;
            btnDong.Enabled = true;
        }
        private void HienChiTiet(bool hien)
        {
            groupBox1.Enabled = hien;
            txtMaKH.Enabled = hien;
            txtTenKH.Enabled = hien;
            txtDiaChi.Enabled = hien;
            txtSDT.Enabled = hien;
        }
        private void Reset()
        {
            txtTenKH.Text = "";
            txtDiaChi.Text = "";
            txtSDT.Text = "";
            txtTenKH.Focus(); 
        }
        private void loadDataGridView()
        {
            string sql = "SELECT * FROM KhachHang";
            dgvKhachHang.DataSource = db.DataReader(sql);
            dgvKhachHang.Columns[0].HeaderText = "Mã Khách Hàng";
            dgvKhachHang.Columns[1].HeaderText = "Tên Khách Hàng";
            dgvKhachHang.Columns[2].HeaderText = "Địa Chỉ";
            dgvKhachHang.Columns[3].HeaderText = "Số Điện Thoại";
            dgvKhachHang.AllowUserToAddRows = false;
            dgvKhachHang.EditMode = DataGridViewEditMode.EditProgrammatically;
        }
        private void btnThem_Click(object sender, EventArgs e)
        {
            txtMaKH.Text = helper.CreateKey("KH");
            HienChiTiet(true);
            btnXoa.Enabled = false;
            btnLuu.Enabled = true;
            btnSua.Enabled = false;
            Reset();
        }
        private void btnLuu_Click(object sender, EventArgs e)
        {
            string sql = "";
            if (btnThem.Enabled == true)
            {
                    if (txtMaKH.Text.Length == 0)
                    {
                        MessageBox.Show("Bạn phải nhập mã khách hàng", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        txtMaKH.Focus();
                        return;
                    }
                    if (txtTenKH.Text.Length == 0)
                    {
                        MessageBox.Show("Bạn phải nhập tên khách hàng", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        txtTenKH.Focus();
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

                    sql = "INSERT INTO KhachHang(MaKH, TenKH, DiaChi, SDT) " +
                        "VALUES ('" + txtMaKH.Text + "'," +
                        "'" + txtTenKH.Text + "'," +
                        "'" + txtDiaChi.Text + "'," +
                        "'" + txtSDT.Text + "')";
                    db.DataChange(sql);
                    sql = "SELECT * FROM KhachHang";
                    dgvKhachHang.DataSource = db.DataReader(sql);
                    Reset();
            }
        }
        private void btnXoa_Click(object sender, EventArgs e)
        {   
            string sql = "DELETE FROM KhachHang WHERE MaKH = N'" + txtMaKH.Text + "'";
            if (MessageBox.Show("Bạn có chắc chắn xóa mã khach hang không ?" + txtMaKH.Text + "  Nếu có ấn nút Yes, không thì ấn nút No",
                "Xóa sản phẩm", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                db.DataChange(sql);
                sql = "SELECT * FROM KhachHang";
                dgvKhachHang.DataSource = db.DataReader(sql);
                Reset();
            }
        }
        private void dgvKhachHang_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            btnSua.Enabled = true;
            btnXoa.Enabled = true;
            btnThem.Enabled = false;
            btnLuu.Enabled = false;
            txtMaKH.Text = dgvKhachHang.CurrentRow.Cells[0].Value.ToString();
            txtTenKH.Text = dgvKhachHang.CurrentRow.Cells[1].Value.ToString();
            txtDiaChi.Text = dgvKhachHang.CurrentRow.Cells[2].Value.ToString();
            txtSDT.Text = dgvKhachHang.CurrentRow.Cells[3].Value.ToString();
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            String sql;
            sql = "UPDATE KhachHang SET ";
            sql += " TenKH = N'" + txtTenKH.Text + "',";
            sql += " DiaChi = N'" + txtDiaChi.Text + "',";
            sql += " SDT = N'" + txtSDT.Text + "' ";
            sql += " WHERE MaKH = N'" + txtMaKH.Text + "'";
            db.DataChange(sql);
            sql = "SELECT * FROM KhachHang";
            dgvKhachHang.DataSource = db.DataReader(sql);
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM KhachHang WHERE ";
            if(txtTKTenKH.Text.Length == 0 && txtTKSDT.Text.Length == 0)
            {
                sql = "SELECT * FROM KhachHang";
            }
            else if (txtTKTenKH.Text.Length == 0 && txtTKSDT.Text.Length == 0)
            {
                MessageBox.Show("Bạn phải nhập tên hoặc SDT khách hàng cần tìm kiếm", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtTKTenKH.Focus();                 
                return;
            }
            else
            {
                if(txtTKTenKH.Text.Length != 0 && txtTKSDT.Text.Length != 0)
                {
                    sql += " TenKH like N'%" + txtTKTenKH.Text + "'";
                    sql += " and SDT like N'%" + txtTKSDT.Text + "'";
                }
                else if(txtTKTenKH.Text.Length != 0)
                {
                    sql += " TenKH like N'%" + txtTKTenKH.Text + "'";
                }
                else if (txtTKSDT.Text.Length != 0)
                {
                    sql += " SDT like N'%" + txtTKSDT.Text + "'";
                }          
            } 
            dgvKhachHang.DataSource = db.DataReader(sql);
        }

        private void btnDong_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
