`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/29 09:43:54
// Design Name: 
// Module Name: DISP_Select
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


module DISP_Select(
    input wire  rst_n,
    input wire clk,//250Hz
    input wire [3:0] data0,data1,data2,data3,
    output reg [3:0] data,
    output reg [3:0] AN
    );
    
   reg [1:0] state = 0;
   parameter S0 = 0,S1 = 1,S2 = 2,S3 = 3;
    
always@( posedge clk ,negedge rst_n)
    begin
    if(!rst_n)
        state <=S0;
    else
        case ( state )
            S0: state <=S1;
            S1: state <=S2;
            S2: state <=S3;
            S3: state <=S0;
            default:
                state <=S0;
        endcase
    end
    
always@( state ,data0,data1,data2,data3) 
    begin    
    case ( state )
        S0:
            begin
                data <= data0;
                AN   <= 4'b1110;
            end    
        S1:
            begin
                data <= data1;
                AN   <= 4'b1101;
            end   
        S2:
            begin
                data <= data2;
                AN   <= 4'b1011;
            end      
        S3:
            begin
                data <= data3;
                AN   <= 4'b0111;
            end      
     endcase
     end
    
    
endmodule
