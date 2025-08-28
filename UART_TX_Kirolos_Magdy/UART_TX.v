module UART_TX (
  input wire CLK,
  input wire RST,
    input wire PAR_TYP,
  input wire PAR_EN,
  input wire Data_Valid,
  input wire scan_clk,
  input wire scan_rst,
  input wire SE,
  input wire SI,
  input wire test_mode,
  input wire [7:0] P_data,
  output wire SO,
  output wire busy,
  output wire TX_OUT
  );
  // internal signals
  wire [1:0] Mux_sel;
  wire ser_Done;
  wire ser_En;
  wire Par_bit;
  wire Ser_data;
  wire CLK_M;
  wire RST_M;
  
 MUXX U0 (
 .IN_0 (CLK),
 .IN_1 (scan_clk),
 .SEL (test_mode),
 .CLK_M (CLK_M)
 
 );
 
 MUXX U1 (
 .IN_0 (RST),
 .IN_1 (scan_rst),
 .SEL (test_mode),
 .RST_M (RST_M)
 
 );
 

  
  Serializer S (
  .CLK (CLK),
  .RST (RST),
  .P_data (P_data),
  .ser_done (ser_Done),
  .ser_en (ser_En),
  .ser_data (Ser_data),
  .Data_valid (Data_Valid)
  );
  
  Parity_Calc P (
  .CLK (CLK),
  .RST (RST),
  .P_data (P_data),
  .par_bit (Par_bit),
  .PAR_TYP (PAR_TYP),
  .Data_valid (Data_Valid)
  );
  
  MUX M (
  .CLK (CLK),
  .RST (RST),
  .mux_sel (Mux_sel),
  .TX_OUT (TX_OUT),
  .par_bit (Par_bit),
  .ser_data (Ser_data)
  );
  
  FSM_U F (
  .CLK (CLK),
  .RST (RST),
  .busy (busy),
  .ser_en (ser_En),
  .par_en (PAR_EN),
  .ser_done (ser_Done),
  .Data_valid (Data_Valid),
  .mux_sel (Mux_sel)
  );
  
endmodule