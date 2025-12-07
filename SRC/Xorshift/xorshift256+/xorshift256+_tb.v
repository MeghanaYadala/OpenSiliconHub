// -----------------------------------------------------------------------------
// Testbench: xorshift256+_tb
// Author: MrAbhi19
// Description:
//   Verifies the xorshift256+ module. Drives clock/reset, applies a seed,
//   enables stepping, and prints outputs. Dumps a VCD waveform for inspection.
//
// Features:
//   - 100 MHz clock generation.
//   - Asynchronous reset.
//   - Deterministic seed initialization.
//   - Console logging of outputs.
//   - VCD waveform dump (GTKWave-compatible).
//
// Notes:
//   - The output sequence is deterministic for a given seed.
//   - Ensure the seed is not all zeros.
// -----------------------------------------------------------------------------

`timescale 1ns/1ps

module xorshift256+_tb;

  // Testbench signals
  reg         clk;
  reg         rst;
  reg         en;
  reg [255:0] seed;
  wire [63:0] out;

  // Device Under Test (DUT)
  xorshift256_plus dut (
    .clk(clk),
    .rst(rst),
    .en(en),
    .seed(seed),
    .out(out)
  );

  // Clock generation: 10 ns period => 100 MHz
  always #5 clk = ~clk;

  // Stimulus
  initial begin
    // Initial values
    clk  = 1'b0;
    rst  = 1'b0;
    en   = 1'b0;

    // Example non-zero 256-bit seed: {s3,s2,s1,s0}
    seed = {
      64'h9E3779B97F4A7C15, // s3: golden ratio-derived constant
      64'hD2B74407B1CE6E93, // s2: arbitrary non-zero
      64'h94D049BB133111EB, // s1: SplitMix64-ish constant
      64'h12345678ABCDEF00  // s0: user value
    };

    // Setup waveform dump
    $dumpfile("xorshift256_plus_tb.vcd");
    $dumpvars(0, tb_xorshift256_plus);

    // Apply async reset
    $display("Applying reset...");
    rst = 1'b1;
    #20;
    rst = 1'b0;

    // Enable and run
    $display("Starting xorshift256+ sequence...");
    en = 1'b1;

    // Capture a number of outputs
    repeat (32) begin
      @(posedge clk);
      $display("t=%0t | out=%016h", $time, out);
    end

    // Pause generator
    en = 1'b0;
    $display("Generator paused.");
    #50;

    // Re-enable for a few more cycles
    en = 1'b1;
    repeat (8) begin
      @(posedge clk);
      $display("t=%0t | out=%016h", $time, out);
    end

    // Finish
    $display("Testbench complete.");
    #20;
    $finish;
  end

endmodule
