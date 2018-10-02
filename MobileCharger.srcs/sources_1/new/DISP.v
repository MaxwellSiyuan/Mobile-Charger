`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/29 09:43:19
// Design Name: 
// Module Name: DISP
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


module DISP(
    input wire  rst_n,
    input wire [1:0] state,
    input wire clk,//250Hz
    input wire [3:0] data0,data1,data2,data3,
    output wire [3:0] AN,
    output wire [1:8] led_n
    
    );
    wire [3:0] data;
    wire [3:0] ANin;
 DISP_Scan  DSSC
(
    .data(data),
    .rst_n(rst_n),
    .led_n(led_n)  
);   

DISP_Select DSEL
(
    .rst_n(rst_n),
    .clk(clk),//250Hz
    .data0(data0),.data1(data1),.data2(data2),.data3(data3),
    .data(data),
    .AN(ANin)
    );    
    
SlakeCol SlakeCol
(
    .state(state),
    .AN(ANin),
    .ANout(AN)
); 
endmodule
