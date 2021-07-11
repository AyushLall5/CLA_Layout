module CarryLAS_tb;

reg [3:0] a;
reg [3:0] b;
reg cin;
reg clk;
wire [3:0] sum;
wire [3:0] sumf;
wire [13:0] dum;
wire of; //overflow
wire co;
wire [3:0]q1;
wire [3:0]q2;
integer i;


initial	begin
		$dumpfile("CarryLAS_tb.vcd");
		$dumpvars(0,CarryLAS_tb);
	end
   
d_flipflop dff1(a[0],clk,q1[0], dum[0]);
d_flipflop dff2(b[0],clk,q2[0], dum[1]);
d_flipflop dff3(a[1],clk,q1[1], dum[2]);
d_flipflop dff4(b[1],clk,q2[1], dum[3]);
d_flipflop dff5(a[2],clk,q1[2], dum[4]);
d_flipflop dff6(b[2],clk,q2[2], dum[5]);
d_flipflop dff7(a[3],clk,q1[3], dum[6]);
d_flipflop dff8(b[3],clk,q2[3], dum[7]);
d_flipflop dff13(cin,clk,ci, dum[12]);


CarryLA_4 CLA(q1,q2,ci,sum,co1);


d_flipflop dff9(sum[0],clk,sumf[0], dum[8]);
d_flipflop dff10(sum[1],clk,sumf[1], dum[9]);
d_flipflop dff11(sum[2],clk,sumf[2], dum[10]);
d_flipflop dff12(sum[3],clk,sumf[3], dum[11]);
d_flipflop dff14(co1,clk,co, dum[13]);

initial clk = 0;
always #10 clk = ~clk;



initial 
begin
assign cin =0; 
assign a=4'b0110;
assign b=4'b0101;


#20
assign a=4'b1111;
assign b=4'b1111;


#20
assign a=4'b0100;
assign b=4'b0000;
#120
$finish;
end


endmodule


