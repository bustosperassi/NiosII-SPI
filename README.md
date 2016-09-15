# NIOS II Fast - SPI

##Microprocesador NIOS II con módulo SPI
En este proyecto se puede encontrar un microcontrolador Nios II Fast, que provee Altera mediante un IP CORE, con un módulo de comunicación mediante el protocolo SPI para conecxión con otros dispositivos. 
	La imagen muestra el conexionado con de los módulos que se implementan:
  
![alt tag](https://raw.githubusercontent.com/bustosperassi/niosii-spi/master/capturas/RTL-Qsys.png)

###Configuraciones de los IP-CORE's 

####Nios II:
Nios II es una arquitectura de procesador embebido 32 bits diseñado específicamente para el Altera familia de FPGAs . Nios II incorpora muchas mejoras con respecto a la arquitectura original nios, por lo que es más adecuado para una gama más amplia de aplicaciones informáticas integradas, de DSP para el sistema de control.
Para este proyecto funciona en una velicidad de 125 Mhz y sin MMU. Las configuraciones que se muestran a continuación son las más importantes para este proyecto, ya que las demás quedan por defecto en su uso.	
	
![alt tag](https://raw.githubusercontent.com/bustosperassi/niosii-spi/master/capturas/nios1.png)

	
![alt tag](https://raw.githubusercontent.com/bustosperassi/niosii-spi/master/capturas/nios2.png)
Nota: No se activa la memoria cache.

 https://www.altera.com/en_US/pdfs/literature/hb/nios2/n2cpu_nii5v1.pdf

####JTAG_UART:
Este Ip Core se utiliza para poder varias funciones, dentro de las cuales se utiliza para grabar los archivos como el .sof (hardware) y el .elf(software), a su vez poder ver las impresiones por pantallas que nos arroja el microprocesador.
Su configuración es la siguiente:


![alt tag](https://raw.githubusercontent.com/bustosperassi/niosii-spi/master/capturas/jtag.png)


####MEMORY ON CHIP:
Se necesta una memoria en las cuales se van a alojar las instruciones y datos del microprocesador:

	
![alt tag](https://raw.githubusercontent.com/bustosperassi/niosii-spi/master/capturas/memory.png)


####SPI:
El SPI es un protocolo síncrono que trabaja en modo full duplex para recibir y transmitir información, permitiendo que dos dispositivos pueden comunicarse entre sí al mismo tiempo utilizando canales diferentes o líneas diferentes en el mismo cable. Al ser un protocolo síncrono el sistema cuenta con una línea adicional a la de datos encarga de llevar el proceso de sincronismo.

![alt tag](https://raw.githubusercontent.com/bustosperassi/niosii-spi/master/capturas/spi.png)

El maestro para este tutorial es el NIOS II y para el esclavo se utilizó una placa de desarrollo EVB-6002
Los pines selecionados para la transmision-recepción de datos y envio de clock y selector de esclavo son los siguientes:

![alt tag](https://raw.githubusercontent.com/bustosperassi/niosii-spi/master/capturas/j4-FPGA-pinesSPI.png)

La señal sobre la línea de reloj (SCLK) es generada por el maestro y sincroniza la transferencia de datos.
La línea MOSI (Master Out Slave In) transporta los datos del maestro hacia el esclavo.
La línea MISO (Master In Slave Out) transporta los datos del esclavo hacia el maestro. 
Cada esclavo es seleccionado por un nivel lógico bajo (‘0’) a través de la línea (CS = Chip Select o SS Slave Select ). 

###### Para más información el siguiente link es el Datasheet de cada IP CORE:

 https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/ug/ug_embedded_ip.pdf

####MainSPI.c:
Este archivo contiene el codigo que se implemento en este trabajo, el cual socilita de manera cíclica la lectura de los registros del esclavo en este caso, son 128 registro leído del chip LMS6002.
La siguiente función es la única que nos provee Altera para la comunicación entre un maesto y un esclavo mediante SPI:

	alt_avalon_spi_command(SPI_BASE , NUMBER_SLAVE , WRITE_SIZE , &write_data, READ_SIZE , &recv , 0);

donde los argumentos que se le pasa son:
 
1. Dirección de memoria del dispositivo maestro local.
2. Número de esclavo con el cual se quiere cominunicar.
3. Cantidad de bytes de datos a enviar.
4. Puntero donde se encuentra la infomación a enviar.
5. Cantidad de bytes de datos a recibir.
6. Puntero donde se encuentra la variable en donde se recibiran lo datos.
7. Flags para el uso propio del SPI.

##Ejecución:
Una vez clonado el proyecto, abrir una terminal en el mismo directorio y ejecurar los siguientes comandos:

	$ sudo chmod +x script.sh 

	$ ./script.sh


![alt tag](https://raw.githubusercontent.com/bustosperassi/niosii-spi/master/capturas/logoLCD.jpg) 
