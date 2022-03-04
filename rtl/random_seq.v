module random_seq
#(
    parameter CNT_MAX = 16'd49999
)
(
    input   wire        sys_clk     ,
    input   wire        sys_rst_n   ,
    output  reg         seq_result
);


reg [15:0]   cnt;
reg clk_flag; //分频
reg [3:0]seq_flag;

always@(posedge clk_flag or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        seq_flag <= 4'd0;
    else if(seq_flag == 15)
        seq_flag <= 4'd0;
    else
        seq_flag <= seq_flag + 4'd1;
        
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        cnt <= 16'd0;
    else if(cnt == CNT_MAX)
        cnt <= 16'd0;
    else 
        cnt <= cnt + 1;
        
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        clk_flag <= 1'b0;
    else if(cnt == (CNT_MAX - 1))
        clk_flag <= 1'b1;
    else 
        clk_flag <= 1'b0;
        
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        seq_result <= 1'b0;
    else if(clk_flag == 1'b1)
        case(seq_flag)
            4'd0: seq_result <= 1'b0;
            4'd1: seq_result <= 1'b1;
            4'd2: seq_result <= 1'b0;
            4'd3: seq_result <= 1'b0;
            4'd4: seq_result <= 1'b1;
            4'd5: seq_result <= 1'b1;
            4'd6: seq_result <= 1'b0;
            4'd7: seq_result <= 1'b1;
            4'd8: seq_result <= 1'b1;
            4'd9: seq_result <= 1'b1;
            4'd10:seq_result <= 1'b0;
            4'd11:seq_result <= 1'b1;
            4'd12:seq_result <= 1'b0;
            4'd13:seq_result <= 1'b0;
            4'd14:seq_result <= 1'b1;
            4'd15:seq_result <= 1'b1;
            default:seq_result <= 1'b0;
        endcase
endmodule        