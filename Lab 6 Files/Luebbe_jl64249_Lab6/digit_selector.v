`timescale 1ps / 1ps

module digit_selector(
        input screen_refresh_clock,
        output enable_D1, enable_D2, enable_D3, enable_D4
    );
    
    reg [3:0] pattern = 4'b0111;
    
    assign enable_D1 = pattern[3];
    assign enable_D2 = pattern[2];
    assign enable_D3 = pattern[1];
    assign enable_D4 = pattern[0];
    
    always @(posedge screen_refresh_clock)
    begin
        pattern <= {pattern[0], pattern[3:1]};
    end
endmodule
