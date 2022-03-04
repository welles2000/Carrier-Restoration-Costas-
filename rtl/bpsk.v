module bpsk
(
    input   wire        sys_clk     ,
    input   wire        sys_rst_n   ,
    input   wire        key_add     ,
    input   wire        key_sub     , 
    input   wire        key_sin_cos ,
    output  wire        dac_clk     ,
    output  reg signed  [9:0] dac_out            
);

wire seq_result;
wire signed [9:0] dacout_i;
wire signed [9:0] dacout_q;
wire   out_valid_i;
wire   out_valid_q;
reg [31:0] fre_word;
reg [15:0] pha_word_i;
reg [15:0] pha_word_q;
wire key_add_flag;
wire key_sub_flag;
//reg signed [14:0]dataout;

random_seq
#(
    .CNT_MAX(16'd500) //100k
)
random_seq_inst
(
    .sys_clk     (sys_clk   ),
    .sys_rst_n   (sys_rst_n ),
    .seq_result  (seq_result)
);

key_filter
#( 
    .CNT_MAX(20'd999_999)
)
key_filter_inst1
(
    .sys_clk     (sys_clk),
    .sys_rst_n   (sys_rst_n),
    .key_in      (key_add),
    .key_flag    (key_add_flag)
);

key_filter
#( 
    .CNT_MAX(20'd999_999)
)
key_filter_inst2
(
    .sys_clk     (sys_clk),
    .sys_rst_n   (sys_rst_n),
    .key_in      (key_sub),
    .key_flag    (key_sub_flag)
);

always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        fre_word <= 32'd85899345;
    else if(key_add_flag == 1'b1)
        fre_word <= fre_word + 32'd8589934; // 100k
    else if(key_sub_flag == 1'b1)
        fre_word <= fre_word - 32'd8589934;
    else
        fre_word <= fre_word;

always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        pha_word_i <= 16'd0;
    else if(key_sin_cos == 1'b0)
        pha_word_i <= 16'd0; // cos
    else if(key_sin_cos == 1'b1)
        pha_word_i <= 16'd16384;// sin
    else
        pha_word_i <= pha_word_i;
        
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        pha_word_q <= 16'd0;
    else if(key_sin_cos == 1'b0)
        pha_word_q <= 16'd32768; 
    else if(key_sin_cos == 1'b1)
        pha_word_q <= 16'd49152;
    else
        pha_word_q <= pha_word_q;

NCO u0 
(
	.clk         (sys_clk),         // clk.clk
	.clken       (1'b1),       //  in.clken
	.phi_inc_i   (fre_word),   // 1.2M
	.freq_mod_i  (32'd0),  //    .freq_mod_i
	.phase_mod_i (pha_word_i), //    0°
	.fsin_o      (dacout_i),      // out.fsin_o
	.out_valid   (out_valid_i),   //    .out_valid
	.reset_n     (sys_rst_n)      // rst.reset_n
);
NCO u1
(
	.clk         (sys_clk),         // clk.clk
	.clken       (1'b1),       //  in.clken
	.phi_inc_i   (fre_word),   //1.2M
	.freq_mod_i  (32'd0),  //    .freq_mod_i
	.phase_mod_i (pha_word_q), //    90°
	.fsin_o      (dacout_q),      // out.fsin_o
	.out_valid   (out_valid_q),   //    .out_valid
	.reset_n     (sys_rst_n)      // rst.reset_n
);

assign dac_clk = ~sys_clk;

always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        dac_out <= 10'd0;
    else if(seq_result == 1'b0)
        dac_out <= dacout_i;
    else if(seq_result == 1'b1)
        dac_out <= dacout_q;
        
/* add add_inst
(
    .sys_clk     (sys_clk  ),
    .sys_rst_n   (sys_rst_n),
    . din        ( dataout     ) ,
    . dout       ( dac_out    )
); */



endmodule