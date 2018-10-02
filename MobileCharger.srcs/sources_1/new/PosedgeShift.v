`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/29 14:24:22
// Design Name: 
// Module Name: PosedgeShift
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PosedgeShift(
    input wire rst_n,
    input wire flag,
    input wire [3:0] data,
    output reg [3:0] disp3, disp2, disp1, disp0
    );
    
always@(posedge flag, negedge rst_n)
   begin 
        if(!rst_n)
            begin
                disp3 = 4'b0;
                disp2 = 4'b0;
                disp1 = 4'b0;
                disp0 = 4'b0;
            end
       else
           begin
               disp3 = disp2;
               disp2 = disp1;
               disp1 = disp0;
               disp0 = data;
          end            
   end
endmodule
