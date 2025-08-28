module FSM_U (
  input CLK,
  input RST,
  input Data_valid,
  input ser_done,
  input par_en,
  output reg ser_en,
  output reg busy,
  output reg [1:0] mux_sel
  );
  
  localparam  [2:0] 
                   IDLE = 3'b000 ,
                   START = 3'b001,
                   DATA = 3'b010,
                   PARITY = 3'b011,
                   STOP = 3'b100;
  
  reg [2:0] current_state,next_state;
  
  reg busy_comp;
  always @(posedge CLK or negedge RST)
    begin
      if(!RST)
        current_state <= IDLE;
    else
      current_state <= next_state;
    end
  
  always @(*)
    begin
      mux_sel = 2'b01;
      busy_comp = 1'b0; 
      case (current_state)
        IDLE : begin
                  if(Data_valid)
                    begin
                      next_state = START;
                      mux_sel = 2'b00;
                      busy_comp = 1'b1;
                    end
                  else
					begin
						next_state = IDLE;
						busy_comp = 1'b0;
					end
              end
        START : begin
                      next_state = DATA;
                      mux_sel = 2'b00; 
                      busy_comp = 1'b1; 
                      ser_en = 1'b1;      
                 end
        DATA : begin
                if(ser_done && par_en)
                  begin
                         next_state = PARITY;
                         mux_sel = 2'b11; 
                         busy_comp = 1'b1;
                       end          
                     else if (ser_done && !par_en)
                      begin
                       next_state = STOP;
                       mux_sel = 2'b01;
                       busy_comp = 1'b1;
                      end
                    else
					  begin
                      next_state =  DATA;
                      mux_sel = 2'b10;
                      busy_comp = 1'b1;
					  end
                    end
              
        PARITY : begin
                   next_state = STOP;
                   mux_sel = 2'b01;
                   busy_comp = 1'b1;
                 end
        STOP : begin
                   mux_sel = 2'b01;
                   next_state = IDLE;
                   busy_comp = 1'b1;
                 end
        default : begin
                    next_state = IDLE;
                    busy_comp = 1'b0;
                  end
                endcase
           
    end

  always@(posedge CLK or negedge RST )
		begin
			if(!RST)
				begin
				busy	<=	1'b0;
				end
			else
				busy	<=	busy_comp;
				
		end
endmodule
  