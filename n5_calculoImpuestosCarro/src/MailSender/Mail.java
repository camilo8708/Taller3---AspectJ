package MailSender;

import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {
	public void SendMail(String Subject, String Mensage) {
		String Username = "FABRICAS.MISO@GMAIL.COM";
		String PassWord = "*123456789*";
		String To = "FABRICAS.MISO@GMAIL.COM";
		
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props,
				new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(Username, PassWord);
			}
		});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(Username));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(To));
			message.setSubject(Subject);
			message.setText(Mensage);

			Transport.send(message);

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}
