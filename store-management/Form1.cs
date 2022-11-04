using store_management.helpers;
using System.Data;
using COMExcel = Microsoft.Office.Interop.Excel;

namespace store_management
{
    public partial class Form1 : Form
    {
        private DatabaseConnect db = new DatabaseConnect();
        private Helper helper = new Helper();

        public Form1()
        {
            InitializeComponent();
        }

        // other functions
        private void ResetValues()
        {
            txtMaHoaDon.Text = "";
            txtNgayBan.Text = DateTime.Now.ToShortDateString();
            cbMaNV.Text = "";
            cbMaKH.Text = "";
            txtTongTien.Text = "0";
            // lblBangChu.Text = "Bằng chữ: ";
            cbMaHang.Text = "";
            txtSoLuong.Text = "";
            txtGiamGia.Text = "0";
            txtThanhTien.Text = "0";
        }

        private void ResetValuesHang()
        {
            cbMaHang.Text = "";
            txtSoLuong.Text = "";
            txtGiamGia.Text = "0";
            txtThanhTien.Text = "0";
        }

        void LoadStaff()
        {
            string sql = "SELECT * FROM NhanVien";
            helper.FillCombo(sql, cbMaNV, "MaNV", "MaNV");
            cbMaNV.SelectedIndex = -1;
        }

        void LoadCustomer()
        {
            string sql = "SELECT * FROM KhachHang";
            helper.FillCombo(sql, cbMaKH, "MaKH", "MaKH");
            cbMaKH.SelectedIndex = -1;
        }

        void LoadProduct()
        {
            string sql = "SELECT * FROM SanPham";
            helper.FillCombo(sql, cbMaHang, "MaSP", "MaSP");
            cbMaHang.SelectedIndex = -1;
        }

        void LoadSaleReceipt()
        {
            string sql = "SELECT * FROM HoaDonBan";
            helper.FillCombo(sql, cbMaDonHang, "SoHDB", "SoHDB");
            cbMaDonHang.SelectedIndex = -1;
        }

        void LoadDataGridView()
        {
            string sql = "SELECT CTHDB.MaSP, SP.TenSP, CTHDB.SLBan, SP.DonGiaBan, CTHDB.GiamGia, CTHDB.ThanhTien " +
                "FROM ChiTietHDB AS CTHDB " +
                "INNER JOIN SanPham AS SP ON CTHDB.MaSP = SP.MaSP " +
                "WHERE CTHDB.SoHDB = '" + txtMaHoaDon.Text + "'";
            dataGridView1.DataSource = db.DataReader(sql);
            dataGridView1.Columns[0].HeaderText = "Mã Hàng";
            dataGridView1.Columns[1].HeaderText = "Tên hàng";
            dataGridView1.Columns[2].HeaderText = "Số lượng";
            dataGridView1.Columns[3].HeaderText = "Đơn giá";
            dataGridView1.Columns[4].HeaderText = "Giảm giá";
            dataGridView1.Columns[5].HeaderText = "Thành tiền";
        }

        void LoadInfoSaleReceipt()
        {
            string sql = "SELECT NgayBan FROM HoaDonBan WHERE SoHDB = '" + txtMaHoaDon.Text + "'";
            txtNgayBan.Text = helper.GetFieldValues(sql);
            sql = "SELECT MaNV FROM HoaDonBan WHERE SoHDB = '" + txtMaHoaDon.Text + "'";
            cbMaNV.Text = helper.GetFieldValues(sql);
            sql = "SELECT MaKH FROM HoaDonBan WHERE SoHDB = '" + txtMaHoaDon.Text + "'";
            cbMaKH.Text = helper.GetFieldValues(sql);
            sql = "SELECT TriGia FROM HoaDonBan WHERE SoHDB = '" + txtMaHoaDon.Text + "'";
            txtTongTien.Text = helper.GetFieldValues(sql);
        }

