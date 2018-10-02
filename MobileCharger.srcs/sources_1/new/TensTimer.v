`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/29 11:10:52
// Design Name: 
// Module Name: TensTimer
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


module TensTimer(
    input wire       clk,//250Hz
    input wire       rst_n,
    input wire [1:0] state,
    output reg       slake
);
    parameter ZERO = 2'b01;
    reg [11:0] cnt = 0;  
    
always@(posedge clk, negedge rst_n)
    begin
        if(!rst_n)
            begin
                slake <= 0;
                cnt   <= 0;
            end
        else if(state != ZERO)
            begin
                slake <= 0;
                cnt   <= 0;
            end
        else if(cnt >= 2499)
                slake <= 1;
        else
                cnt   <= cnt+1;
    end
endmodule
