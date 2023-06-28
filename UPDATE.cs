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
    public partial class UPDATE : Sample
    {
        public UPDATE()
        {
            InitializeComponent();
        }

        private void UPDATE_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'aSSIGNMENT01DataSet9.USERS' table. You can move, or remove it, as needed.
            this.uSERSTableAdapter.Fill(this.aSSIGNMENT01DataSet9.USERS);
            // TODO: This line of code loads data into the 'aSSIGNMENT01DataSet8.PROPERTY' table. You can move, or remove it, as needed.
            this.pROPERTYTableAdapter.Fill(this.aSSIGNMENT01DataSet8.PROPERTY);

        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=ASSIGNMENT01;Integrated Security=True");
            con.Open();
            SqlCommand query = new SqlCommand("UPDATE users SET Address='"+Address.Text+"',Phone_number='"+PhoneNumber.Text+"',Age="+Age+"WHERE User_ID ='"+UserID.Text+"'", con);
            int i = query.ExecuteNonQuery();
            if (i == 1)
            {
                MessageBox.Show("Data Update");
            }
            else
            {
                MessageBox.Show("Data are not Update");
            }
            con.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=ASSIGNMENT01;Integrated Security=True");
            con.Open();
            SqlCommand query = new SqlCommand("UPDATE Property SET ID ="+PropertyID.Text+",Type='"+Type.Text+"',Location='"+Location+"',Covered_Area='"+CoveredArea.Text+"',NUMBER_OF_ROOMS="+NumberOfRoom.Text+" WHERE user_ID ="+UserID.Text+"", con);
            int i = query.ExecuteNonQuery();
            if (i == 1)
            {
                MessageBox.Show("Data Update");
            }
            else
            {
                MessageBox.Show("Data are not Update");
            }
            con.Close();
        }

        private void PropertyID_TextChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
