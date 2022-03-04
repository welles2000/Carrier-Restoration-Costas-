module costas
(
    input   wire        sys_clk         ,
    input   wire        sys_rst_n       ,
    input   wire        key_add         ,
    input   wire        key_sub         ,
    input   wire        key_sin_cos     ,
    output  wire        dac_pd          ,
    output  wire        dac_clk         ,
    output  wire[7:0]   dac_data        ,
    output  wire[36:0]  demod_ob        
);

//f = F_WORD * 2^32 * (f/fclk)
//p = P_WORD * (360 / 2^16)

wire signed [9:0] psk_out_buf;
wire signed [7:0]  psk_out;
wire signed [31:0] frequency_df;
wire signed [9:0] dataout_i;
wire signed [9:0] dataout_q;
wire   out_valid;
wire signed[17:0] mul_res1;
wire signed[17:0] mul_res2;
wire signed [36:0] lpf_data1;
wire signed [36:0] lpf_data2;
wire signed[31:0] phase_detect_res;
wire	    lpf_valid;
wire [1:0]	lpf_error;
wire[31:0] lpfdata_out1;
wire[31:0] lpfdata_out2;

assign dac_pd   = 1'b0;
assign demod_ob = lpfdata_out1;


bpsk bpsk_inst
(
    .sys_clk     (sys_clk  ),
    .sys_rst_n   (sys_rst_n),
    .key_add     (key_add),
    .key_sub     (key_sub), 
    .key_sin_cos (key_sin_cos),
    .dac_clk     (dac_clk  ),
    .dac_out     (psk_out_buf  )       
);
assign psk_out = psk_out_buf[9:2];

NCO u2 
(
	.clk         (sys_clk),         // clk.clk
	.clken       (1'b1),       //  in.clken
	.phi_inc_i   (32'd85899345),   //   1M
	.freq_mod_i  (frequency_df),  //    .freq_mod_i
	.phase_mod_i (16'd3640), //    .phase_mod_i
	.fsin_o      (dataout_i),      // out.fsin_o
	.out_valid   (out_valid),   //    .out_valid
	.reset_n     (sys_rst_n)      // rst.reset_n
);

NCO u3 
(
	.clk         (sys_clk),         // clk.clk
	.clken       (1'b1),       //  in.clken
	.phi_inc_i   (32'd85899345),   //   1M
	.freq_mod_i  (frequency_df),  //    .freq_mod_i
	.phase_mod_i (16'd20024), // 110°
	.fsin_o      (dataout_q),      // out.fsin_o
	.out_valid   (out_valid),   //    .out_valid
	.reset_n     (sys_rst_n)      // rst.reset_n
);

mul	mul_inst1 
(
    .dataa ( psk_out ),
    .datab ( dataout_i ),
    .result ( mul_res1 )
);

mul	mul_inst2
(
    .dataa ( psk_out ),
    .datab ( dataout_q ),
    .result ( mul_res2 )
);


FIR_lpf FIR_lpf_inst1
(
	.clk                (sys_clk),             
	.reset_n            (sys_rst_n),         
	.ast_sink_data      (mul_res1),    
	.ast_sink_valid     (1'b1),
	.ast_sink_error     (2'd0),
	.ast_source_data    (lpf_data1),
	.ast_source_valid   (lpf_valid),
	.ast_source_error   (lpf_error) 
);

FIR_lpf FIR_lpf_inst2
(
	.clk                (sys_clk),             
	.reset_n            (sys_rst_n),         
	.ast_sink_data      (mul_res2),    
	.ast_sink_valid     (1'b1),
	.ast_sink_error     (2'd0),
	.ast_source_data    (lpf_data2),
	.ast_source_valid   (lpf_valid),
	.ast_source_error   (lpf_error) 
);

assign lpfdata_out1 = lpf_data1[36:5];
assign lpfdata_out2 = lpf_data2[36:5];

phase_detect phase_detect_inst
(
    .sys_clk                (sys_clk  ),
    .sys_rst_n              (sys_rst_n),
    .di                     (lpfdata_out1      ), //i路输入
    .dq                     (lpfdata_out2       ),
    .pd                     (phase_detect_res       )
);

LoopFilter LoopFilter_inst
(
	.rst                   (sys_rst_n),
	.clk                   (sys_clk),
	.pd                    (phase_detect_res),
	.frequency_df          (frequency_df)
);

add add_inst2
(
    .sys_clk     (sys_clk  ),
    .sys_rst_n   (sys_rst_n),
    .din         (dataout_i[9:2]      ),
    .dout        (dac_data     )
);

    
    
    

endmodule
