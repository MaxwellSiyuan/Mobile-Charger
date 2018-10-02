`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/29 14:17:08
// Design Name: 
// Module Name: DelayPosedge
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


module DelayPosedge(
    input wire clk,
    input wire in,
    output reg out = 0
);
  reg [3:0] cnt = 4'b0000;
  
always@( posedge clk)
begin
    if(in == 0)
        begin
            out <= 1'b0 ;
            cnt <= 4'b0000;
        end
     else if(cnt >= 4'b1111)
        begin
             out <= 1'b1 ;
             cnt <= 4'b0000;
        end
     else    cnt <= cnt + 1'b1;
end
endmodule
