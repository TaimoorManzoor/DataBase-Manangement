using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Assignment01
{
    public partial class Assignment : Form
    {
        public Assignment()
        {
            InitializeComponent();
        }

        private void Assignment_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'aSSIGNMENT01DataSet11.users' table. You can move, or remove it, as needed.
            this.usersTableAdapter1.Fill(this.aSSIGNMENT01DataSet11.users);
            // TODO: This line of code loads data into the 'aSSIGNMENT01DataSet10.property' table. You can move, or remove it, as needed.
            this.propertyTableAdapter1.Fill(this.aSSIGNMENT01DataSet10.property);
            // TODO: This line of code loads data into the 'aSSIGNMENT01DataSet4.PROPERTY' table. You can move, or remove it, as needed.
         //   this.pROPERTYTableAdapter.Fill(this.aSSIGNMENT01DataSet4.PROPERTY);
           
           // TODO: This line of code loads data into the 'aSSIGNMENT01DataSet3.USERS' table. You can move, or remove it, as needed.

           // this.uSERSTableAdapter.Fill(this.aSSIGNMENT01DataSet3.USERS);
    
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=ASSIGNMENT01;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into USERS values('"+UserID.Text+"','"+Address.Text+"','"+PhoneNumber.Text+"',"+Age.Text+")", con);
            int i = cmd.ExecuteNonQuery();
            if (i == 1)
            {
                MessageBox.Show("Data Record");
            }
            else
            {
                MessageBox.Show("Data are not Record");
            }
            this.usersTableAdapter1.Fill(this.aSSIGNMENT01DataSet11.users);
            con.Close();
        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=ASSIGNMENT01;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into property values("+PropertyID.Text+",'"+Type.Text+"',"+Price.Text+",'"+Location.Text+ "','"+CoveredArea.Text+"',"+NumberOfRoom.Text+",'"+user_id.Text+"')",con);   
            int C = cmd.ExecuteNonQuery();
            if (C == 1)
            {
                MessageBox.Show("Data Record");
            }
            else
            {
                MessageBox.Show("Data are not Record");
            }
               this.propertyTableAdapter1.Fill(this.aSSIGNMENT01DataSet10.property);
            con.Close();
        }
        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Hide();
            Delete delete = new Delete();
            delete.Show();
        }

        private void Update_Click(object sender, EventArgs e)
        {
            this.Hide();
            UPDATE update = new UPDATE();
            update.Show();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=ASSIGNMENT01;Integrated Security=True");
            con.Open();
            SqlDataAdapter adapter = new SqlDataAdapter("Select * from property where type='"+textBox1.Text+"'", con);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            dataGridView1.DataSource = dt;
            this.propertyTableAdapter1.Fill(this.aSSIGNMENT01DataSet10.property);
            con.Close();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=ASSIGNMENT01;Integrated Security=True");
            con.Open();
            SqlDataAdapter adapter = new SqlDataAdapter("Select * from property where price='" + textBox2.Text + "'", con);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            dataGridView1.DataSource = dt;
            this.propertyTableAdapter1.Fill(this.aSSIGNMENT01DataSet10.property);
            con.Close();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=ASSIGNMENT01;Integrated Security=True");
            con.Open();
            SqlDataAdapter adapter = new SqlDataAdapter("Select * from property where Location='" + textBox3.Text + "'", con);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            dataGridView1.DataSource = dt;
            this.propertyTableAdapter1.Fill(this.aSSIGNMENT01DataSet10.property);
            con.Close();
        }

        private void Address_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
