`timescale 1ns / 1ps

module mode_1(
        input [1:0] mode_sel,
        input slow_clock,
        input reset,
        input start_stop,
        output [3:0] digit0, digit1, digit2, digit3
    );
    
    reg [3:0] digit0_temp, digit1_temp, digit2_temp, digit3_temp;
    
    always @ (posedge slow_clock or posedge reset)
    begin
        if (reset)
        begin
            digit0_temp <= 0;
            digit1_temp <= 0;
            digit2_temp <= 0;
            digit3_temp <= 0;
        end
        else if (mode_sel == 2'b00 && start_stop)
        begin // begin 1
            if(digit0_temp == 9)
            begin // begin 2
                digit0_temp <= 0;
                if (digit1_temp == 9)
                begin // begin 3
                    digit1_temp <= 0;
                    if (digit2_temp == 9)
                    begin // begin 4
                        digit2_temp <= 0;
                        if(digit3_temp == 9)
                            digit3_temp <= 0;
                        else
                            digit3_temp <= digit3_temp + 1;
                    end // end 4
                    else
                        digit2_temp <= digit2_temp + 1;
                end // end 3
                else
                    digit1_temp <= digit1_temp + 1;
            end // end 2
            else
                digit0_temp <= digit0_temp + 1;
        end //end 1
    end
    
    assign digit0 = digit0_temp;
    assign digit1 = digit1_temp;
    assign digit2 = digit2_temp;
    assign digit3 = digit3_temp;
endmodule