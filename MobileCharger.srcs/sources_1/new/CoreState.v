`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/29 18:35:12
// Design Name: 
// Module Name: CoreState
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



    
module CoreState
(
    input wire        clk,
    input wire        rst_n,
    input wire        slake, start, flag, clear, zero_n , ensure ,
    output reg  [1:0] state
);

    // Declare state register
    

    // Declare states
    parameter INITIAL = 0, ZERO = 1, COIN = 2, COUNTDOWN = 3;

    // Determine the next state synchronously, based on the
    // current state and the input
    always @ (posedge clk or negedge rst_n) 
    begin
        if (!rst_n)
            state <= INITIAL;
        else
            case (state)
                INITIAL:
                    if (start)
                        begin
                            state <=  ZERO;
                        end
                    else
                        begin
                            state <= INITIAL;
                        end
               ZERO:
                    if (slake)
                        begin
                            state <=  INITIAL;
                        end
                    else if(flag)
                        begin
                            state <= COIN;
                        end   
                    else
                        begin
                            state <= ZERO;
                        end  
              COIN:
                    if (clear)
                        begin
                            state <=  ZERO;
                        end
                    else if(ensure)
                        begin
                            state <= COUNTDOWN;
                        end   
                    else
                        begin
                            state <= COIN;
                        end             
             COUNTDOWN:
                    if (!zero_n)
                        begin
                            state <=  ZERO;
                        end 
                    else
                        begin
                            state <= COUNTDOWN;
                        end       
                                   
            endcase
    end
endmodule
    // Determine the output based only on the current state
    // and the input (do not wait for a clock edge).
//    always @ (state or in)
//    begin
//            case (state)
//                S0:
//                    if (in)
//                    begin
//                        out = 2'b00;
//                    end
//                    else
//                    begin
//                        out = 2'b10;
//                    end
//                S1:
//                    if (in)
//                    begin
//                        out = 2'b01;
//                    end
//                    else
//                    begin
//                        out = 2'b00;
//                    end
//                S2:
//                    if (in)
//                    begin
//                        out = 2'b10;
//                    end
//                    else
//                    begin
//                        out = 2'b01;
//                    end
//                S3:
//                    if (in)
//                    begin
//                        out = 2'b11;
//                    end
//                    else
//                    begin
//                        out = 2'b00;
//                    end
//            endcase
//    end



