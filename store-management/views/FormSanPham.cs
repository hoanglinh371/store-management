using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using store_management.helpers;


namespace store_management.views
{
    public partial class FormSanPham : Form
    {
        private DatabaseConnect db = new DatabaseConnect();
        private Helper helper = new Helper();

        string fileAnh = "";
        public FormSanPham()
        {
            InitializeComponent();
        }

        private void FormSanPham_Load(object sender, EventArgs e)
        {
            LoadData();
            LoadDataGridView();
            ResetValues();
        }

        private void ResetValues()
        {
            txtMaHang.Text = "";
            txtTenHang.Text = "";
            cbChatLieu.Text = "";
            txtSoLuong.Text = "";
            txtDGN.Text = "";
            txtDGB.Text = "";
            fileAnh = "";
            picAnh.Image = null;
            txtMauSac.Text = "";
            cbBST.Text = "";
            cbNCC.Text = "";
            txtLinkAnh.Text = "";
            cbSize.Text = "";
            cbChatLieu.Text = "";
            txtSoLuong.Enabled = true;
            txtDGN.Enabled = true;
            txtDGB.Enabled = true;
            picAnh.Image = null;
            btnThem.Enabled = true;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            txtSearchColor.Text = "";
            txtSearchProduct.Text = "";
            txtSearchColor.Visible = true;
            lblColor.Visible = true;
            lblProduct.Visible = true;
            txtSearchProduct.Visible = true;
        }
        private void Empty()
        {
            txtMaHang.Text = "";
            txtTenHang.Text = "";
            cbChatLieu.Text = "";
            txtSoLuong.Text = "";
            txtDGN.Text = "";
            txtDGB.Text = "";
            txtLinkAnh.Text = "";
            fileAnh = "";
            picAnh.Image = null;
            txtMauSac.Text = "";
            cbBST.Text = "";
            cbNCC.Text = "";
            cbSize.Text = "";
            cbChatLieu.Text = "";

        }
        private void LoadData()
        {
            DataTable dtHang = db.DataReader("Select * from SanPham");
            dgvHang.DataSource = dtHang;

            helper.FillCombo("select * from ChatLieu", cbChatLieu, "MaChatLieu", "MaChatLieu");
            helper.FillCombo("select * from BoSuuTap", cbBST, "MaBST", "MaBST");
            helper.FillCombo("select * from NhaCungCap", cbNCC, "MaNCC", "MaNCC");
            helper.FillCombo("select * from Size", cbSize, "MaSize", "MaSize");
        }

        void LoadDataGridView()
        {
            string sql = "Select * from SanPham";
            dgvHang.DataSource = db.DataReader(sql);
            dgvHang.Columns[0].HeaderText = "Mã Hàng";
            dgvHang.Columns[1].HeaderText = "Tên hàng";
            dgvHang.Columns[2].HeaderText = "Đơn giá nhập";
            dgvHang.Columns[3].HeaderText = "Đơn giá bán";
            dgvHang.Columns[4].HeaderText = "Số lượng";
            dgvHang.Columns[5].HeaderText = "Ảnh";
            dgvHang.Columns[6].HeaderText = "Màu sắc";
            dgvHang.Columns[7].HeaderText = "Mã BST";
            dgvHang.Columns[8].HeaderText = "Mã Nhà cung cấp";
            dgvHang.Columns[9].HeaderText = "Mã Size";
            dgvHang.Columns[10].HeaderText = "Mã Chất liệu";
        }

        private void dgvHang_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtMaHang.Text = dgvHang.CurrentRow.Cells[0].Value.ToString();
            txtTenHang.Text = dgvHang.CurrentRow.Cells[1].Value.ToString();
            txtDGN.Text = dgvHang.CurrentRow.Cells[2].Value.ToString();
            txtDGB.Text = dgvHang.CurrentRow.Cells[3].Value.ToString();
            txtSoLuong.Text = dgvHang.CurrentRow.Cells[4].Value.ToString();
            fileAnh = dgvHang.CurrentRow.Cells[5].Value.ToString();
            txtLinkAnh.Text = dgvHang.CurrentRow.Cells[5].Value.ToString();
            txtMauSac.Text = dgvHang.CurrentRow.Cells[6].Value.ToString();  
            cbBST.Text = dgvHang.CurrentRow.Cells[7].Value.ToString();
            cbNCC.Text = dgvHang.CurrentRow.Cells[8].Value.ToString();   
            cbSize.Text = dgvHang.CurrentRow.Cells[9].Value.ToString();
            cbChatLieu.Text = dgvHang.CurrentRow.Cells[10].Value.ToString();

