package aspectos;

import org.aspectj.lang.ProceedingJoinPoint;

import uniandes.cupi2.impuestosCarro.mundo.CalculadorImpuestos;

public aspect ReadFile {
	
	String rutaTaller= "data/vehiculos_Taller.txt";
	
	
	pointcut cargaArchivo(CalculadorImpuestos archivo, String ruta):
		call (private void cargarVehiculos(String))  && target(archivo) && args(ruta);
	
	
	void around(CalculadorImpuestos archivo, String ruta): cargaArchivo(archivo, ruta){
		proceed(archivo, ruta);
		ruta = rutaTaller;
		proceed(archivo, ruta);
	} 
	
}


