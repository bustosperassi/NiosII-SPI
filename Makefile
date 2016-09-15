#------------------------------------------------------------------------------
#              MAKEFILE PROYECT NIOS II - SPI (4 WIRES)
#------------------------------------------------------------------------------

export PATH=/opt/altera/16.0/quartus/sopc_builder/bin:/opt/altera/16.0/nios2eds/sdk2/bin:/opt/altera/16.0/nios2eds/bin:/opt/altera/16.0/nios2eds/bin/gnu/H-x86_64-pc-linux-gnu/bin:$PATH
export LM_LICENSE_FILE=1800@192.168.1.10

#Generar Qsys 
#qsys: niosFspi.qsys
#	qsys-generate niosFspi.qsys --export-qsys-script  --clear-output-directory --output-directory=./socQsys

#Compilar proyecto
#quartus: 
	#quartus_cmd niosf_spi.qpf -c niosf_spi.qsf

#Compilar HAL
	mkdir -p ./software/niosf_spi_bsp
	nios2-bsp hal ./software/niosf_spi_bsp

#Quemar pastilla 
	nios2-configure-sof niosf_spi.sof 

#Bajar Software
	nios2-download -g NiosIISPI.elf

#Ver en consola
	nios2-terminal
