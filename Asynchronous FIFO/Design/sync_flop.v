`timescale 1ns / 1ps

module sync_flop #(
    parameter WIDTH = 5
)(
    input  wire              clk,
    input  wire              rst_n,
    input  wire [WIDTH-1:0]  async_in,
    output reg  [WIDTH-1:0]  sync_out
);

    reg [WIDTH-1:0] sync_ff1;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sync_ff1 <= 0;
            sync_out <= 0;
        end else begin
            sync_ff1 <= async_in;
            sync_out <= sync_ff1;
        end
    end

endmodule
