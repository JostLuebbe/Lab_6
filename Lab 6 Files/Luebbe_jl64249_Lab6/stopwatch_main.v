`timescale 1ps / 1ps

module stopwatch(
        input clock,
        input toggle,
        input reset,
        input [1:0] mode_sel,
        input [3:0] init_val_one, init_val_two,
        output a, b, c, d, e, f, g, dp,
        output enable_D1, enable_D2, enable_D3, enable_D4
    );
    
    wire [3:0] digit0, digit1, digit2, digit3; //registers that will hold the individual counts
    reg [3:0] sseg_selector;
    reg reg_dp;
    wire stopwatch_clock;
    wire screen_refresh_clock;
    
    clock_divider c1 (clock, stopwatch_clock, screen_refresh_clock); // creates the two clock signals needed for this project. One to increment the stop watch and the other to display the counts stopwatch_clock < screen_refresh_clock
    sseg s1 (sseg_selector, {g, f, e, d, c, b, a}); // converts the stop watch digit values into their corresponding sseg outputs
    digit_selector ds1 (screen_refresh_clock, enable_D1, enable_D2, enable_D3, enable_D4); // runs through the digits at the screen_refresh_clock trigger
    counter c2 (stopwatch_clock, toggle, reset, mode_sel, init_val_one, init_val_two, digit0, digit1, digit2, digit3); //the brains of how the stopwatch counts and resets based on the mode_sel
    
    assign dp = reg_dp;
    
    always @ (*) // assigns what digit to display based on the enable bits for the digits
        case ({enable_D1,enable_D2,enable_D3,enable_D4})
            4'b0111: 
            begin
                sseg_selector = digit0;
                reg_dp = 1'b1;
            end
            4'b1011:
            begin
                sseg_selector = digit1;
                reg_dp = 1'b1;
            end
            4'b1101: 
            begin
                sseg_selector = digit2;
                reg_dp = 1'b0;
            end
            4'b1110:
            begin
                sseg_selector = digit3;
                reg_dp = 1'b1;
            end
            default: sseg_selector = 0; 
    endcase 
endmodule