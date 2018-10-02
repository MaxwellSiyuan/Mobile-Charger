`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/30 13:27:14
// Design Name: 
// Module Name: ControlCircuit_tb
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


module ControlCircuit_tb;
    reg        clk;//250Hz
    reg        rst;
    reg        key_flag;
    reg [3:0]  key_val;
    wire [3:0]  money1out, money0out, time1out, time0out;
    wire [1:0]  state;   

ControlCircuit CC
(
    .clk(clk),
    .rst(rst),
    .key_flag(key_flag),
    .key_val(key_val),
    .money1out(money1out), 
    .money0out(money0out), 
    .time1out(time1out), 
    .time0out(time0out),
    .state(state)
);
    
    parameter clk_time = 5, press_time = 500, inter_time = 500;


initial begin
    clk = 0;
    rst = 0;
    key_flag = 0;
    key_val = 0;
    
    //开始
    #inter_time  key_val = 4'hf; key_flag = 1;
    #press_time  key_flag = 0;
    
    //按键1
    #inter_time  key_val = 4'h1; key_flag = 1;
    #press_time  key_flag = 0;

    //按键6
    #inter_time  key_val = 4'h6; key_flag = 1;
    #press_time  key_flag = 0;
    
    //确认
    #inter_time  key_val = 4'hd; key_flag = 1;
    #press_time  key_flag = 0;
    
    
end
always #clk_time clk = ~clk;

endmodule
