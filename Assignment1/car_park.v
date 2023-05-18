module car_park;
  reg clk;
  reg reset;
  reg front;
  reg back;
  reg [2:0]pass;
  
  wire status;
  wire [3:0]count;



 car_parking_sys uut (
  .clk(clk),  
  .reset(reset), 
  .front(front), 
  .back(back),
  .pass(pass),
  .status(status),
  .count(count)
 
 );


 initial begin
 clk = 0;
 forever #5 clk = ~clk;
 end

 initial begin
front = 1'b0;
back =1'b0;
reset=1'b1;
clk=1'b0;
pass=3'b000;

#12
reset=1'b0;

back=1'b0;
front=1'b1;

#10  pass=3'b101;
#10  back=1'b1;
front=1'b0;

#10
back=1'b0;
front=1'b1;
#10  pass=3'b100;
#10  pass=3'b101;

#10  pass=3'b101;
#10  pass=3'b101;

#10  back=1'b1;
front=1'b0;
#10  back=1'b0;
                                                                                               
end
initial begin
$monitor("TIME: %6d,count=%d, password=%b, front=%d, back=%d,status=%d",$time,count,pass,front,back,status);
#300 $finish;
end
endmodule


module car_parking_sys( 
               
 input clk,
 input reset,front,back,
 input [2:0] pass,
 output reg status,
 output reg [3:0]count
  
);
 parameter IDLE= 2'b00,PASSWORD=2'b01,PARK=2'b10;
 reg [1:0]cs,ns;


 always @(posedge clk)
 begin
 if(reset)
begin 
 cs <= IDLE;
 count=0;
end
 else
 cs <= ns;
 end


always @(*)
begin
	case(cs)
	IDLE: begin
		if(front)
		ns= PASSWORD;
		else
		cs=ns;
	end

PASSWORD:  begin
	if(pass==3'b101)
	begin
	status=1'b1;
	ns=PARK;
	end
	else
	begin
	status=1'b0;
	ns=PASSWORD;
	end
end


PARK: begin
	if(back)
	begin
	count=count+1;
	ns=IDLE;
	end
	else
	begin
	ns=PARK;
	end
end

default: begin
ns=IDLE;
status=1'b0;

end

endcase
end
 

endmodule
