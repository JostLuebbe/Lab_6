`timescale 1ps / 1ps

module clock_divider(
    input clock,
    output stopwatch_clock,
    output screen_refresh_clock
    );
    
    reg [19:0] stopwatch_count; // 19:0 for real time, 
    reg [16:0] screen_refresh_count; // 16:0 for real time
    
    assign stopwatch_clock = (stopwatch_count == 1000000) ? 1'b1 : 1'b0; // stopwatch count = 1000000 for real time
    assign screen_refresh_clock = (screen_refresh_count == 100000) ? 1'b1 : 1'b0;
    
    always @(posedge clock) begin // use for loop to generate the tmp_clk. tmp_clk*count = master clock
        if (stopwatch_count < 1000000) begin //1,000,000 is within the refresh vector range 2^20
            stopwatch_count <= stopwatch_count + 1; // count up
        end
        else begin
            stopwatch_count <= 0; // reset the counter
        end
    end
    
    always @(posedge clock) begin // use for loop to generate the rclk. rclk*refresh = master clock
        if (screen_refresh_count < 100000) begin //100,000 is within the refresh vector range 2^17
            screen_refresh_count <= screen_refresh_count + 1; // count up
        end else begin
            screen_refresh_count <= 0; // reset the refresh counter
        end
    end
endmodule