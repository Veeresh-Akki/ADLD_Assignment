`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:42:59 05/02/2023 
// Design Name: 
// Module Name:    license_plate_recog 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module license_plate_recog(
input clk,
input [7:0]ip_vehicle,
output reg vehicle0,
output reg vehicle1,
output reg vehicle2,
output reg vehicle3,
output reg vehicle4,
output reg vehicle5,
output reg vehicle6,
output reg vehicle7,
output reg detect,
output [1:0]state,
output [2:0]DIST
);
	 
reg [7:0]mem[0:255];
reg [7:0]L1_IR,L2_IR;
reg [7:0]pc;
reg [1:0]L2_state,L3_state;
reg [2:0]L2_DIST,L3_DIST;
reg [2:0]L2_NUM,L3_NUM;

initial begin
mem[0] = 8'b00000000;   // VEHICLE 1 LICENSE NUMBER
mem[1] = 8'b01001001;   // VEHICLE 2 LICENSE NUMBER
mem[2] = 8'b10010010;   // VEHICLE 3 LICENSE NUMBER
mem[3] = 8'b11011011;   // VEHICLE 4 LICENSE NUMBER
mem[4] = 8'b00100100;   // VEHICLE 5 LICENSE NUMBER
mem[5] = 8'b01101101;   // VEHICLE 6 LICENSE NUMBER
mem[6] = 8'b10101110;   // VEHICLE 7 LICENSE NUMBER
mem[7] = 8'b11111111;   // VEHICLE 8 LICENSE NUMBER
pc = 0;
end

//parameter KA = 2'b00, GJ = 2'b01, BR = 2'b10, MH = 2'b11;
parameter KA = 2'b00, GJ = 2'b01, BR = 2'b10, MH = 2'b11;
parameter dist_1 = 3'b000,dist_2 = 3'b001,dist_3 = 3'b010, dist_4 = 3'b011,dist_5 = 3'b100,dist_6 = 3'b101,
			 dist_7 = 3'b110,dist_8 = 3'b111;
parameter vehicle_1 = 3'b000,vehicle_2 = 3'b001,vehicle_3 = 3'b010,vehicle_4 = 3'b011,vehicle_5 = 3'b100,
			 vehicle_6 = 3'b101,vehicle_7 = 3'b110,vehicle_8 = 3'b111;

always @(posedge clk)  //fetch cycle
begin
L1_IR <= mem[pc];
pc <= pc + 1;
end

always @(posedge clk)  //decode cycle
begin
L2_IR <= L1_IR;
L2_state <= L2_IR[7:6];
L2_DIST <= L2_IR[5:3];
L2_NUM <= L2_IR[2:0];
end

always @(posedge clk)    //execute cycle
begin 
L3_state <= L2_state;
L3_DIST <= L2_DIST;
L3_NUM <= L2_NUM;

  case(L3_state)
  KA:begin
	case(L3_DIST)
		dist_1:begin
			  case(L3_NUM)
				vehicle_1:vehicle0 = 1;
				vehicle_2:vehicle1 = 1;
				vehicle_3:vehicle2 = 1;
				vehicle_4:vehicle3 = 1;
				vehicle_5:vehicle4 = 1;
				vehicle_6:vehicle5 = 1;
				vehicle_7:vehicle6 = 1;
				vehicle_8:vehicle7 = 1;
		endcase
			end
			
		dist_2:begin
			case(L3_NUM)
			 vehicle_1:vehicle0 = 1;
			 vehicle_2:vehicle1 = 1;
		    vehicle_3:vehicle2 = 1;
			 vehicle_4:vehicle3 = 1;
			 vehicle_5:vehicle4 = 1;
			 vehicle_6:vehicle5 = 1;
			 vehicle_7:vehicle6 = 1;
			 vehicle_8:vehicle7 = 1;
		   endcase
			end
			
		dist_3:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
		dist_4:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
		dist_5:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
		dist_6:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
		dist_7:begin
		   case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
		dist_8:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
	endcase
	end
			
	GJ:begin
		case(L3_DIST)
			dist_1:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
			dist_2:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
			dist_3:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
			dist_4:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
			dist_5:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
			dist_6:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
			dist_7:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
			dist_8:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
		endcase
		end
		
	BR:begin
		case(L3_DIST)
			dist_1:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
			dist_2:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
			dist_3:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
			dist_4:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
			dist_5:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
			dist_6:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
			dist_7:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
			dist_8:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
		endcase
		end
		
	MH:begin
		case(L3_DIST)
			dist_1:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
			dist_2:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
			dist_3:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
			dist_4:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
			dist_5:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
			dist_6:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
			dist_7:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
			dist_8:begin
			case(L3_NUM)
			vehicle_1:vehicle0 = 1;
			vehicle_2:vehicle1 = 1;
			vehicle_3:vehicle2 = 1;
			vehicle_4:vehicle3 = 1;
			vehicle_5:vehicle4 = 1;
			vehicle_6:vehicle5 = 1;
			vehicle_7:vehicle6 = 1;
			vehicle_8:vehicle7 = 1;
			endcase
			end
			
		default:{vehicle0,vehicle1,vehicle2,vehicle3,vehicle4,vehicle5,vehicle6,vehicle7} = 8'h00;
	endcase
	end
	
	endcase
	end

	assign state = L3_state;
	assign DIST = L3_DIST;
	
	always@(posedge clk)
	begin
		//{vehicle0,vehicle1,vehicle2,vehicle3,vehicle4,vehicle5,vehicle6,vehicle7}=8'h00;
		detect=0;

		if(mem[0]==ip_vehicle)
		begin
		//	vehicle0=1;
			detect=1;
		end
		else if(mem[1]==ip_vehicle)
		begin
		//	vehicle1=1;
			detect=1;
		end
		else if(mem[2]==ip_vehicle)
		begin
		//	vehicle2=1;
			detect=1;
		end
		else if(mem[3]==ip_vehicle)
		begin
		//	vehicle3=1;
			detect=1;
		end
		else if(mem[4]==ip_vehicle)
		begin
		//	vehicle4=1;
			detect=1;
		end
		else if(mem[5]==ip_vehicle)
		begin
		//	vehicle5=1;
			detect=1;
		end
		else if(mem[6]==ip_vehicle)
		begin
		//	vehicle6=1;
			detect=1;
		end
		else if(mem[7]==ip_vehicle)
		begin
		//	vehicle7=1;
			detect=1;
		end
		else 
		begin
		//	{vehicle0,vehicle1,vehicle2,vehicle3,vehicle4,vehicle5,vehicle6,vehicle7}=8'h00;
			detect=0;
		end
	
	end

endmodule
