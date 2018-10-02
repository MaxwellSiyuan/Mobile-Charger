`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/29 16:39:18
// Design Name: 
// Module Name: TimeCountDown
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


module TimeCountDown(
    input wire       clk,//250Hz
   // input wire       rst_n,
    input wire [3:0] money1, money0, time1, time0,
    input wire [1:0] state,
//    input wire       ensure,
    output reg [3:0] money1out, money0out, time1out, time0out,
    output reg       zero_n  = 1
    );
    
    reg [7:0] cnt1Hz = 0;//0~249
    reg [5:0] cnt    = 0;//0~40
    reg [5:0] sum    = 0;
    parameter COUNTDOWN = 2'b11;
 
always @(posedge clk)
    begin   
       // if(!ensure)
       if( state!= COUNTDOWN)
            begin
                cnt1Hz = 0;
                cnt    = 0;
            end
        else if(sum == 0)
            begin
                cnt1Hz = 0;
                cnt    = 0;
            end
        else if(cnt1Hz == 249)
            begin
                cnt1Hz = 0;
                cnt    = cnt+1; 
            end
        else
            cnt1Hz = cnt1Hz + 1; 
    end
    
always @(posedge clk)
    begin
        zero_n  = 1;
         //if( state != COUNTDOWN )
        if(  state!= COUNTDOWN )
        begin
            money1out = money1;
            money0out = money0;
            time1out  = time1;
            time0out  = time0;
        end      
        else
            begin
                money1out =  money1;
                money0out =  money0;
                sum = time1*10 + time0 - cnt;
                if(sum >= 40)
                    begin
                        time1out = 4;
                        time0out = sum - 40;
                    end
                else if(sum >= 30)
                    begin
                        time1out = 3;
                        time0out = sum - 30;
                    end
                else if(sum >= 20)
                    begin
                        time1out = 2;
                        time0out = sum - 20;
                    end     
                else if(sum >= 10)
                    begin
                        time1out = 1;
                        time0out = sum - 10;
                    end  
                else 
                    begin
                        time1out = 0;
                        time0out = sum ;
                    end  
             if(sum == 0)
                    begin
                        zero_n = 0;               
                    end
         end    
    end
endmodule
