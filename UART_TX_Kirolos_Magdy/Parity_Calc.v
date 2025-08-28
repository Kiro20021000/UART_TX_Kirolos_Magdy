module Parity_Calc (
  input CLK,
  input RST,
  input Data_valid,
  input [7:0] P_data,
  input PAR_TYP,
  output reg par_bit
  );
  always @ (posedge CLK or negedge RST)
    begin
      if(!RST)
        begin
          par_bit <= 1'b0;
        end
      else if(Data_valid)
        begin
          case (PAR_TYP)
            1'b0 : par_bit <= ^P_data;
            1'b1 : par_bit <= ~^P_data;  
          endcase 
        end     
    end
endmodule
