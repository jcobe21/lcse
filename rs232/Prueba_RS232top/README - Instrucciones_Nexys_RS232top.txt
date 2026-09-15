INSTRUCCIONES PARA PROBAR EL BLOQUE RS232 EN LA PLACA NEXYS-A7


1. USO DE LA PLACA

- Los puntos decimales de todos los displays se encienden de forma intermitente.
- Los SW(15:8) no se usan. 
- Los SW(7:0) indican el byte que se desea enviar. 
- Los LEDs(15:8) muestran el estado del sistema RS232: reset, Empty, Full, '0', TX_RDY, Ack_in, '0', '0'.
- Los LEDs(7:0) muestran el ultimo dato que se ha recibido.
- Los botones realizan las siguientes funciones:
    * UP: Lectura de la FIFO  (se activa DataRead)
    * CENTER: Envia el dato de los interruptores (se activa Valid_D)
    
**** Con esta configuración, si se pone un cable entre los pines JA[1] y JA[2], 
al pulsar en boton central (Valid_D) los datos de los interruptores (7:0) se envian de forma serie por el pin TD, 
y se reciben por el pin RD mostrándose en los LEDs (7:0).


2. FICHEROS ADICIONALES QUE SE ENTREGAN

- Nexys_RS232top.vhd   
Es el fichero que traslada los nombres de los puertos de nuestro diseño a los nombres de la Nexys A7. 
Es decir, realiza las conexiones de los nombres del RS232top a los LEDs, Switches, Displays, etc.
(incluye la conversión de la frecuencia de reloj de 100 MHz a 20MHz)

- Nexys_RS232top.xdc
Fichero de restricciones, con los componentes que se utilizan en este diseño.

- tb_nexys_RS232top.vhd
Fichero de estimulos de la placa, para la simulación con retardos. 
Contiene las conexiones de los componentes de la placa a los nombres del RS232top (es decir, invierte los cambios de nombre realizados en Nexys_RS232.vhd), 
y genera los estimulos utilizando las señales originales (es decir, el proceso de los estimulos es el mismo que el que hay en tb_RS232top.vhd). 


3. MODIFICACIONES NECESARIAS EN LOS FICHEROS DE DISEÑO

- En caso de haber incluido el divisor de frecuencia de reloj de 100MHz a 20MHz en el fichero RS232top.vhd, es necesario eliminarlo de dicho fichero
(debe estar incluido en el fichero Nexys_RS232top.vhd).

