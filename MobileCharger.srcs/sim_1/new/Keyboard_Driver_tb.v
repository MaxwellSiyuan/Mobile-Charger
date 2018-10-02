`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/09 18:34:44
// Design Name: 
// Module Name: Keyboard_Driver_tb
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


module Keyboard_Driver_tb;
    reg clk;
    reg rst_n;
    reg  [3:0] row;
    wire [3:0] col;
    wire [3:0] keyboard_val;
    wire key_pressed_flag;

Keyboard_Driver Keyboard_Driver1
(
    .clk(clk),
    .rst_n(rst_n),
    .row(row),
    .col(col),
    .keyboard_val(keyboard_val),
    .key_pressed_flag(key_pressed_flag)
);


initial begin
    clk = 0;
    rst_n = 1;
    row = 4'b1111;
end

always #50 clk = ~clk;
always 
begin
    
//  按键1
    #500 row = 4'b1110;
    #500 row = 4'b1111;
////  按键4    
//    #500 row = 4'b1101;
//    #500 row = 4'b1111;
//按键抖动
    #500  row = 4'b1101;
    #10  row = 4'b1111;
    #10  row = 4'b1101;
    #10  row = 4'b1111;
    #10  row = 4'b1101;
    #10  row = 4'b1111;
    #10  row = 4'b1101;
    #10  row = 4'b1111;
        #10  row = 4'b1101;
    #500 row = 4'b1111;
//  按键7    
    #500 row = 4'b1011;
    #500 row = 4'b1111;
//  按键0    
    #500 row = 4'b0111;
    #500 row = 4'b1111;   
    
//  按键2
    #500 row = 4'b1110;
    #100 row = 4'b1111;
    #100 row = 4'b1110; 
    #500 row = 4'b1111;
 //  按键5
    #500 row = 4'b1101;
    #100 row = 4'b1111;
    #100 row = 4'b1101; 
    #500 row = 4'b1111;     
 //  按键8
    #500 row = 4'b1011;
    #100 row = 4'b1111;
    #100 row = 4'b1011; 
    #500 row = 4'b1111;  
 //  按键F
    #500 row = 4'b0111;
    #100 row = 4'b1111;
    #100 row = 4'b0111; 
    #500 row = 4'b1111;    
       
//  按键3
    #500 row = 4'b1110;
    #100 row = 4'b1111;
    #200 row = 4'b1110; 
    #500 row = 4'b1111;
 //  按键6
    #500 row = 4'b1101;
    #100 row = 4'b1111;
    #200 row = 4'b1101; 
    #500 row = 4'b1111;     
 //  按键9
    #500 row = 4'b1011;
    #100 row = 4'b1111;
    #200 row = 4'b1011; 
    #500 row = 4'b1111;  
 //  按键E
    #500 row = 4'b0111;
    #100 row = 4'b1111;
    #200 row = 4'b0111; 
    #500 row = 4'b1111;         

//  按键A
    #500 row = 4'b1110;
    #100 row = 4'b1111;
    #500 row = 4'b1110; 
    #500 row = 4'b1111;
 //  按键b
    #500 row = 4'b1101;
    #100 row = 4'b1111;
    #500 row = 4'b1101; 
    #500 row = 4'b1111;     
 //  按键C
    #500 row = 4'b1011;
    #100 row = 4'b1111;
    #500 row = 4'b1011; 
    #500 row = 4'b1111;  
 //  按键d
    #500 row = 4'b0111;
    #100 row = 4'b1111;
    #500 row = 4'b0111; 
    #500 row = 4'b1111;       
end

endmodule
