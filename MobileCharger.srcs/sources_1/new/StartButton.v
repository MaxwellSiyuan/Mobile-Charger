`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/29 11:29:43
// Design Name: 
// Module Name: StartButton
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


module StartButton(
    input wire clk,
    input wire rst_n,
    input wire [3:0]key_val,
    input wire key_flag,
    input wire [1:0] state,
    output reg start=0
    );
    parameter INITIAL  =  2'b00;
    
always@(posedge clk, negedge rst_n)
    begin
        if(!rst_n)
            start <= 0;
        else if(state!=INITIAL)
            start <= 0;           
        else if(!key_flag)
            start <= 0;
        else if(key_val == 4'hf)
            start <= 1;
        else
            start <= 0;
    end
    
    
    
endmodule
