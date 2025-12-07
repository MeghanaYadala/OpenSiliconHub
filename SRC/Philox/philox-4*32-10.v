// ============================================================================
// Philox-4x32-10 Pseudo-Random Number Generator
// Author: MrAbhi19
// ----------------------------------------------------------------------------
// Methodology:
// - Counter-based PRNG: takes a 128-bit counter and a 64-bit key.
// - Applies 10 rounds of transformation using multiplication, XOR, and permutation.
// - Each round multiplies two counter words by fixed odd constants, XORs with key,
//   and permutes the words to ensure diffusion.
// - After 10 rounds, the scrambled counter is returned as the random output.
// ----------------------------------------------------------------------------
// Inputs:
//   clk, rst, en : control signals
//   counter      : 128-bit input (4 x 32-bit words)
//   key          : 64-bit input (2 x 32-bit words)
// Outputs:
//   out          : 128-bit random output (4 x 32-bit words)
// ----------------------------------------------------------------------------
// Metrics:
// - Output size: 128 bits (4 random 32-bit integers per call).
// - Period: 2^128 (counter space).
// - Rounds: 10 (empirically chosen for strong statistical quality).
// - Constants: M0 = 0xD256D193, M1 = 0x9E3779B9.
// - Key schedule: increments key each round to avoid linear correlations.
// ----------------------------------------------------------------------------
// Limitations:
// - Not cryptographically secure.
// - Best suited for parallel simulations, Monte Carlo methods, GPU workloads.
// ============================================================================

module philox4x32_10 (
  input clk,
  input rst,
  input en,
  input [127:0] counter,   // 128-bit counter input
  input [63:0] key,        // 64-bit key input
  output reg [127:0] out   // 128-bit random output
);

  // Constants for multiplication
  localparam [31:0] M0 = 32'hD256D193;
  localparam [31:0] M1 = 32'h9E3779B9;

  // Internal state registers
  reg [31:0] c0, c1, c2, c3;  // 4 x 32-bit counter words
  reg [31:0] k0, k1;          // 2 x 32-bit key words
  integer i;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      out <= 128'd0;
    end else if (en) begin
      // Step 1: Initialize state from inputs
      {c3, c2, c1, c0} <= counter;
      {k1, k0} <= key;

      // Step 2: Apply 10 rounds of transformation
      for (i = 0; i < 10; i = i + 1) begin
        reg [63:0] prod0, prod1;

        // Multiply selected counter words by constants
        prod0 = c0 * M0;
        prod1 = c2 * M1;

        // Mix high/low parts with other words and key
        c0 = prod1[31:0];                       // low part of prod1
        c1 = prod0[63:32] ^ c1 ^ k0;            // high part of prod0 XOR key
        c2 = prod0[31:0];                       // low part of prod0
        c3 = prod1[63:32] ^ c3 ^ k1;            // high part of prod1 XOR key

        // Key schedule: increment key each round
        k0 = k0 + 32'h9E3779B9;  // golden ratio constant
        k1 = k1 + 32'hBB67AE85;  // another mixing constant
      end

      // Step 3: Collect final output
      out <= {c3, c2, c1, c0};
    end
  end
endmodule
