module phase_detect
(
    input   wire        sys_clk                ,
    input   wire        sys_rst_n              ,
    input   wire signed [31:0] di              , //i路输入
    input   wire signed [31:0] dq              ,
    output  wire signed [31:0] pd
);

reg [31:0] pdout;
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        pdout <= 32'd0;
    else begin
        if(di[31])
            pdout <= -dq;
        else
            pdout <= dq;
    end 
    
assign pd = pdout;
        

endmodule
