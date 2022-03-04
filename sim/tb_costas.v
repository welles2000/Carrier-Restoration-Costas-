`timescale 1ns/1ns 

module tb_costas();

reg sys_clk;
reg sys_rst_n;
reg key_add;
reg key_sub;
reg key_sin_cos;
wire dac_clk ;
wire [7:0]dac_data;
wire[36:0]  demod_ob;

initial
    begin
        sys_clk = 1'b1;
        sys_rst_n <= 1'b0;
        key_add <= 1'b1;
        key_sub <= 1'b1;
        key_sin_cos <= 1'b0;
        #200
        sys_rst_n <= 1'b1;
    end 
    
always #10 sys_clk = ~sys_clk;


costas costas_inst
(
    .sys_clk         (sys_clk  ),
    .sys_rst_n       (sys_rst_n),
    .key_add         (key_add  ),
    .key_sub         (key_sub  ),
    .key_sin_cos     (key_sin_cos),
    .dac_clk         (dac_clk  ),
    .dac_data        (dac_data ),
    .demod_ob        (demod_ob)
);

endmodule
