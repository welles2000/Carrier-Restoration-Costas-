module LoopFilter
(
	input wire rst                           ,
	input wire clk                           ,
	input wire signed[31:0] pd               ,
	output wire signed[31:0] frequency_df    
);

	

	reg signed[31:0] sum_d;
	wire signed[31:0] pd_c2,pd_c1,sum;

	assign pd_c1={{2{pd[31]}},pd[31:2]} ;//c1;   {{1{pd[29]}},pd[29:1]}
	assign pd_c2={{10{pd[31]}},pd[31:10]};//c2;    {{9{pd[29]}},pd[29:9]}
	always @(posedge clk or negedge rst)
		if(rst == 1'b0)
			sum_d<=0;
		else
			sum_d<=sum;
		
	assign sum=pd_c2+sum_d;
	assign frequency_df=sum_d+pd_c1;

endmodule
