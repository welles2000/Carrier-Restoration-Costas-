`timescale 1ns/1ns 

module tb_bpsk();

reg sys_clk;
reg sys_rst_n;
wire dac_clk ;
wire [9:0]dac_data;

initial
    begin
        sys_clk = 1'b1;
        sys_rst_n <= 1'b0;
        #200
        sys_rst_n <= 1'b1;
    end 
    
always #10 sys_clk = ~sys_clk;


bpsk bpsk_inst
(
    .sys_clk     (sys_clk  ),
    .sys_rst_n   (sys_rst_n),
    .dac_clk     (dac_clk  ),
    .dac_out     (dac_data  )       
);

endmodule