`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/29 20:04:14
// Design Name: 
// Module Name: MobileCharger_TOP
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


module MobileCharger_TOP
(
    input wire clk_100MHz,
    input wire [3:0] row,
    input wire rst,
    output wire [3:0] AN,
    output wire [1:8] led_n,
    output wire [3:0] col     
);
    wire rst_n;
//    wire clk_50Hz;
    wire clk_250Hz;
    wire [3:0] data3, data2, data1, data0;
    wire key_flag;
    wire [3:0] key_val;
    wire [1:0] state;

not U1(rst_n,rst);

FreqDiv FreqDiv
(
    .clk(clk_100MHz),
    .rst_n(rst_n),
    .Freq_250Hz(clk_250Hz)
//    .Freq_50Hz(clk_50Hz)
);  

ControlCircuit ControlCircuit
(
    .clk(clk_250Hz),//250Hz
    .rst(rst),
    .key_flag(key_flag),
    .key_val(key_val),
    .money1out(data3),. money0out(data2), .time1out(data1), .time0out(data0),
    .state(state)
);

KeyDriver Keyboard
(
    .clk(clk_250Hz), 
    .rst_n(rst_n),
    .row(row),
    .col(col),
    .keyboard_val(key_val),
    .key_pressed_flag(key_flag)
);

DISP SEG_DISP
(
    .rst_n(rst_n),
    .state(state),
    .clk(clk_250Hz),//250Hz
    .data0(data0),.data1(data1),.data2(data2),.data3(data3),
    .AN(AN),
    .led_n(led_n)
);

endmodule
