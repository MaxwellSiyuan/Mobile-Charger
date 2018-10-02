`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/29 19:54:29
// Design Name: 
// Module Name: SlakeCol
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


module SlakeCol(
    input wire   [1:0] state,
    input wire   [3:0] AN,
    output reg   [3:0] ANout
    );
    parameter INITIAL = 0;
    
always @(state,AN)
    begin
        if(state == INITIAL)
            ANout = 4'b1111;
        else
            ANout = AN;  
    end
endmodule
