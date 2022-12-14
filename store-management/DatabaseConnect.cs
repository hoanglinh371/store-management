using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
 
namespace store_management
{
    internal class DatabaseConnect
    {
        public string connectionString = "Data Source=DESKTOP-OFKKE4R\\SQLEXPRESS;Initial Catalog=crown_store_dev;Integrated Security=True";
        public SqlConnection connect = new SqlConnection();

        public void Open()
        {
            connect = new SqlConnection(connectionString);
            if (connect.State != ConnectionState.Open)
            {
                connect.Open();
            }
        }

        void Close()
        {
            if (connect.State != ConnectionState.Closed)
            {
                connect.Close();
                connect.Dispose();
            }
        }

        public DataTable DataReader(string sql)
        {
            DataTable dt = new DataTable();
            Open();
            SqlDataAdapter res = new SqlDataAdapter(sql, connect);
            res.Fill(dt);
            Close();
            return dt;
        }

        public void DataChange(string sql)
        {
            Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = connect;
            cmd.CommandText = sql;
            cmd.ExecuteNonQuery();
            Close();
        }
    }
}
