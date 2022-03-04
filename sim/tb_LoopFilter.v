`timescale 1ns/1ns 

module tb_LoopFilter();

reg sys_clk;
reg sys_rst_n;
reg signed[29:0]pd;
wire signed[31:0] frequency_df;

initial
    begin
        sys_clk = 1'b1;
        sys_rst_n <= 1'b0;
        pd <= 30'd30;
        #200
        sys_rst_n <= 1'b1;
        pd <= 30'd87514;
        #20000
        pd <= 30'd783845;
    end 
    
always #10 sys_clk = ~sys_clk;

LoopFilter LoopFilter_inst
(
	.rst              (sys_rst_n),
	.clk              (sys_clk         ),
	.pd               (pd          ),
	.frequency_df     (frequency_df)
);


endmodule