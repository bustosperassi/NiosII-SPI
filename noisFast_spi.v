
module niosFast_spi(
	// Clock
	input          OSC_50_BANK2,
	// KEY
	input  [0:0] BUTTON,
	// SPI	
	output [0:0] SPI_sclk,
	output [0:0] SPI_ss,
	input  [0:0] SPI_miso,
	output [0:0] SPI_mosi
);

	wire sys_clk, core_reset_n;
	wire ss_n, sclk, miso, mosi;

	assign sclk = SPI_sclk;
	assign ss_n	= SPI_ss;
	assign mosi = SPI_mosi;
	assign miso = SPI_miso;

	pll pll_inst(
		.areset	(~BUTTON[0:0]),
		.inclk0	(OSC_50_BANK2),
		.c0		(sys_clk),
		.locked	(core_reset_n)
	);
	
   niosFspi NiosFast (
        .clk_clk       (sys_clk),      //     clk.clk
        .reset_reset_n (core_reset_n), // reset.reset_n
        .spi_out_MISO  (SPI_miso),  			// spi_out.MISO
        .spi_out_MOSI  (SPI_mosi), 			//        .MOSI
        .spi_out_SCLK  (SPI_sclk), 		   //        .SCLK
        .spi_out_SS_n  (SPI_ss)   			//        .SS_n
    );	

endmodule 

