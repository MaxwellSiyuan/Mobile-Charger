`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/29 16:00:41
// Design Name: 
// Module Name: Money_Time
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


module Money_Time(
    input wire [3:0] data0,data1,
    input wire clk,
//    input wire rst_n,
    output reg [3:0] data3out, data2out, data1out, data0out
    );
    
    reg [7:0] sum = 0;
    
always @( posedge clk )
    begin
        sum = data0*2 + data1 * 20;
        if(sum >= 40)
            begin
                data3out = 2;
                data2out = 0;
                data1out = 4;
                data0out = 0;
            end
        else if(sum >= 30)
            begin
                data3out = 1;
                data2out = sum/2 - 10;
                data1out = 3;
                data0out = sum - 30;
            end
        else if(sum >= 20)
            begin
                data3out = 1;
                data2out = sum/2 - 10;
                data1out = 2;
                data0out = sum - 20;
            end
        else if(sum >= 10)
            begin
                data3out = 0;
                data2out = sum/2;
                data1out = 1;
                data0out = sum - 10;
            end
        else
            begin
                data3out = 0;
                data2out = sum/2;
                data1out = 0;
                data0out = sum ;
            end
    end
   
endmodule
