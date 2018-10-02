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

//�޷�Ƶ����
wire key_clk  = clk;

//ʱ�ӷ�Ƶ
//reg [20:0] cnt; 
 
//always @ (posedge clk, negedge rst_n)
//  if (!rst_n)
//    cnt <= 0;
//  else
//    cnt <= cnt + 1'b1;
//wire key_clk = cnt[20];  //47Hz

//״̬������
parameter SCAN_COL0      = 4'b1110;  // ɨ���0�� 
parameter SCAN_COL1      = 4'b1101;  // ɨ���1�� 
parameter SCAN_COL2      = 4'b1011;  // ɨ���2�� 
parameter SCAN_COL3      = 4'b0111;  // ɨ���3�� 
parameter NO_KEY_PRESSED = 4'b0000;  // û�а������� 
parameter KEY_PRESSED    = 4'b1111;  // �а�������

reg [3:0] current_state, next_state;

//״̬����
always @ (posedge key_clk, negedge rst_n)
  if (!rst_n)
    current_state <= NO_KEY_PRESSED;
  else
    current_state <= next_state;

// ��������
always @(current_state,row)
  case (current_state)
    NO_KEY_PRESSED :                    // û�а�������
        if (row != 4'b1111)
          next_state = SCAN_COL0;
        else
          next_state = NO_KEY_PRESSED;
    SCAN_COL0 :                         // ɨ���0�� 
        if (row != 4'b1111)
          next_state = KEY_PRESSED;
        else
          next_state = SCAN_COL1;
    SCAN_COL1 :                         // ɨ���1�� 
        if (row != 4'b1111)
          next_state = KEY_PRESSED;
        else
          next_state = SCAN_COL2;    
    SCAN_COL2 :                         // ɨ���2��
        if (row != 4'b1111)
          next_state = KEY_PRESSED;
        else
          next_state = SCAN_COL3;
    SCAN_COL3 :                         // ɨ���3��
        if (row != 4'b1111)
          next_state = KEY_PRESSED;
        else
          next_state = NO_KEY_PRESSED;
    KEY_PRESSED :                       // �а�������
        if (row != 4'b1111)
          next_state = KEY_PRESSED;
        else
          next_state = NO_KEY_PRESSED;                      
  endcase
  
  
 // reg [3:0] col_val, row_val;             // ��ֵ����ֵ
 
//�������
 always @ (posedge key_clk, negedge rst_n)
    if (!rst_n)
    begin
      col <= 4'b0000;
      key_pressed_flag <= 0;
      keyboard_val <= 4'h0;
    end 
    else
      case (current_state)
        NO_KEY_PRESSED :                  // û�а�������
            if(row != 4'b1111)
                col = 4'b1110;
            else
                begin
                col <= 4'b0000;
                key_pressed_flag <= 0;       // ����̰��±�־
                end    
        SCAN_COL0 :                       // ɨ���0��
            if(row != 4'b1111)
                col <= 4'b1110;
            else
                col <= 4'b1101;    
        SCAN_COL1 :                      // ɨ���1��
            if(row != 4'b1111)                   
                  col <= 4'b1101;    
            else  
                  col <= 4'b1011; 
        SCAN_COL2 :                       // ɨ���2��
             if(row != 4'b1111)                   
                  col <= 4'b1011;    
             else  
                  col <= 4'b0111;  
        SCAN_COL3 :                       // ɨ���3��
            if(row != 4'b1111)                   
                 col <= 4'b0111;    
            else  
                 col <= 4'b0000;     
        KEY_PRESSED :                     // �а�������
            begin
//              col_val <= col;                 // ������ֵ
//              row_val <= row;                 // ������ֵ
              
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
              key_pressed_flag <= 1;          // �ü��̰��±�־  
            end
      endcase
endmodule
 
//��ֵ
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

