`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   05:49:10 05/10/2023
// Design Name:   license_plate_recog
// Module Name:   /home/ise/license_plate/verilog_license/license_plate_recog_tb.v
// Project Name:  verilog_license
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: license_plate_recog
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module license_plate_recog_tb;

	// Inputs
	reg clk;
	reg [7:0] ip_vehicle;

	// Outputs
	wire vehicle0;
	wire vehicle1;
	wire vehicle2;
	wire vehicle3;
	wire vehicle4;
	wire vehicle5;
	wire vehicle6;
	wire vehicle7;
	wire detect;
	wire [1:0] state;
	wire [2:0] DIST;

	// Instantiate the Unit Under Test (UUT)
	license_plate_recog uut (
		.clk(clk), 
		.ip_vehicle(ip_vehicle), 
		.vehicle0(vehicle0), 
		.vehicle1(vehicle1), 
		.vehicle2(vehicle2), 
		.vehicle3(vehicle3), 
		.vehicle4(vehicle4), 
		.vehicle5(vehicle5), 
		.vehicle6(vehicle6), 
		.vehicle7(vehicle7), 
		.detect(detect), 
		.state(state), 
		.DIST(DIST)
	);

	initial clk=0;
	always  #5 clk=~clk;

	initial begin
		// Initialize Inputs
		ip_vehicle = 8'b00000000;// VEHICLE 1 LICENSE NUMBER
		#10 ip_vehicle = 8'b01010101;
		#10 ip_vehicle = 8'b01001001;   // VEHICLE 2 LICENSE NUMBER
		#10 ip_vehicle = 8'b10010000;
		#10 ip_vehicle = 8'b10010010;   // VEHICLE 3 LICENSE NUMBER
		#10 ip_vehicle = 8'b00011011;
		#10 ip_vehicle = 8'b11011011;   // VEHICLE 4 LICENSE NUMBER
		#10 ip_vehicle = 8'b11000011;
		#10 ip_vehicle = 8'b00100100;   // VEHICLE 5 LICENSE NUMBER
		#10 ip_vehicle = 8'b01100110; 
		#10 ip_vehicle = 8'b01101101;   // VEHICLE 6 LICENSE NUMBER
		#10 ip_vehicle = 8'b00001100;
		#10 ip_vehicle = 8'b10101110;   // VEHICLE 7 LICENSE NUMBER
		#10 ip_vehicle = 8'b11111111;   // VEHICLE 8 LICENSE NUMBER
		#10 ip_vehicle = 8'b10001110;
		#10 ip_vehicle = 8'b11000011;
		#10 ip_vehicle = 8'b01001001;   // VEHICLE 2 LICENSE NUMBER		
		#10 ip_vehicle = 8'b11011011;   // VEHICLE 4 LICENSE NUMBER
		#10 ip_vehicle = 8'b01101101;   // VEHICLE 6 LICENSE NUMBER
		#10 ip_vehicle = 8'b10001110;
		#10 ip_vehicle = 8'b11000011;
		// Wait 100 ns for global reset to finish
	
		
		#100 $finish;
		
        
		// Add stimulus here

	end    
endmodule

