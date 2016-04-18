package aspectos;

public aspect Logger {
	
	String ruta= "data/vehiculos_Taller.txt";
	
	pointcut logger():
		call(uniandes.cupi2.impuestosCarro.mundo.* *(..));
	
	
	before(): logger(){
		String metodo = thisJoinPointStaticPart.getSignature().toString();
		Object[] argumentos = ((Object[])thisJoinPoint.getArgs());
		Object objeto = thisJoinPoint.getTarget();

		
		System.out.println("_____________________________________");
		System.out.println("Metodo : "+metodo);
		for (int i=0 ; i< argumentos.length ; i++)
			System.out.println("Argumento "+i+" :" + argumentos[i].toString());
		System.out.println("Objeto : "  + objeto.toString());
		
		
	}	
		
	after() throwing(Throwable e): logger(){
		System.out.println("Se presento un error en la ejecución :" + e.getMessage());
	}
	

}


