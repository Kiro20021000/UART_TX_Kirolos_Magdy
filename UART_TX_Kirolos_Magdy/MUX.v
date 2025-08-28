module MUX (
  input CLK,
  input RST,
  input [1:0] mux_sel,
  input ser_data,
  input par_bit,
  output reg TX_OUT
  );
  
  
  always @ (posedge CLK or negedge RST)
    begin 
      if(!RST)
        begin
          TX_OUT <= 1'b1;
        end
    else
    begin
      case(mux_sel)
        2'b00 : TX_OUT <= 1'b0;
        2'b01 : TX_OUT <= 1'b1;
        2'b10 : TX_OUT <= ser_data;
        2'b11 : TX_OUT <= par_bit;
      endcase
    end  
end

endmodule