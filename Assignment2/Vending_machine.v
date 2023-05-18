`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:12:40 24/03/2023 
// Design Name: 
// Module Name:    vm 
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
module vm(
  input clk,rst,
  input [1:0]sel,
  input [1:0]coin,  //01=rupee 5   10=rupee 10
  
  //reg [2:0]count_5,count_10;
  
  output reg [3:0]change,
  output reg pa,pb,pc,pd
 ); 
  
  
  reg [2:0]cs,next;
  
  parameter IDLE=3'b000, FIVE=3'b001, TEN=3'b010,FIFTEEN=3'b011,TWENTY=3'b100;
  
  parameter pra=2'b00,prb=2'b01,prc=2'b10,prd=2'b11;
  
  
   always@(posedge clk)
    begin
      if(rst==1)
        begin
          pa=0;
          pb=0;
          pc=0;
          pd=0;
          change=0;
          cs=IDLE;
        end
      else
        cs=next;
    end
  
  always@(posedge clk)
    begin
	 change=0;
	 pa=0;
	 pc=0;
	 pb=0;
	 pd=0;
      case(cs)
        IDLE:
		  begin
          if(coin==2'b00)
            begin
              next=IDLE;
            end
          else if(coin==2'b01)
              next=FIVE;
          else if(coin==2'b10)
            next=TEN;
          else
            cs=next;
        end
        
		FIVE:
          begin
            if(coin==2'b00)
              begin
                if(sel==2'b00)
                  begin
                    pa=1;
                    change=0;
                    next=IDLE;
                   end
              end
             else if(coin==2'b01)
                begin
           		 next=TEN;
                end
				else if(coin==2'b10)
              begin
                next=FIFTEEN;
              end
            else
              cs=next;
          end
        
        TEN:
          begin
            if(coin==2'b00)
            begin
              if(sel==2'b01)
                begin
                  pb=1;
                  change=0;
                  next=IDLE;
                end
            end
				else if(coin==2'b01)
              begin
                if(sel==2'b01)
                  begin
            		 pb=1;
             		 change=4'b0101;
              		 next=IDLE;
                  end
                else
                  next=FIFTEEN;
                end
            else if(coin==2'b10)
              begin
                
                if(sel==2'b00)
                  begin
                     pa=1;
             		 change=4'b1111;
              		 next=IDLE;
                  end
					else if(sel==2'b01)
                  begin
                     pb=1;
             		 change=4'b1010;
              		 next=IDLE;
                  end
                else if(sel==2'b10)
                  begin
                     pc=1;
             		 change=4'b0101;
              		 next=IDLE;
                  end
                else if(sel==2'b11)
                  begin
                      pd=1;
             		 change=0;
              		next=IDLE;
                  end
					else   
                next=TWENTY;
              end
            else
              cs=next;
          end
        
        FIFTEEN:
          begin
            if(coin==2'b00)
            begin
              pc=1;
              change=0;
              next=IDLE;
            end
            else if(coin==2'b01)
              begin
               next=TWENTY;
              end
				else if(coin==2'b10)
              begin
                if(sel==2'b11)
                  begin
                    pd=1;
                    change=4'b0101;
                  end
					end
            else
              cs=next;
          end
             
		TWENTY:
         begin
            if(coin==2'b00)
					begin
						if(sel==2'b00)
							begin
								pa=1;
								change=4'b1111;
								next=IDLE;
							end
						else if(sel==2'b01)
							begin
								pb=1;
								change=4'b1010;
								next=IDLE;
							end
				 
						else if(sel==2'b10)
							begin
								pc=1;
								change=4'b0101;
								next=IDLE;
							end
						else if(sel==2'b11)
							begin
								pd=1;
								change=0;
								next=IDLE;
							end
							else
								cs=next;
                end
            
				else if(coin==2'b01)
					begin
						if(sel==2'b00)
							begin
								pa=1;
								change=4'b1111;
								next=IDLE;
							end
			
						else if(sel==2'b01)
							begin
								pb=1;
								change=4'b1010;
								next=IDLE;
							end
						else if(sel==2'b10)
							begin
								pc=1;
								change=4'b0101;
								next=IDLE;
							end
						else if(sel==2'b11)
							begin
								pd=1;
								change=0;
								next=IDLE;
							end
						else
                    cs=next;
              end
				else if(coin==2'b10)
              begin
                if(sel==2'b11)
                  begin
                    pd=1;
                    change=4'b0101;
                  end
					end
            else
              cs=next;
			end
			default:begin
			next=IDLE;
			end
				
			
		endcase
end				 



endmodule
