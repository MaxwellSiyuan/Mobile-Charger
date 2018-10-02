`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/29 15:16:49
// Design Name: 
// Module Name: PreKey
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


module PreKey(
    input wire [1:0] state,
    input wire       clk,
    input wire       rst_n,
    input wire       key_flag,
    input wire [3:0] key_val , 
    output reg [3:0] val = 4'b0,
    output reg       flag = 1'b0,
    output reg       clear = 1'b0,
    output reg       ensure = 1'b0
);

parameter INITIAL = 0, ZERO = 1, COIN = 2, COUNTDOWN = 3;
    
always @( posedge clk,  negedge rst_n   )
    begin
        if(!rst_n)
            begin
                val = 4'b0;
                clear = 1'b0;
                ensure = 1'b0;
                flag = 1'b0;
            end
        else if(state==0 || state==3 )
            begin
                clear = 1'b0;
                ensure = 1'b0;
                flag = 1'b0;
             end
        else if(!key_flag)
             begin
                 //val = key_val;
                 clear = 1'b0;
                 ensure = 1'b0;
                 flag = 1'b0;
             end
        else if( key_val>=0 && key_val<=9 )
            begin
                val = key_val;
                clear = 1'b0;
                ensure = 1'b0;
                flag = 1'b1;
            end
        else if( key_val == 4'hd )  //È·ÈÏ
            begin                
                clear = 1'b0;
                ensure = 1'b1;
                flag = 1'b0;
            end   
         else if( key_val == 4'he )  //ÇåÁã
            begin                
                clear = 1'b1;
                ensure = 1'b0;
                flag = 1'b0;
            end      
         else
            begin
                 clear = 1'b0;
                 ensure = 1'b0;
                 flag = 1'b0;
            end          
    end
    
endmodule
