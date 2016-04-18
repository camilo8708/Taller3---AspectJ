package aspectos;


import MailSender.Mail;
import uniandes.cupi2.impuestosCarro.mundo.CalculadorImpuestos;


public aspect MailSender {
	
	
	pointcut impuesto():
		call (public double calcularPago (..));

	after() returning(Object r): impuesto(){
		if(r != null){
			System.out.println("Objeto Resultado: " +r.toString());
			
			//Envio de email
			validarImpuesto(r);
		}
		
	}
	
	
	private void validarImpuesto(Object objeto){
		
		String Subject="Notificación - Impuesto Calculado mayor a 2'000.000";
		String Mensage="Buenas Tardes Apreciado Administrador,  le informamos  que se ha calculado un impuesto con un precio mayor a 2’000.000, le agradeceríamos su respectiva validación. "
				+ "\n\nCordialmente. ";
		
		
		if((double) objeto > 2000000){
				Mail mail = new Mail();
				mail.SendMail(Subject, Mensage);
		}
	}
}


