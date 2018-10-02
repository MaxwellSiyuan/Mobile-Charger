`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/17 15:53:01
// Design Name: 
// Module Name: DISP_Show_tb
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


module DISP_Show_tb;
    reg  rst_n;
    reg  [1:0] state;
    reg  clk;//250Hz
    reg  [3:0] data0,data1,data2,data3;
    wire [3:0] AN;
    wire [1:8] led_n;

DISP  DISP_TEST
(
    .rst_n(rst_n),
    .state(state),
    .clk(clk),//250Hz
    .data0(data0), 
    .data1(data1), 
    .data2(data2), 
    .data3(data3),
    .AN(AN),
    .led_n(led_n)
);

initial begin
    state = 2;
    rst_n = 1;
    clk = 0;
    data0 = 4'b0000;
    data1 = 4'b0100;
    data2 = 4'b0110;
    data3 = 4'b1010;

end

always   #5 clk = ~clk;
always   #50 data0 = data0 + 1;
always   #65 data1 = data1 + 3;
always   #75 data2 = data2 + 7;
always   #70 data3 = data3 + 5;

endmodule
