#------------------------------------------------------------------------------
#              SCRIPT PROYECT NIOS II - SPI (4 WIRES)
#------------------------------------------------------------------------------
export PATH=/opt/altera/16.0/quartus/sopc_builder/bin:/opt/altera/16.0/nios2eds/sdk2/bin:/opt/altera/16.0/nios2eds/bin:/opt/altera/16.0/nios2eds/bin/gnu/H-x86_64-pc-linux-gnu/bin:$PATH

export LM_LICENSE_FILE=1800@192.168.1.10

#Generar Qsys 
echo "Generando Qsys"
qsys-generate niosFspi.qsys --export-qsys-script --synthesis --clear-output-directory --output-directory=./socQsys

#Compilar proyecto
echo "Compilando Quartus"
quartus_cmd niosf_spi.qpf -c niosf_spi.qsf
nios2-bsp hal ./software/niosf_spi_bsp
mkdir 

#Compilando Software
echo "Compilando Quartus"
cd ./app
make
cd ..

#Quemar pastilla 
echo "Bajando a placa archivo .sof"
cd ./output_files
nios2-configure-sof niosf_spi.sof 
cd ..

#Bajar Software
pwd
echo "Bajando a placa software .elf"
cd app
nios2-download -g NiosIIfSPI.elf
pwd
cd ..
pwd

#Ver en consola
nios2-terminal
