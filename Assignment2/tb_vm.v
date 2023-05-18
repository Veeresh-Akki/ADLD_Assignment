`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:42:14 05/04/2023
// Design Name:   vm
// Module Name:   /home/ise/Verilog_virtual/vending_machine/tb_vm.v
// Project Name:  vending_machine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_vm;

	// Inputs
	reg clk;
	reg rst;
	reg [1:0] sel;
	reg [1:0] coin;

	// Outputs
	wire [3:0]change;
	wire pa;
	wire pb;
	wire pc;
	wire pd;

	// Instantiate the Unit Under Test (UUT)
	vm uut (
		.clk(clk), 
		.rst(rst), 
		.sel(sel), 
		.coin(coin), 
		.change(change), 
		.pa(pa), 
		.pb(pb), 
		.pc(pc), 
		.pd(pd)
	);
	
	initial
	clk = 0;
	always #5 clk=~clk;

	initial begin
		// Initialize Inputs
		
		rst = 0;
		sel = 0;
		coin = 0;
		#10
		rst=1;
		#10
		rst=0;
		#10
		sel=2'b10;  //for product c
		#10
		coin=2'b01;
		#10
		coin=2'b10;
		#10
		coin=2'b01;
		
		
	
		#40 sel=2'b11;
		coin=2'b10;		// for product d
		#10
		coin=2'b01;
		#10
		coin=2'b01;
		
		
		#30 sel=2'b00; // for product a

		coin=2'b10;
		#10
		coin=2'b01;
		#10 coin=2'b01;
		
   #20 rst=1;
		// Wait 100 ns for global reset to finish
		#50;
        
		// Add stimulus here

	end
      
endmodule

