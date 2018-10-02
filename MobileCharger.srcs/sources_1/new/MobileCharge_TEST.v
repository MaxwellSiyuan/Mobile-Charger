`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/29 21:22:07
// Design Name: 
// Module Name: MobileCharge_TEST
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


module MobileCharge_TEST
(
    input wire clk_100MHz,
    input wire [3:0] row,
    input wire rst,
    output wire [3:0] AN,
    output wire [1:8] led_n,
    output wire [3:0] col 
);

    wire        zero_n;
    wire        clear;
    wire        ensure;
    wire        rst_n;
    wire        flag;
    wire        flag_out;
    wire        shift_rst_n;
    wire        temp_rst_n;
    wire        clear_n;
    wire        Freq_250Hz;
    wire        Freq_50Hz ;
    wire        slake;
    wire        start;
    wire [1:0]  state; 
    wire [3:0]  key_val;
    wire [3:0]  data0, data1;// data2, data3; 
    wire [3:0]  value_out; 
    wire [3:0]  money1, money0, time1, time0;
    wire [3:0]  money1out, money0out, time1out, time0out;
   

//not U1 (rst_n, rst);
    nor U1 (rst_n, rst,slake);
    not U3 (clear_n,clear);
    and U2 (temp_rst_n,rst_n,zero_n);
    and U4 (shift_rst_n,temp_rst_n,clear_n);

FreqDiv FreqDiv  //Ê±ÖÓ·ÖÆµ
(
    .rst_n(rst_n),.clk(clk_100MHz),
    // .Freq_1kHz(Freq_1kHz),
    .Freq_250Hz(Freq_250Hz),
    // .Freq_500Hz(Freq_500Hz),
    .Freq_50Hz(Freq_50Hz)
);


Keyboard_Driver  Keyboard_Driver //¾ØÕó¼üÅÌÇý¶¯Ä£¿é
(
    .clk(Freq_50Hz),//50Hz
    .row(row),
    .rst_n(rst_n),
    .col(col),
    .keyboard_val(key_val),
    .key_pressed_flag(flag)
);

PreKey PreKey
(
    .clk(Freq_250Hz),//250Hz
    .rst_n(rst_n),
    .key_flag(flag),
    .key_val(key_val),
    .val(value_out),
    .flag(flag_out),
    .clear(clear),
    .ensure(ensure),
    .state(state)
);

Shift Shift
(
    .clk(Freq_250Hz),//250Hz
    .rst_n(shift_rst_n),
    .flag(flag_out),
    .data(value_out),
    //.disp3(data3), .disp2(data2),
    .disp1(data1), .disp0(data0)
);



Money_Time Money_Time
(
    .data0(data0),.data1(data1),
    .clk(Freq_250Hz),//250Hz
    .data0out(time0), .data1out(time1), .data2out(money0), .data3out(money1)
);

TimeCountDown TimeCountDown
(
    .clk(Freq_250Hz),//250Hz
    .money1(money1), .money0(money0), .time1(time1), .time0(time0),
    .state(state),
    .money1out(money1out), .money0out(money0out), .time1out(time1out), .time0out(time0out),
    .zero_n(zero_n)
); 

DISP DISP
(   
    .state(state),
    .clk(Freq_250Hz),//250Hz
    .data0(time0out),.data1(time1out),.data2(money0out),.data3(money1out),
    .rst_n(rst_n),
    .AN(AN),
    .led_n(led_n)
);


StartButton StartButton
(
    .clk(Freq_250Hz),//250Hz
    .rst_n(rst_n),
    .key_val(key_val),
    .key_flag(flag),
    .state(state),
    .start(start)
);

TensTimer TensTimer
(
    .clk(Freq_250Hz),//250Hz
    .rst_n(rst_n),
    .state(state),
    .slake(slake)
);


CoreState CoreState
(
    .clk(Freq_250Hz),//250Hz
    .rst_n(rst_n),
    .flag(flag_out),
    .clear(clear),
    .ensure(ensure),
    .start(start),
    .slake(slake),
    .zero_n(zero_n),
    .state(state)
);

endmodule
