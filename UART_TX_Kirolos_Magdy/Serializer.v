module Serializer (
  input CLK,
  input RST,
  input [7:0] P_data,
  input ser_en,
  input Data_valid,
  output reg ser_done,
  output reg ser_data
  );
  reg [7:0] temp_data;
  reg [3:0] counter;
  wire done_signal;
  assign done_signal = (counter == 4'd8);
  
  always @ (posedge CLK or negedge RST)
    begin
     
      ser_data <=1'b0;
      ser_done <= 1'b0;
      counter <= 4'b0;
      if(!RST)
        begin
          ser_data <= 1'b0;
          ser_done <= 1'b0;
          counter <= 4'b0;
        end
		else if (Data_valid)
		temp_data <= P_data;
      else if (ser_en )
        begin
          if(!done_signal)
            begin
              {temp_data[6:0],ser_data} <= temp_data;
              counter <= counter + 4'b1;
            end
          else if(done_signal)
            begin
              ser_done <= 1'b1;
            end
        end
    end
  
  
endmodule
