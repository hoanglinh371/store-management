using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store_management.helpers
{
    class Helper
    {
        DatabaseConnect db = new DatabaseConnect();
        public void FillCombo(string sql, ComboBox cb, string display, string value)
        {
            SqlDataAdapter res = new SqlDataAdapter(sql, db.connectionString);
            DataTable table = new DataTable();
            res.Fill(table);
            cb.DataSource = table;
            cb.ValueMember = value;
            cb.DisplayMember = display;
        }

        public string GetFieldValues(string sql)
        {
            string ma = "";
            SqlCommand cmd = new SqlCommand(sql, db.connect);
            SqlDataReader reader;
            db.Open();
            reader = cmd.ExecuteReader();
            while (reader.Read())
                ma = reader.GetValue(0).ToString();
            reader.Close();
            return ma;
        }

        public string CreateKey(string prefix)
        {
            string ramdomNumber = DateTime.Now.ToFileTime().ToString();
            string randTxt = String.Join(',', ramdomNumber);
            string key = prefix + ramdomNumber.Substring(5, 12);
            return key;
        }

        public bool CheckKey(string sql)
        {
            SqlDataAdapter dap = new SqlDataAdapter(sql, db.connectionString);
            DataTable table = new DataTable();
            dap.Fill(table);
            if (table.Rows.Count > 0)
                return true;
            else return false;
        }

    }
}
