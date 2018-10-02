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
    
//  ����1
    #500 row = 4'b1110;
    #500 row = 4'b1111;
////  ����4    
//    #500 row = 4'b1101;
//    #500 row = 4'b1111;
//��������
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
//  ����7    
    #500 row = 4'b1011;
    #500 row = 4'b1111;
//  ����0    
    #500 row = 4'b0111;
    #500 row = 4'b1111;   
    
//  ����2
    #500 row = 4'b1110;
    #100 row = 4'b1111;
    #100 row = 4'b1110; 
    #500 row = 4'b1111;
 //  ����5
    #500 row = 4'b1101;
    #100 row = 4'b1111;
    #100 row = 4'b1101; 
    #500 row = 4'b1111;     
 //  ����8
    #500 row = 4'b1011;
    #100 row = 4'b1111;
    #100 row = 4'b1011; 
    #500 row = 4'b1111;  
 //  ����F
    #500 row = 4'b0111;
    #100 row = 4'b1111;
    #100 row = 4'b0111; 
    #500 row = 4'b1111;    
       
//  ����3
    #500 row = 4'b1110;
    #100 row = 4'b1111;
    #200 row = 4'b1110; 
    #500 row = 4'b1111;
 //  ����6
    #500 row = 4'b1101;
    #100 row = 4'b1111;
    #200 row = 4'b1101; 
    #500 row = 4'b1111;     
 //  ����9
    #500 row = 4'b1011;
    #100 row = 4'b1111;
    #200 row = 4'b1011; 
    #500 row = 4'b1111;  
 //  ����E
    #500 row = 4'b0111;
    #100 row = 4'b1111;
    #200 row = 4'b0111; 
    #500 row = 4'b1111;         

//  ����A
    #500 row = 4'b1110;
    #100 row = 4'b1111;
    #500 row = 4'b1110; 
    #500 row = 4'b1111;
 //  ����b
    #500 row = 4'b1101;
    #100 row = 4'b1111;
    #500 row = 4'b1101; 
    #500 row = 4'b1111;     
 //  ����C
    #500 row = 4'b1011;
    #100 row = 4'b1111;
    #500 row = 4'b1011; 
    #500 row = 4'b1111;  
 //  ����d
    #500 row = 4'b0111;
    #100 row = 4'b1111;
    #500 row = 4'b0111; 
    #500 row = 4'b1111;       
end

endmodule
