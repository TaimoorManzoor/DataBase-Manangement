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
    public partial class Delete : Sample
    {
        public Delete()
        {
            InitializeComponent();
        }

        private void Delete_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'aSSIGNMENT01DataSet6.PROPERTY' table. You can move, or remove it, as needed.
            this.pROPERTYTableAdapter.Fill(this.aSSIGNMENT01DataSet6.PROPERTY);
            // TODO: This line of code loads data into the 'aSSIGNMENT01DataSet5.USERS' table. You can move, or remove it, as needed.
            this.uSERSTableAdapter.Fill(this.aSSIGNMENT01DataSet5.USERS);

        }

        private void button3_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=ASSIGNMENT01;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from USERS where USER_ID='"+textBox1+"'", con);
            int d = cmd.ExecuteNonQuery();
            if (d == 1)
            {
                MessageBox.Show("Data Delete");
            }
            else
            {
                MessageBox.Show("Data are not Delete");
            }
            this.uSERSTableAdapter.Fill(this.aSSIGNMENT01DataSet5.USERS);
            con.Close();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=ASSIGNMENT01;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from PROPERTY where id="+textBox2+"",con);
            int i = cmd.ExecuteNonQuery();
            if (i == 1)
            {
                MessageBox.Show("Data Delete");
            }
            else
            {
                MessageBox.Show("Data are not Delete");
            }
            this.pROPERTYTableAdapter.Fill(this.aSSIGNMENT01DataSet6.PROPERTY);
            con.Close();
        }
    }
}
