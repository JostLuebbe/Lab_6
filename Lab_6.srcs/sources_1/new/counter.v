`timescale 1ps / 1ps

module counter(
        input stopwatch_clock,
        input start_stop_toggle,
        input reset_toggle,
        input [1:0] mode_sel,
        input [3:0] init_val_one, init_val_two,
        output reg [3:0] digit0, digit1, digit2, digit3
    );
    
    reg button_n_ff;
    reg start_stop;
    reg reset_n_ff;
    reg reset;
    
    always @ (posedge stopwatch_clock) // look for the edge of the button. Use active low logic
    begin
        button_n_ff <= start_stop_toggle; //assign button flip flop from button 
        if (button_n_ff && !start_stop_toggle) // if button_n_ff = 1 && button_n = 0 
                start_stop <= ~start_stop;
        reset_n_ff <= reset_toggle; //assign reset button flip flop from reset button
        if (reset_n_ff && !reset_toggle) // if reset_n_ff = 1 && reset_n = 0
            reset <= 1; //assert reset signal
        else
            reset <= 0; //when the reset button is not negative edge, reset signal is low
    end
    
    always @ (posedge stopwatch_clock)
    begin
        if (start_stop == 1 && reset == 1)
        begin
            if(mode_sel == 2'b00)
            begin
                digit0 <= 0;
                digit1 <= 0;
                digit2 <= 0;
                digit3 <= 0;
            end
            else if(mode_sel == 2'b01 || mode_sel == 2'b11)
            begin
                digit0 <= 0;
                digit1 <= 0;
                digit2 <= init_val_one;
                digit3 <= init_val_two;
            end
            else if(mode_sel == 2'b10)
            begin
                digit0 <= 9;
                digit1 <= 9;
                digit2 <= 9;
                digit3 <= 9;
            end
        end
        else if(start_stop == 1)
        begin
            digit0 <= digit0;
            digit1 <= digit1;
            digit2 <= digit2;
            digit3 <= digit3;
        end
        else if(start_stop != 1)
//        else if(start_stop_toggle == 1)
        begin
            if (mode_sel <= 2'b01)
            begin // begin 1
                if(digit0 == 9)
                begin // begin 2
                    digit0 <= 0;
                    if (digit1 == 9)
                    begin // begin 3
                        digit1 <= 0;
                        if (digit2 == 9)
                        begin // begin 4
                            digit2 <= 0;
                            if(digit3 == 9)
                            begin
                                digit0 <= 9;
                                digit1 <= 9;
                                digit2 <= 9;
                                digit3 <= 9;
                            end
                            else
                                digit3 <= digit3 + 1;
                        end // end 4
                        else
                            digit2 <= digit2 + 1;
                    end // end 3
                    else
                        digit1 <= digit1 + 1;
                end // end 2
                else
                    digit0 <= digit0 + 1;
            end //end 1
            else if (mode_sel >= 2'b10)
            begin
                if(digit0 == 0)
                begin // begin 2
                    if (digit1 == 0)
                    begin // begin 3
                        if (digit2 == 0)
                        begin // begin 4
                            if(digit3 == 0)
                            begin
                                digit0 <= 0;
                                digit1 <= 0;
                                digit2 <= 0;
                                digit3 <= 0;
                            end
                            else
                            begin
                                digit3 <= digit3 - 1;
                                digit2 <= 9;
                                digit1 <= 9;
                                digit0 <= 9;
                            end
                        end // end 4
                        else
                        begin
                            digit2 <= digit2 - 1;
                            digit1 <= 9;
                            digit0 <= 9;
                        end
                    end // end 3
                    else
                    begin
                        digit1 <= digit1 - 1;
                        digit0 <= 9;
                    end
                end // end 2
                else
                    digit0 <= digit0 - 1;
            end
        end
    end
    
endmodule
