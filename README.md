# NIOS II Fast - SPI

##Microprocesador NIOS II con módulo SPI
En este proyecto se puede encontrar un microcontrolador Nios II Fast, que provee Altera mediante un IP CORE, con un módulo de comunicación mediante el protocolo SPI para conecxion con otros dispositivos. 
	La imagen muestra el conexionado con de los módulos que se implementan:
  
![alt tag](https://github.com/bustosperassi/NiosII-SPI/blob/master/capturas/RTL-Qsys.png)


Se cuenta con un modulo JTAG_UART para poder debuggear las intruciones que se quieren divisar en pantalla. A su vez también tenemos un clock master para hacer trabajar a nuestro NIOS II a una frecuencia de 125 Mhz. Se cuenta con una memoria en el chip para poder guardar las intrucciones del programa. 


###Configuraciones de los módulos 
####Nios II:
![alt tag](https://github.com/bustosperassi/NiosII-SPI/blob/master/capturas/nios1.png)
![alt tag](https://github.com/bustosperassi/NiosII-SPI/blob/master/capturas/nios2.png)

####SPI:
![alt tag](https://github.com/bustosperassi/NiosII-SPI/blob/master/capturas/spi.png)

####JTAG_UART:
![alt tag](https://github.com/bustosperassi/NiosII-SPI/blob/master/capturas/jtag.png)

####MEMORY ON CHIP:
![alt tag](https://github.com/bustosperassi/NiosII-SPI/blob/master/capturas/memory.png)

##Ejecucion 
Abrir una terminal en el mismo directorio y ejecurar los siguientes comandos:
	$ sudo chmod +X script.sh </n>
	$ ./script.sh