            try
            {
                DataTable dtHang = db.DataReader("Select * from SanPham");
                picAnh.ImageLocation = fileAnh;
            }
            catch
            {
                picAnh.Image = null;
            }

            btnThem.Enabled = false;
            btnSua.Enabled = true;
            btnXoa.Enabled = true;

        }

        // Thêm
        private void btnThem_Click(object sender, EventArgs e)
        {
            txtMaHang.Text = helper.CreateKey("SP");
        }

        // Bỏ qua
        private void btnBoqua_Click(object sender, EventArgs e)
        {
            ResetValues();
        }

        // Lưu
        private void btnLuu_Click(object sender, EventArgs e)
        {

            string sql = "";
            
            // Kiểm tra Tên Hàng
            if (txtTenHang.Text.Trim() == "")
            {
                errChiTiet.SetError(txtTenHang, "Bạn không để trống tên sản phẩm!");
                MessageBox.Show("Bạn phải nhập tên hàng", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtTenHang.Focus();
                return;
            }
            else
            {
                errChiTiet.Clear();
            }

            // Kiểm tra số lượng
            if (txtSoLuong.Text.Trim() == "")
            {
                errChiTiet.SetError(txtSoLuong, "Bạn phải nhập số lượng");
                MessageBox.Show("Không được để trống số lượng", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtSoLuong.Focus();
                return;
            }
            else
            {
                errChiTiet.Clear();
            }

            // Kiểm tra Đơn giá nhập
            if (txtDGN.Text.Trim() == "")
            {
                errChiTiet.SetError(txtDGN, "Bạn thiếu đơn giá nhập");
                MessageBox.Show("Không được để trống đơn giá nhập", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtDGN.Focus();
                return;
            }
            else
            {
                errChiTiet.Clear();
            }

            // Kiểm tra Đơn giá bán
            if (txtDGB.Text.Trim() == "")
            {
                errChiTiet.SetError(txtDGB, "Bạn thiếu đơn giá bán");
                MessageBox.Show("Không được để trống đơn giá bán", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtDGB.Focus();
                return;
            }
            else
            {
                errChiTiet.Clear();
            }

            // Kiểm tra link ảnh
            if (txtLinkAnh.Text.Trim() == "")
            {
                errChiTiet.SetError(txtLinkAnh, "Minh họa ảnh cho sản phẩm");
                MessageBox.Show("Bạn phải có ảnh minh họa cho sản phẩm", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtLinkAnh.Focus();
                return;
            }
            else
            {
                errChiTiet.Clear();
            }

            // Kiểm tra Color
            if (txtMauSac.Text.Trim() == "")
            {
                errChiTiet.SetError(txtMauSac, "Thêm màu sắc cho sản phẩm");
                MessageBox.Show("Không được để trống màu sắc", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtMauSac.Focus();
                return;
            }
            else
            {
                errChiTiet.Clear();
            }

            // Thêm mới vào DataBase
            sql = " insert into SanPham (MaSP, TenSP, DonGiaNhap, DonGiaBan, SoLuongTonKho, Anh, MauSac, MaBST, MaNCC, MaSize, MaChatLieu) " +
                 "values ('" + txtMaHang.Text + "'," +
                 "'" + txtTenHang.Text + "'," +
                 "'" + float.Parse(txtDGN.Text) + "'," +
                 "'" + float.Parse(txtDGB.Text) + "'," +
                 "'" + int.Parse(txtSoLuong.Text) + "'," +
                 "'" + txtLinkAnh.Text + "'," +
                 "'" + txtMauSac.Text + "'," +
                 "'" + cbBST.Text + "'," +
                 "'" + cbNCC.Text + "'," +
                 "'" + cbSize.Text + "', " +
                 "'" + cbChatLieu.Text + "')";

            db.DataChange(sql);
            sql = "Select * from SanPham";
            dgvHang.DataSource = db.DataReader(sql);
            Empty();
        }

        // Xóa
        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (dgvHang.Rows.Count == 0)
            {
                MessageBox.Show("Không còn dữ liệu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (txtMaHang.Text == "")
            {
                MessageBox.Show("Bạn chưa chọn bản ghi nào", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            string sql = "DELETE FROM SanPham WHERE MaSP = N'" + txtMaHang.Text + "'";
            if (MessageBox.Show("Bạn có muốn xoá bản ghi này không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes) {
                db.DataChange(sql);
                DataTable dtSP = db.DataReader(sql);
                sql = "Select * from SanPham";
                dgvHang.DataSource = db.DataReader(sql);
            }
            Empty();
        }

        // Sửa
        private void btnSua_Click(object sender, EventArgs e)
        {
            String sql;
            if (dgvHang.Rows.Count == 0)
            {
                MessageBox.Show("Không còn dữ liệu", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (txtMaHang.Text == "")
            {
                MessageBox.Show("Bạn chưa chọn bản ghi nào", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtMaHang.Focus();
                return;
            }
            if (txtTenHang.Text.Trim().Length == 0)
            {
                MessageBox.Show("Bạn phải nhập tên hàng", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtTenHang.Focus();
                return;
            }
            if (txtSoLuong.Text.Trim().Length == 0)
            {
                MessageBox.Show("Bạn phải nhập số lượng sản phẩm", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtSoLuong.Focus();
                return;
            }
            if (txtMauSac.Text.Trim().Length == 0)
            {
                MessageBox.Show("Bạn đã quên nhập màu sắc cho sản phẩm?", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtMauSac.Focus();
                return;
            }

            sql = "UPDATE SanPham SET ";
            sql += " TenSP = N'" + txtTenHang.Text.Trim().ToString() + "',";
            sql += " DonGiaNhap = N'" + float.Parse(txtDGN.Text).ToString() + "',";
            sql += " DonGiaBan = N'" + float.Parse(txtDGB.Text).ToString() + "',";
            sql += " SoLuongTonKho = N'" + int.Parse(txtSoLuong.Text).ToString() + "',";
            sql += " Anh = N'" + txtLinkAnh.Text + "',";
            sql += " MauSac = N'" + txtMauSac.Text + "',";
            sql += " MaBST = N'" + cbBST.Text  + "',";
            sql += " MaNCC = N'" + cbNCC.Text + "',";
            sql += " MaSize = N'" + cbSize.Text + "'";
            sql += " WHERE MaSP = N'" + txtMaHang.Text + "'";

            db.DataChange(sql);
            sql = " Select * from SanPham";  
            dgvHang.DataSource = db.DataReader(sql);
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn thoát không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                this.Close();
        }

        // Tìm kiếm sản phẩm
        private void txtSearchProduct_TextChanged(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM SanPham WHERE ";
            if (txtSearchProduct.Text.Length == 0)
            {
                sql = "SELECT * FROM SanPham";
            }
            else
            {
                sql += " TenSP like N'%" + txtSearchProduct.Text + "%'";
            }
            txtSearchProduct.Visible = true;
            txtSearchColor.Visible = false;
            lblColor.Visible = false;   
            dgvHang.DataSource = db.DataReader(sql);
        }
        private void txtSearchColor_TextChanged(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM SanPham WHERE ";
            if (txtSearchColor.Text.Length == 0)
            {
                sql = "SELECT * FROM SanPham";
            }
            else
            {
                sql += " MauSac like N'%" + txtSearchColor.Text + "%'";
            }
            txtSearchColor.Visible = true;
            txtSearchProduct.Visible = false;
            lblProduct.Visible = false;
            dgvHang.DataSource = db.DataReader(sql);
        }
    }
}
