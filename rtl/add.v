module add
(
    input   wire                sys_clk     ,
    input   wire                sys_rst_n   ,
    input   wire signed [7:0]          din         ,
    output  reg [7:0]    dout
);

always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        dout <= 8'd0;
    else
        dout <= din + 8'd128;

endmodule