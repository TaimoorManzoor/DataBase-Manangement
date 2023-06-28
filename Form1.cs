using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
namespace Taimoor0021
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'lAB_08DataSet.DATA' table. You can move, or remove it, as needed.
            this.dATATableAdapter.Fill(this.lAB_08DataSet.DATA);

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=LAB_08;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into data values(" + textBox1.Text + ",'" + textBox2.Text + "'," + textBox3.Text + ")", con);
            int i = cmd.ExecuteNonQuery();
            if (i == 1)
            {
                MessageBox.Show("Data Record");
            }
            else
            {
                MessageBox.Show("Data are not Record");
            }
            this.dATATableAdapter.Fill(this.lAB_08DataSet.DATA);
            con.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=LAB_08;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from data where id ="+textBox1.Text+"",con);
            int i = cmd.ExecuteNonQuery();
            if (i == 1)
            {
                MessageBox.Show("Data Delete");
            }
            else
            {
                MessageBox.Show("Data are not Delete");
            }
            this.dATATableAdapter.Fill(this.lAB_08DataSet.DATA);
            con.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=LAB_08;Integrated Security=True");
            con.Open();
            SqlCommand query = new SqlCommand("UPDATE data SET Name ='"+textBox2.Text+"',age =" + textBox3.Text + " WHERE ID =" + textBox1.Text + "",con);
            int i= query.ExecuteNonQuery();
            if (i == 1)
            {
                MessageBox.Show("Data Update");
            }
            else
            {
                MessageBox.Show("Data are not Update");
            }
            this.dATATableAdapter.Fill(this.lAB_08DataSet.DATA);
            con.Close();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=LAB_08;Integrated Security=True");    
            SqlCommand query = new SqlCommand("Select id,age ,name from data where AGE>="+textBox3.Text+"",con);
            DataTable dt = new DataTable();
            con.Open();
            SqlDataReader reader = query.ExecuteReader();   
            dt.Load(reader);
            int i = query.ExecuteNonQuery();
            this.dATATableAdapter.Fill(this.lAB_08DataSet.DATA);
            con.Close();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}

