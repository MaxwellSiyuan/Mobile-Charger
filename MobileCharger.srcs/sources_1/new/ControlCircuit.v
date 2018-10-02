`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/29 21:53:46
// Design Name: 
// Module Name: ControlCircuit
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


module ControlCircuit(
    input   wire        clk,//250Hz
    input   wire        rst,
    input   wire        key_flag,
    input   wire [3:0]  key_val,
    output  wire [3:0]  money1out, money0out, time1out, time0out,
    output  wire [1:0]  state   
);

    

    wire        ensure; //"确认"按键，开始充电
    wire        rst_n;
    wire        flag;   //预处理后的按键信号
    wire [3:0]  value;  //预处理后的键值
    wire        shift_rst_n;
    wire        temp_rst_n;
    wire        clear;
    wire        clear_n;
    wire        zero_n;
    wire        slake;
    wire        start;
    wire [3:0]  money1, money0, time1, time0;
    wire [3:0]  data0 , data1;
   

//not U1 (rst_n, rst);
    nor U1 (rst_n, rst,slake);
    not U3 (clear_n,clear);
    and U2 (temp_rst_n,rst_n,zero_n);
    and U4 (shift_rst_n,temp_rst_n,clear_n);


PreKey PreKey
(
    .clk(clk),//250Hz
    .rst_n(rst_n),
    .key_flag(key_flag),
    .key_val(key_val),
    .val(value),
    .flag(flag),
    .clear(clear),
    .ensure(ensure),
    .state(state)
);

Shift Shift
(
    .clk(clk),//250Hz
    .rst_n(shift_rst_n),
    .flag(flag),
    .data(value),
    //.disp3(data3), .disp2(data2), 
    .disp1(data1), .disp0(data0)
);

Money_Time Money_Time
(
    .data0(data0),.data1(data1),
    .clk(clk),//250Hz
    .data3out(money1),
    .data2out(money0), 
    .data1out(time1), 
    .data0out(time0) 
);

TimeCountDown TimeCountDown
(
    .clk(clk),//250Hz
    .money1(money1), .money0(money0), .time1(time1), .time0(time0),
    .state(state),
    .money1out(money1out), .money0out(money0out), .time1out(time1out), .time0out(time0out),
    .zero_n(zero_n)
);  

StartButton StartButton
(
    .clk(clk),//250Hz
    .rst_n(rst_n),
    .key_val(key_val),
    .key_flag(key_flag),
    .state(state),
    .start(start)
);

TensTimer TensTimer
(
    .clk(clk),//250Hz
    .rst_n(rst_n),
    .state(state),
    .slake(slake)
);



CoreState CoreState
(
    .clk(clk),//250Hz
    .rst_n(rst_n),
    .flag(flag),
    .clear(clear),
    .ensure(ensure),
    .start(start),
    .slake(slake),
    .zero_n(zero_n),
    .state(state)
);

endmodule