// Gray to binary converter for input 'g' (used for a)
module gtba(g, a);
input [31:0] g;
output reg [31:0] a;
integer i;
always @(*) begin
  a[31] = g[31];
  for (i = 30; i >= 0; i = i - 1)
    a[i] = a[i+1] ^ g[i];
end
endmodule

// Gray to binary converter for input 'g' (used for b)
module gtbb(g, b);
input [31:0] g;
output reg [31:0] b;
integer i;
always @(*) begin
  b[31] = g[31];
  for (i = 30; i >= 0; i = i - 1)
    b[i] = b[i+1] ^ g[i];
end
endmodule

// Binary to gray conversion for b
module btg1(b,g);
input [31:0]b;
output reg [31:0]g;
integer i;
always@(*)
begin
  g[0]=b[0];
  for(i=1;i<32;i=i+1)
    g[i]=b[i-1]^b[i];
end
endmodule

// Binary to gray conversion for a
module btg(a,g);
input [31:0]a;
output reg [31:0]g;
integer i;
always@(*)
begin
  g[0]=a[0];
  for(i=1;i<32;i=i+1)
    g[i]=a[i-1]^a[i];
end
endmodule

// Bit reversal for a
module bitreverse(a, o);
input  [31:0] a;
output reg [31:0] o;
integer i;
always @(*) begin
  for (i = 0; i < 32; i = i + 1)
    o[i] = a[31 - i];
end
endmodule

// Reset output to zero
module reset32(q);
output [31:0] q;
assign q = 32'b0;
endmodule

// Parity checker for a
module paritya(a, o);
input [31:0] a;
output o;
assign o = ^a;  // Even parity
endmodule

// Parity checker for b
module parityb(b, o);
input [31:0] b;
output o;
assign o = ^b;  // Even parity
endmodule

// 32-bit ALU with 32 operations and submodules for conversion/parity
module alu32(a, b, s, out, carry, mulhi);
input  [31:0] a, b;
input  [4:0]  s;
output reg [31:0] out;
output reg carry;
output reg [31:0] mulhi;
wire [63:0] prod64;
wire [31:0] gba, gbb, bga, bgb, brevr;
wire [31:0] rst;
wire pa, pb;

gtba  m0(a, gba);          // gray → bin (a)
gtbb  m1(b, gbb);          // gray → bin (b)
btg   m2(a, bga);          // bin → gray (a)
btg1  m3(b, bgb);          // bin → gray (b)
bitreverse m4(a, brevr);   // bit reversal
reset32 m5(rst);           // reset
paritya m6(a, pa);         // parity a
parityb m7(b, pb);         // parity b
assign prod64 = a * b;

always @(*) begin
  out   = 32'b0;
  carry = 1'b0;
  mulhi = 32'b0;
  case(s)
    0:   {carry, out} = a + b;             // add
    1:   {carry, out} = a - b;             // sub
    2:   begin out = prod64[31:0]; mulhi = prod64[63:32]; end // mul
    3:   out = (b==0) ? 0 : a / b;         // div
    4:   out = ~a;                         // not
    5:   out = a & b;                      // and
    6:   out = ~(a & b);                   // nand
    7:   out = a | b;                      // or
    8:   out = ~(a | b);                   // nor
    9:   out = gbb;                        // gray→bin b
    10:  out = (a > b) ? 32'hFFFFFFFF : 32'h0; // comp
    11:  out = ~a + 1;                     // 2’s comp a
    12:  out = ~b + 1;                     // 2’s comp b
    13:  out = ~a;                         // 1’s comp a
    14:  out = ~b;                         // 1’s comp b
    15:  out = (a == b) ? 32'hFFFFFFFF : 32'h0; // equal
    16:  out = gba;                        // gray→bin a
    17:  out = bgb;                        // bin→gray b
    18:  out = bga;                        // bin→gray a
    19:  out = a ^ b;                      // xor
    20:  out = ~(a ^ b);                   // xnor
    21:  out = {31'b0, (a[0] && b[0])};    // logical and
    22:  out = {31'b0, (a[0] || b[0])};    // logical or
    23:  out = {31'b0, (!a[0])};           // logical not
    24:  {carry, out} = a + 1;             // increment
    25:  {carry, out} = a - 1;             // decrement
    26:  out = a >> b[4:0];                // shift right
    27:  out = rst;                        // reset
    28:  out = brevr;                      // bit reverse
    29:  out = {31'b0, pa};                // parity a
    30:  out = {31'b0, pb};                // parity b
    31:  out = a << b[4:0];                // shift left
    default: out = 32'b0;
  endcase
end
endmodule
