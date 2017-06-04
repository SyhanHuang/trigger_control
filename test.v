module test(reset, trigger, load, out, seg1, seg2, seg3, sw, led, clk);
input reset, trigger, load;
input clk;
input [9:0]sw;
output [9:0]led;
output reg [2:0]out;
output [6:0]seg1;
output [6:0]seg2;
output [6:0]seg3;
wire [11:0]num;
reg enable, allow_stop;
wire clk_20;
reg [9:0]counter;

always @(posedge clk_20 or negedge reset)
begin
	if(!reset)					begin out <= 0; counter <= 0; allow_stop <=0; end
	else
	begin
		if(enable)				begin	counter <= counter + 1; out <= ~out; allow_stop <= 0; end
		if(counter == 199)	begin out <= 0; counter <= 0; allow_stop <= 1; end
	end
	/*
	if(!reset)	begin counter <= 0; end
	else	begin counter <= counter + 1; end
	*/
end


always @(negedge load or posedge clk or posedge allow_stop or negedge reset)
begin
	if(!reset || allow_stop)	enable <= 0;
	if(!load) 						enable <= 1;
end


divider div(reset, clk, clk_20);
assign led[9:0] = sw[9:0];
bcd mybcd(counter[9:0], num[11:8], num[7:4], num[3:0]);

seg7 myseg3(num[11:8], seg3);
seg7 myseg2(num[7:4], seg2);
seg7 myseg1(num[3:0], seg1);

endmodule
