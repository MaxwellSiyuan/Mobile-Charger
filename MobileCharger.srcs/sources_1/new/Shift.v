`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/29 14:15:13
// Design Name: 
// Module Name: Shift
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


module Shift(
    input wire clk,
    input wire rst_n,
    input wire flag,
    input wire [3:0] data,
    output wire [3:0] disp3, disp2, disp1, disp0
);
    wire delay_flag;
    
PosedgeShift PDS
(
    .rst_n(rst_n),
    .flag(delay_flag),
    .data(data),
    .disp3(disp3), .disp2(disp2), .disp1(disp1), .disp0(disp0)
    );
    
DelayPosedge DPD
(
    .clk(clk),
    .in(flag),
    .out(delay_flag)
);
    
    
    
endmodule
