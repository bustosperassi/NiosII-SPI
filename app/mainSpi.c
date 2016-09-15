#include "alt_types.h"
#include "sys/alt_stdio.h"
#include "stdio.h"
#include "system.h"
#include "altera_avalon_spi.h"
#include "altera_avalon_spi_regs.h"

#define NUMBER_SLAVE 	0
#define WRITE_SIZE		1 //cantidad de bytes a enviar
#define READ_SIZE		1 //cantidad de bytes a recibir

int main()
{
	alt_printf("Hello from Nios II - SPI\n");
	//Registros para enviar y recibir
	alt_u8  write_data= 0x00;
	alt_u8 recv=0;
	int j=0;

	/*-----Rutina lee los 128 registros-----*/
	while(1)
	{
		(alt_avalon_spi_command(SPI_BASE , NUMBER_SLAVE , WRITE_SIZE , &write_data, READ_SIZE , &recv , 0));
		for (j=0; j<1000000; j++){}
		printf("Reg: %i  Valor: %i  \n", write_data , recv );
		write_data +=1;
		if (write_data==128) write_data=0;
	}
  return 0;
}
