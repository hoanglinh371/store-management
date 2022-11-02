using store_management.helpers;

namespace store_management
{
    public partial class Form1 : Form
    {
        private DatabaseConnect db = new DatabaseConnect();
        private Helper helper = new Helper();
        void LoadStaff()
        {
            string sql = "select * from staff";
            helper.FillCombo(sql, cbMaNV, "id", "id");
            cbMaNV.SelectedIndex = -1;
        }

        void LoadCustomer()
        {
            string sql = "select * from customer";
            helper.FillCombo(sql, cbMaKH, "id", "id");
            cbMaKH.SelectedIndex = -1;
        }

        void LoadProduct()
        {
            string sql = "select * from product";
            helper.FillCombo(sql, cbMaHang, "id", "id");
            cbMaHang.SelectedIndex = -1;
        }

        void LoadDataGridView()
        {
            string sql = "select d.product_id, p.name, d.quantity, p.sale_price, d.discount, d.unit_price " +
                "from sale_receipt_detail as d " +
                "inner join product as p " +
                "on d.product_id = p.id " +
                "where d.sale_receipt_id = '" + txtMaHoaDon.Text + "'";
            dataGridView1.DataSource = db.DataReader(sql);
            dataGridView1.Columns[0].HeaderText = "Mã Hàng";
            dataGridView1.Columns[1].HeaderText = "Tên hàng";
            dataGridView1.Columns[2].HeaderText = "Số lượng";
            dataGridView1.Columns[3].HeaderText = "Đơn giá";
            dataGridView1.Columns[4].HeaderText = "Giảm giá";
            dataGridView1.Columns[5].HeaderText = "Thành tiền";
        }

        public Form1()
        {
            InitializeComponent();
        }

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
            btnThem.Enabled = true;
            btnLuu.Enabled = false;
            btnHuy.Enabled = false;
            btnIn.Enabled = false;
            txtGiamGia.Text = "0";
            txtThanhTien.Text = "0";
        }

        private void cbMaNV_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sql = "select name from staff where id = '" + cbMaNV.SelectedValue + "'";
            txtTenNV.Text = helper.GetFieldValues(sql);
        }

        private void cbMaKH_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sql = "select name from customer where id = '" + cbMaKH.SelectedValue + "'";
            txtTenKH.Text = helper.GetFieldValues(sql);

            sql = "select address from customer where id = '" + cbMaKH.SelectedValue + "'";
            txtDiaChi.Text = helper.GetFieldValues(sql);

            sql = "select phone_number from customer where id = '" + cbMaKH.SelectedValue + "'";
            txtSDT.Text = helper.GetFieldValues(sql);
        }

        private void cbMaHang_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sql = "select name from product where id = '" + cbMaHang.SelectedValue + "'";
            txtTenHang.Text = helper.GetFieldValues(sql);

            sql = "select sale_price from product where id = '" + cbMaHang.SelectedValue + "'";
            txtDonGia.Text = helper.GetFieldValues(sql);
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            txtMaHoaDon.Text = helper.CreateKey("HDB");
            btnHuy.Enabled = false;
            btnLuu.Enabled = true;
            btnIn.Enabled = false;
            btnThem.Enabled = false;
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            string sql;
            double quantity, total, newTotal;
            sql = "select id from sale_receipt where id = '" + txtMaHoaDon.Text + "'";
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
                sql = "insert into sale_receipt(id, staff_id, customer_id, sale_date, total) " +
                    "values ('" + txtMaHoaDon.Text.Trim() + "'," +
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
            sql = "select product_id from sale_receipt_detail where product_id = '" + cbMaHang.SelectedValue + "' " +
                "and sale_receipt_id = '" + txtMaHoaDon.Text + "'";
            if (helper.CheckKey(sql))
            {
                MessageBox.Show("Mã hàng này đã có, bạn phải nhập mã khác", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                cbMaHang.Focus();
                return;
            }
            quantity = Convert.ToDouble(helper.GetFieldValues("SELECT amount FROM product WHERE id = '" + cbMaHang.SelectedValue + "'"));
            if (Convert.ToDouble(txtSoLuong.Text) > quantity)
            {
                MessageBox.Show("Số lượng mặt hàng này chỉ còn " + quantity, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtSoLuong.Text = "";
                txtSoLuong.Focus();
                return;
            }
            sql = "insert into sale_receipt_detail(sale_receipt_id, product_id, quantity, price, discount, unit_price) " +
                "values (" +
                "'" + txtMaHoaDon.Text + "'," +
                "'" + cbMaHang.SelectedValue + "'," +
                "'" + txtSoLuong.Text + "'," +
                "'" + txtDonGia.Text + "'," +
                "'" + txtGiamGia.Text + "'," +
                "'" + txtThanhTien.Text + "'" +
                ")";
            label19.Text = sql;
            db.DataChange(sql);
            LoadDataGridView();
        }

    }
}