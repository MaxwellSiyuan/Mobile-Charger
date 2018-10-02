`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/17 12:59:22
// Design Name: 
// Module Name: FreqDiv
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


module FreqDiv(
    input wire rst_n,clk,
    output reg Freq_1kHz = 1'b0,
    output reg Freq_250Hz = 1'b0,
    output reg Freq_500Hz = 1'b0,
    output reg Freq_50Hz  = 1'b0
    
);
    reg [15:0] counter_1kHz = 16'd0;
    reg  [1:0] cnt_250Hz = 2'b0;
    reg  [3:0] cnt_50Hz = 4'b0;
    parameter Par_100M = 50000000;
    parameter Par_1k = 500;
    
always @ (posedge clk ,negedge rst_n )
begin    
    if(!rst_n)
    begin
        counter_1kHz <= 16'd0;;
        Freq_1kHz <= 1'b0;
    end
    else if( counter_1kHz == ( Par_100M/1000 - 1) )
    begin
        Freq_1kHz <= ~Freq_1kHz;
        counter_1kHz <= 0;
    end
    else
        counter_1kHz <= counter_1kHz + 1;
end  

//250Hz
always @ (posedge Freq_1kHz ,negedge rst_n )
begin    
    if(!rst_n)
    begin
        cnt_250Hz <= 2'b0;
        Freq_250Hz <= 1'b0;
    end
    else if( cnt_250Hz == ( Par_1k/250 - 1) )
    begin
        Freq_250Hz <= ~Freq_250Hz;
        cnt_250Hz <= 2'b0;
    end
    else
        cnt_250Hz <= cnt_250Hz + 1;
end  

//500Hz
always @ (posedge Freq_1kHz ,negedge rst_n )
begin    
    if(!rst_n)
    begin
        Freq_500Hz <= 1'b0;
    end
    else
        Freq_500Hz = ~Freq_500Hz ;
end  


//50Hz
always @ (posedge Freq_1kHz ,negedge rst_n )
begin    
    if(!rst_n)
    begin
        cnt_50Hz <=  4'b0;
        Freq_50Hz <= 1'b0;
    end
    else if( cnt_50Hz == ( Par_1k/50 - 1) )
    begin
        Freq_50Hz <= ~Freq_50Hz;
        cnt_50Hz <=  4'b0;
    end
    else
        cnt_50Hz <= cnt_50Hz + 1;
end 


endmodule










