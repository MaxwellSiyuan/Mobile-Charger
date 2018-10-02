`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/08 21:45:42
// Design Name: 
// Module Name: Keyboard_Driver
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

module Keyboard_Driver(
    input wire clk, //1kHz
    input wire rst_n,
    input wire[3:0] row,
    output reg [3:0] col,
    output reg [3:0] keyboard_val,
    output reg key_pressed_flag
);

//无分频测试
wire key_clk  = clk;

//时钟分频
//reg [20:0] cnt; 
 
//always @ (posedge clk, negedge rst_n)
//  if (!rst_n)
//    cnt <= 0;
//  else
//    cnt <= cnt + 1'b1;
//wire key_clk = cnt[20];  //47Hz

//状态机编码
parameter SCAN_COL0      = 4'b1110;  // 扫描第0列 
parameter SCAN_COL1      = 4'b1101;  // 扫描第1列 
parameter SCAN_COL2      = 4'b1011;  // 扫描第2列 
parameter SCAN_COL3      = 4'b0111;  // 扫描第3列 
parameter NO_KEY_PRESSED = 4'b0000;  // 没有按键按下 
parameter KEY_PRESSED    = 4'b1111;  // 有按键按下

reg [3:0] current_state, next_state;

//状态方程
always @ (posedge key_clk, negedge rst_n)
  if (!rst_n)
    current_state <= NO_KEY_PRESSED;
  else
    current_state <= next_state;

// 驱动方程
always @(current_state,row)
  case (current_state)
    NO_KEY_PRESSED :                    // 没有按键按下
        if (row != 4'b1111)
          next_state = SCAN_COL0;
        else
          next_state = NO_KEY_PRESSED;
    SCAN_COL0 :                         // 扫描第0列 
        if (row != 4'b1111)
          next_state = KEY_PRESSED;
        else
          next_state = SCAN_COL1;
    SCAN_COL1 :                         // 扫描第1列 
        if (row != 4'b1111)
          next_state = KEY_PRESSED;
        else
          next_state = SCAN_COL2;    
    SCAN_COL2 :                         // 扫描第2列
        if (row != 4'b1111)
          next_state = KEY_PRESSED;
        else
          next_state = SCAN_COL3;
    SCAN_COL3 :                         // 扫描第3列
        if (row != 4'b1111)
          next_state = KEY_PRESSED;
        else
          next_state = NO_KEY_PRESSED;
    KEY_PRESSED :                       // 有按键按下
        if (row != 4'b1111)
          next_state = KEY_PRESSED;
        else
          next_state = NO_KEY_PRESSED;                      
  endcase
  
  
 // reg [3:0] col_val, row_val;             // 列值、行值
 
//输出方程
 always @ (posedge key_clk, negedge rst_n)
    if (!rst_n)
    begin
      col <= 4'b0000;
      key_pressed_flag <= 0;
      keyboard_val <= 4'h0;
    end 
    else
      case (current_state)
        NO_KEY_PRESSED :                  // 没有按键按下
            if(row != 4'b1111)
                col = 4'b1110;
            else
                begin
                col <= 4'b0000;
                key_pressed_flag <= 0;       // 清键盘按下标志
                end    
        SCAN_COL0 :                       // 扫描第0列
            if(row != 4'b1111)
                col <= 4'b1110;
            else
                col <= 4'b1101;    
        SCAN_COL1 :                      // 扫描第1列
            if(row != 4'b1111)                   
                  col <= 4'b1101;    
            else  
                  col <= 4'b1011; 
        SCAN_COL2 :                       // 扫描第2列
             if(row != 4'b1111)                   
                  col <= 4'b1011;    
             else  
                  col <= 4'b0111;  
        SCAN_COL3 :                       // 扫描第3列
            if(row != 4'b1111)                   
                 col <= 4'b0111;    
            else  
                 col <= 4'b0000;     
        KEY_PRESSED :                     // 有按键按下
            begin
//              col_val <= col;                 // 锁存列值
//              row_val <= row;                 // 锁存行值
              
                case ({col, row})
                    8'b1110_1110 : keyboard_val <= 4'h1;
                    8'b1110_1101 : keyboard_val <= 4'h4;
                    8'b1110_1011 : keyboard_val <= 4'h7;
                    8'b1110_0111 : keyboard_val <= 4'h0;
                     
                    8'b1101_1110 : keyboard_val <= 4'h2;
                    8'b1101_1101 : keyboard_val <= 4'h5;
                    8'b1101_1011 : keyboard_val <= 4'h8;
                    8'b1101_0111 : keyboard_val <= 4'hF;
                     
                    8'b1011_1110 : keyboard_val <= 4'h3;
                    8'b1011_1101 : keyboard_val <= 4'h6;
                    8'b1011_1011 : keyboard_val <= 4'h9;
                    8'b1011_0111 : keyboard_val <= 4'hE;
                     
                    8'b0111_1110 : keyboard_val <= 4'hA; 
                    8'b0111_1101 : keyboard_val <= 4'hB;
                    8'b0111_1011 : keyboard_val <= 4'hC;
                    8'b0111_0111 : keyboard_val <= 4'hD;        
              endcase
              key_pressed_flag <= 1;          // 置键盘按下标志  
            end
      endcase
endmodule
 
//赋值
//always @ (posedge key_clk, negedge rst_n)
//    if (!rst_n)
//      keyboard_val = 4'h0;
//    else
//      if (key_pressed_flag)
//        case ({col_val, row_val})
//          8'b1110_1110 : keyboard_val = 4'h1;
//          8'b1110_1101 : keyboard_val = 4'h4;
//          8'b1110_1011 : keyboard_val = 4'h7;
//          8'b1110_0111 : keyboard_val = 4'h0;
           
//          8'b1101_1110 : keyboard_val = 4'h2;
//          8'b1101_1101 : keyboard_val = 4'h5;
//          8'b1101_1011 : keyboard_val = 4'h8;
//          8'b1101_0111 : keyboard_val = 4'hF;
           
//          8'b1011_1110 : keyboard_val = 4'h3;
//          8'b1011_1101 : keyboard_val = 4'h6;
//          8'b1011_1011 : keyboard_val = 4'h9;
//          8'b1011_0111 : keyboard_val = 4'hE;
           
//          8'b0111_1110 : keyboard_val = 4'hA; 
//          8'b0111_1101 : keyboard_val = 4'hB;
//          8'b0111_1011 : keyboard_val = 4'hC;
//          8'b0111_0111 : keyboard_val = 4'hD;        
//        endcase

