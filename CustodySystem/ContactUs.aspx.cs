using System;
using System.Net.Mail;


namespace CustodySystem
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    MailMessage mailMessage = new MailMessage();
                    mailMessage.From = new MailAddress("shoo00og@hotmail.com");
                    mailMessage.To.Add("shoo00og@hotmail.com");
                    mailMessage.Subject = txtSubject.Text;

                    mailMessage.Body = "<b>Sender Name : </b>" + txtName.Text + "<br/>" + "<b> Sender Email : </b>" + txtEmail.Text + "<br/>" + "<b>Sender Comments : </b>" + txtComments.Text;
                    mailMessage.IsBodyHtml = true;
                    SmtpClient smtpClient = new SmtpClient("smtp.live.com", 25);
                    smtpClient.EnableSsl = true;
                    smtpClient.Credentials = new System.Net.NetworkCredential("shoo00og@hotmail.com", "ahbk5555");
                    smtpClient.Send(mailMessage);
                    Label1.ForeColor = System.Drawing.Color.Blue;
                    Label1.Text = "Thank You For Contacting Us";
                    txtName.Enabled = false;
                    txtEmail.Enabled = false;
                    txtComments.Enabled = false;
                    txtSubject.Enabled = false;
                    Button1.Enabled = false;
                }
            }
            catch (Exception ex)
            {
                //log - event viewer or table
                Label1.ForeColor = System.Drawing.Color.Blue;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = " There Is Unkwon Problem Please Try Later ):";

            }
        }
    }
}