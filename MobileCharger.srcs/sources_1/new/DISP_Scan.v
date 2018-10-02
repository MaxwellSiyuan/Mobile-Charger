`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/09 20:08:47
// Design Name: 
// Module Name: DISP_Scan
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


module DISP_Scan(
    input wire [3:0] data,
    input wire rst_n,
    output reg [1:8] led_n    
    );
 
 parameter reg0=8'b0000_0011,
       reg1=8'b1001_1111,
       reg2=8'b0010_0101,
       reg3=8'b0000_1101,
       reg4=8'b1001_1001,
       reg5=8'b0100_1001,
       reg6=8'b0100_0001,
       reg7=8'b0001_1111,
       reg8=8'b0000_0001,
       reg9=8'b0000_1001,
       rega=8'b0001_0001,
       regb=8'b1100_0001,
       regc=8'b0110_0011,
       regd=8'b1000_0101,
       rege=8'b0110_0001,
       regf=8'b0111_0001; 
    
    always @(data,rst_n)
    begin
        if(!rst_n)
            led_n = reg0;
        else
        case(data)
            4'h0: led_n=reg0;
            4'h1: led_n=reg1;
            4'h2: led_n=reg2;
            4'h3: led_n=reg3;
            4'h4: led_n=reg4;
            4'h5: led_n=reg5;
            4'h6: led_n=reg6;
            4'h7: led_n=reg7;
            4'h8: led_n=reg8;
            4'h9: led_n=reg9;
            4'ha: led_n=rega;
            4'hb: led_n=regb;
            4'hc: led_n=regc;
            4'hd: led_n=regd;
            4'he: led_n=rege;
            4'hf: led_n=regf;
        endcase
    end
endmodule
