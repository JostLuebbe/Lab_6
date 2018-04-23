module stopwatch(
        input clock,
        input toggle,
        input reset,
        input [1:0] mode_sel,
        input [3:0] init_val_one, init_val_two,
        output a, b, c, d, e, f, g, dp,
        output [3:0] an
    );
    
    reg [3:0] digit0, digit1, digit2, digit3; //registers that will hold the individual counts
    reg start_stop;
    wire slow_clock;
    
    always @ (posedge clock)
    begin
        if(reset)
            if(start_stop == 1)
                start_stop = 0;
        if(toggle)
            start_stop = ~start_stop;
    end
    
    clock_divider(clock, reset, slow_clock);
    sseg_control(clock, reset, digit0, digit1, digit2, digit3, {g, f, e, d, c, b, a}, an, dp);
    //mode_1(mode_sel, slow_clock, reset, start_stop, digit0, digit1, digit2, digit3);
    
    always @ (posedge slow_clock or posedge reset)
    begin
        if (reset)
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
        else if (mode_sel <= 2'b01 && start_stop)
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
                            digit3 <= 0;
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
        else if (mode_sel >= 2'b10 && start_stop)
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
                        end
                    end // end 4
                    else
                    begin
                        digit2 <= digit2 - 1;
                        digit1 <= 9;
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
endmodule