        // handle form events
        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            Environment.Exit(1);
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            LoadStaff();
            LoadCustomer();
            LoadProduct();
            LoadDataGridView();
            LoadSaleReceipt();
            btnThem.Enabled = true;
            btnLuu.Enabled = false;
            btnXoa.Enabled = false;
            btnIn.Enabled = false;
            txtGiamGia.Text = "0";
            txtThanhTien.Text = "0";
            cbMaNV.Enabled = false;
            cbMaKH.Enabled = false;
            cbMaHang.Enabled = false;
            txtGiamGia.Enabled = false;
            txtSoLuong.Enabled = false;
        }

        // handle combox events
        private void cbMaNV_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sql = "SELECT TenNV FROM NhanVien WHERE MaNV = '" + cbMaNV.SelectedValue + "'";
            txtTenNV.Text = helper.GetFieldValues(sql);
        }

        private void cbMaKH_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sql = "SELECT TenKH FROM KhachHang WHERE MaKH = '" + cbMaKH.SelectedValue + "'";
            txtTenKH.Text = helper.GetFieldValues(sql);

            sql = "SELECT DiaChi FROM KhachHang WHERE MaKH = '" + cbMaKH.SelectedValue + "'";
            txtDiaChi.Text = helper.GetFieldValues(sql);

            sql = "SELECT SDT FROM KhachHang WHERE MaKH = '" + cbMaKH.SelectedValue + "'";
            txtSDT.Text = helper.GetFieldValues(sql);
        }

        private void cbMaHang_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sql = "SELECT TenSP FROM SanPham WHERE MaSP = '" + cbMaHang.SelectedValue + "'";
            txtTenHang.Text = helper.GetFieldValues(sql);

            sql = "SELECT DonGiaBan FROM SanPham WHERE MaSP = '" + cbMaHang.SelectedValue + "'";
            txtDonGia.Text = helper.GetFieldValues(sql);
        }

        // handle button events
        private void btnThem_Click(object sender, EventArgs e)
        {
            txtMaHoaDon.Text = helper.CreateKey("HDB");
            btnXoa.Enabled = false;
            btnLuu.Enabled = true;
            btnIn.Enabled = false;
            btnThem.Enabled = false;

            cbMaNV.Enabled = true;
            cbMaKH.Enabled = true;
            cbMaHang.Enabled = true;
            txtGiamGia.Enabled = true;
            txtSoLuong.Enabled = true;
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            btnIn.Enabled = true;
            btnXoa.Enabled = true;
            string sql;
            double quantity, total, newTotal;
            sql = "SELECT SoHDB FROM HoaDonBan WHERE SoHDB = '" + txtMaHoaDon.Text + "'";
            if (!helper.CheckKey(sql))
            {
                if (txtNgayBan.Text.Length == 0)
                {
                    MessageBox.Show("Bạn phải nhập ngày bán", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    txtNgayBan.Focus();
                    return;
                }
                if (cbMaNV.Text.Length == 0)
                {
                    MessageBox.Show("Bạn phải nhập nhân viên", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    cbMaNV.Focus();
                    return;
                }
                if (cbMaKH.Text.Length == 0)
                {
                    MessageBox.Show("Bạn phải nhập khách hàng", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    cbMaKH.Focus();
                    return;
                }
                sql = "INSERT INTO HoaDonBan(SoHDB, MaNV, MaKH, NgayBan, TriGia) " +
                    "VALUES ('" + txtMaHoaDon.Text.Trim() + "'," +
                    "'" + cbMaNV.SelectedValue + "'," +
                    "'" + cbMaKH.SelectedValue + "'," +
                    "'" + txtNgayBan.Value + "'," +
                    "'" + txtTongTien.Text + "'" +
                    ")";
                db.DataChange(sql);
            }

            if (cbMaHang.Text.Trim().Length == 0)
            {
                MessageBox.Show("Bạn phải nhập mã hàng", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                cbMaHang.Focus();
                return;
            }
            if ((txtSoLuong.Text.Trim().Length == 0) || (txtSoLuong.Text == "0"))
            {
                MessageBox.Show("Bạn phải nhập số lượng", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtSoLuong.Text = "";
                txtSoLuong.Focus();
                return;
            }
            if (txtGiamGia.Text.Trim().Length == 0)
            {
                MessageBox.Show("Bạn phải nhập giảm giá", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtGiamGia.Focus();
                return;
            }
            sql = "SELECT MaSP FROM ChiTietHDB " +
                "WHERE MaSP = '" + cbMaHang.SelectedValue + "'" + " AND SoHDB = '" + txtMaHoaDon.Text + "'";
            if (helper.CheckKey(sql))
            {
                MessageBox.Show("Mã hàng này đã có, bạn phải nhập mã khác", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                cbMaHang.Focus();
                return;
            }
            quantity = Convert.ToDouble(helper.GetFieldValues("SELECT SoLuongTonKho FROM SanPham " +
                                                              "WHERE id = '" + cbMaHang.SelectedValue + "'"));
            if (Convert.ToDouble(txtSoLuong.Text) > quantity)
            {
                MessageBox.Show("Số lượng mặt hàng này chỉ còn " + quantity,
                                    "Thông báo",
                                    MessageBoxButtons.OK,
                                    MessageBoxIcon.Information
                                );
                txtSoLuong.Text = "";
                txtSoLuong.Focus();
                return;
            }
            sql = "INSERT INTO ChiTietHDB(SoHDB, MaSP, SLBan, DonGia, GiamGia, ThanhTien) " +
                "VALUES (" +
                "'" + txtMaHoaDon.Text + "'," +
                "'" + cbMaHang.SelectedValue + "'," +
                "'" + txtSoLuong.Text + "'," +
                "'" + txtDonGia.Text + "'," +
                "'" + txtGiamGia.Text + "'," +
                "'" + txtThanhTien.Text + "'" +
                ")";
            db.DataChange(sql);
            LoadDataGridView();
            total = Convert.ToDouble(helper.GetFieldValues("SELECT TriGia FROM HoaDonBan" +
                                                           " where id = '" + txtMaHoaDon.Text + "'"));
            newTotal = total + Convert.ToDouble(txtThanhTien.Text);
            sql = "UPDATE HoaDonBan SET TriGia = '" + newTotal + "'" +
                    "WHERE SoHDB = '" + txtMaHoaDon.Text + "'";
            db.DataChange(sql);
            txtTongTien.Text = newTotal.ToString();
            lbTotalByString.Text = "Bằng chữ: " + helper.ConvertNumberToString(newTotal);
            ResetValuesHang();
        }

        private void btnDong_Click(object sender, EventArgs e)
        {
            Environment.Exit(1);
        }

        private void btnIn_Click(object sender, EventArgs e)
        {
            COMExcel.Application exApp = new COMExcel.Application();
            COMExcel.Workbook exBook; // Workbook
            COMExcel.Worksheet exSheet; // Worksheet
            COMExcel.Range exRange;
            string sql;
            int hang = 0, cot = 0;
            DataTable tblThongtinHD, tblThongtinHang;
            exBook = exApp.Workbooks.Add(COMExcel.XlWBATemplate.xlWBATWorksheet);
            exSheet = exBook.Worksheets[1];
            // format
            exRange = exSheet.Cells[1, 1];
            exRange.Range["A1:Z300"].Font.Name = "Times new roman";
            exRange.Range["A1:B3"].Font.Size = 10;
            exRange.Range["A1:B3"].Font.Bold = true;
            exRange.Range["A1:B3"].Font.ColorIndex = 5; //Màu xanh da trời
            exRange.Range["A1:A1"].ColumnWidth = 7;
            exRange.Range["B1:B1"].ColumnWidth = 15;
            exRange.Range["A1:B1"].MergeCells = true;
            exRange.Range["A1:B1"].HorizontalAlignment = COMExcel.XlHAlign.xlHAlignCenter;
            exRange.Range["A1:B1"].Value = "CrWN Store";
            exRange.Range["A2:B2"].MergeCells = true;
            exRange.Range["A2:B2"].HorizontalAlignment = COMExcel.XlHAlign.xlHAlignCenter;
            exRange.Range["A2:B2"].Value = "Thanh Xuân, Hà Nội";
            exRange.Range["A3:B3"].MergeCells = true;
            exRange.Range["A3:B3"].HorizontalAlignment = COMExcel.XlHAlign.xlHAlignCenter;
            exRange.Range["A3:B3"].Value = "Điện thoại: 0393113485";
            exRange.Range["C2:E2"].Font.Size = 16;
            exRange.Range["C2:E2"].Font.Bold = true;
            exRange.Range["C2:E2"].Font.ColorIndex = 3; //Màu đỏ
            exRange.Range["C2:E2"].MergeCells = true;
            exRange.Range["C2:E2"].HorizontalAlignment = COMExcel.XlHAlign.xlHAlignCenter;
            exRange.Range["C2:E2"].Value = "HÓA ĐƠN BÁN";
            // sale_receipt infomations
            sql = "SELECT HDB.SoHDB, HDB.NgayBan, HDB.TriGia, KH.TenKH, KH.DiaChi, KH.SDT, NV.TenNV " +
                "FROM HoaDonBan AS HDB " +
                "INNER JOIN KhachHang AS KH ON HDB.MaKH = KH.MaKH " +
                "INNER JOIN NhanVien AS NV ON HDB.MaNV = NV.MaNV " +
                "WHERE HDB.SoHDB = N'" + txtMaHoaDon.Text + "'";
            tblThongtinHD = db.DataReader(sql);
            exRange.Range["B6:C9"].Font.Size = 12;
            exRange.Range["B6:B6"].Value = "Mã hóa đơn:";
            exRange.Range["C6:E6"].MergeCells = true;
            exRange.Range["C6:E6"].Value = tblThongtinHD.Rows[0][0].ToString();
            exRange.Range["B7:B7"].Value = "Khách hàng:";
            exRange.Range["C7:E7"].MergeCells = true;
            exRange.Range["C7:E7"].Value = tblThongtinHD.Rows[0][3].ToString();
            exRange.Range["B8:B8"].Value = "Địa chỉ:";
            exRange.Range["C8:E8"].MergeCells = true;
            exRange.Range["C8:E8"].Value = tblThongtinHD.Rows[0][4].ToString();
            exRange.Range["B9:B9"].Value = "Điện thoại:";
            exRange.Range["C9:E9"].MergeCells = true;
            exRange.Range["C9:E9"].Value = tblThongtinHD.Rows[0][5].ToString();
            // sale_receipt_detail infomations
            sql = "SELECT SP.TenSP, HDB.SLBan, SP.DonGiaBan, HDB.GiamGia, HDB.ThanhTien " +
                  "FROM ChiTietHDB AS HDB " +
                  "INNER JOIN SanPham AS SP ON HDB.MaSP = SP.MaSP " +
                  "WHERE HDB.SoHDB = N'" + txtMaHoaDon.Text + "'";
            tblThongtinHang = db.DataReader(sql);
            // title
            exRange.Range["A11:F11"].Font.Bold = true;
            exRange.Range["A11:F11"].HorizontalAlignment = COMExcel.XlHAlign.xlHAlignCenter;
            exRange.Range["C11:F11"].ColumnWidth = 12;
            exRange.Range["A11:A11"].Value = "STT";
            exRange.Range["B11:B11"].Value = "Tên hàng";
            exRange.Range["C11:C11"].Value = "Số lượng";
            exRange.Range["D11:D11"].Value = "Đơn giá";
            exRange.Range["E11:E11"].Value = "Giảm giá";
            exRange.Range["F11:F11"].Value = "Thành tiền";
            for (hang = 0; hang < tblThongtinHang.Rows.Count; hang++)
            {
                // fill # into col-1 from row-12
                exSheet.Cells[1][hang + 12] = hang + 1;
                for (cot = 0; cot < tblThongtinHang.Columns.Count; cot++)
                // fill product from col-2, row-12
                {
                    exSheet.Cells[cot + 2][hang + 12] = tblThongtinHang.Rows[hang][cot].ToString();
                    if (cot == 3) exSheet.Cells[cot + 2][hang + 12] = tblThongtinHang.Rows[hang][cot].ToString() + "%";
                }
            }
            exRange = exSheet.Cells[cot][hang + 14];
            exRange.Font.Bold = true;
            exRange.Value2 = "Tổng tiền:";
            exRange = exSheet.Cells[cot + 1][hang + 14];
            exRange.Font.Bold = true;
            exRange.Value2 = tblThongtinHD.Rows[0][2].ToString();
            exRange = exSheet.Cells[1][hang + 15]; //Ô A1 
            exRange.Range["A1:F1"].MergeCells = true;
            exRange.Range["A1:F1"].Font.Bold = true;
            exRange.Range["A1:F1"].Font.Italic = true;
            exRange.Range["A1:F1"].HorizontalAlignment = COMExcel.XlHAlign.xlHAlignRight;
            // exRange.Range["A1:F1"].Value = "Bằng chữ: " + helper.ConvertNumberToString(tblThongtinHD.Rows[0][2].ToString());
            exRange = exSheet.Cells[4][hang + 17]; //Ô A1 
            exRange.Range["A1:C1"].MergeCells = true;
            exRange.Range["A1:C1"].Font.Italic = true;
            exRange.Range["A1:C1"].HorizontalAlignment = COMExcel.XlHAlign.xlHAlignCenter;
            DateTime d = Convert.ToDateTime(tblThongtinHD.Rows[0][1]);
            exRange.Range["A1:C1"].Value = "Hà Nội, ngày " + d.Day + " tháng " + d.Month + " năm " + d.Year;
            exRange.Range["A2:C2"].MergeCells = true;
            exRange.Range["A2:C2"].Font.Italic = true;
            exRange.Range["A2:C2"].HorizontalAlignment = COMExcel.XlHAlign.xlHAlignCenter;
            exRange.Range["A2:C2"].Value = "Nhân viên bán hàng";
            exRange.Range["A6:C6"].MergeCells = true;
            exRange.Range["A6:C6"].Font.Italic = true;
            exRange.Range["A6:C6"].HorizontalAlignment = COMExcel.XlHAlign.xlHAlignCenter;
            exRange.Range["A6:C6"].Value = tblThongtinHD.Rows[0][6];
            exSheet.Name = "Hóa đơn bán";
            exApp.Visible = true;
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            btnXoa.Enabled = true;
            if (cbMaDonHang.Text == "")
            {
                MessageBox.Show("Bạn phải chọn một mã hóa đơn để tìm",
                                "Thông báo",
                                MessageBoxButtons.OK,
                                MessageBoxIcon.Information
                                );
                cbMaHang.Focus();
                return;
            }
            txtMaHoaDon.Text = cbMaDonHang.Text;
            LoadInfoSaleReceipt();
            LoadDataGridView();
            btnDong.Enabled = true;
            btnLuu.Enabled = true;
            btnIn.Enabled = true;
            cbMaHang.SelectedIndex = -1;
        }
        
        // handle textbox events
        private void txtSoLuong_TextChanged(object sender, EventArgs e)
        {
            double tt, sl, dg, gg; // thanhTien, soLuong, donGia, giamGia
            if (txtSoLuong.Text == "")
                sl = 0;
            else
                sl = Convert.ToDouble(txtSoLuong.Text);
            if (txtGiamGia.Text == "")
                gg = 0;
            else
                gg = Convert.ToDouble(txtGiamGia.Text);
            if (txtDonGia.Text == "")
                dg = 0;
            else
                dg = Convert.ToDouble(txtDonGia.Text);
            tt = sl * dg - sl * dg * gg / 100;
            txtThanhTien.Text = tt.ToString();
        }

        private void txtGiamGia_TextChanged(object sender, EventArgs e)
        {
            double tt, sl, dg, gg; // thanhTien, soLuong, donGia, giamGia
            if (txtSoLuong.Text == "")
                sl = 0;
            else
                sl = Convert.ToDouble(txtSoLuong.Text);
            if (txtGiamGia.Text == "")
                gg = 0;
            else
                gg = Convert.ToDouble(txtGiamGia.Text);
            if (txtDonGia.Text == "")
                dg = 0;
            else
                dg = Convert.ToDouble(txtDonGia.Text);
            tt = sl * dg - sl * dg * gg / 100;
            txtThanhTien.Text = tt.ToString();
        }

        private void txtSoLuong_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!Char.IsDigit(e.KeyChar) && !Char.IsControl(e.KeyChar))
                e.Handled = true;
        }

        private void txtGiamGia_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!Char.IsDigit(e.KeyChar) && !Char.IsControl(e.KeyChar))
                e.Handled = true;
        }

        // handle datagridview events
        private void dataGridView1_DoubleClick(object sender, EventArgs e)
        {
            string MaHangXoa, sql;
            double ThanhTienXoa, SLXoa, SL, SLCon, Tong, TongMoi;

            var res = MessageBox.Show("Bạn có chắc chắn muốn xóa không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (res == DialogResult.Yes)
            {
                MaHangXoa = dataGridView1.CurrentRow.Cells["product_id"].Value.ToString();
                SLXoa = Convert.ToDouble(dataGridView1.CurrentRow.Cells["quantity"].Value.ToString());
                ThanhTienXoa = Convert.ToDouble(dataGridView1.CurrentRow.Cells["unit_price"].Value.ToString());

                sql = "delete sale_receipt_detail" +
                    " where sale_receipt_id = '" + txtMaHoaDon.Text + "' and product_id = '" + MaHangXoa + "'";
                db.DataChange(sql);
                // TODO: update quantity for product
                Tong = Convert.ToDouble(helper.GetFieldValues("SELECT total from sale_receipt" +
                                                                " where id = '" + txtMaHoaDon.Text + "'"));
                TongMoi = Tong - ThanhTienXoa;
                sql = "update sale_receipt set total = '" + TongMoi +
                        "' where id = '" + txtMaHoaDon.Text + "'";
                db.DataChange(sql);
                txtTongTien.Text = TongMoi.ToString();
                LoadDataGridView();
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            double sl, slcon, slxoa;
            if (MessageBox.Show("Bạn có chắc chắn muốn xóa không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                string sql = "SELECT MaSP, SLBan FROM ChiTietHDB " +
                             "WHERE SoHDB = '" + txtMaHoaDon.Text + "'";
                DataTable tblHang = db.DataReader(sql);
                for (int hang = 0; hang <= tblHang.Rows.Count - 1; hang++)
                {
                    // Cập nhật lại số lượng cho các mặt hàng
                    sl = Convert.ToDouble(helper.GetFieldValues("SELECT inventory from product" +
                        " where id = '" + tblHang.Rows[hang][0].ToString() + "'"));
                    slxoa = Convert.ToDouble(tblHang.Rows[hang][1].ToString());
                    slcon = sl + slxoa;
                    sql = "update product set inventory =" + slcon + 
                        " where id = '" + tblHang.Rows[hang][0].ToString() + "'";
                    db.DataChange(sql);
                }

                //Xóa chi tiết hóa đơn
                sql = "DELETE ChiTietHDB WHERE SoHDB = '" + txtMaHoaDon.Text + "'";
                db.DataChange(sql);

                //Xóa hóa đơn
                sql = "DELETE HoaDonBan WHERE SoHDB = '" + txtMaHoaDon.Text + "'";
                db.DataChange(sql);
                ResetValues();
                LoadDataGridView();
                btnXoa.Enabled = false;
                btnIn.Enabled = false;
            }
        }

    }
}