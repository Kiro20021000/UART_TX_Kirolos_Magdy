`timescale 1ns/1ps

module UART_TX_TB ();
  reg CLK_TB;
  reg RST_TB;
  reg PAR_TYP_TB;
  reg PAR_EN_TB;
  reg Data_Valid_TB;
  reg [7:0] P_data_TB;
  wire TX_OUT_TB;
  wire busy_TB;
  
  parameter Clock_Period = 5.0;
  
  // Clock generator
  always #(Clock_Period/2) CLK_TB = ~CLK_TB;
  
  //instantiation
  UART_TX DUT (
  .CLK (CLK_TB),
  .RST (RST_TB),
  .PAR_TYP (PAR_TYP_TB),
  .PAR_EN (PAR_EN_TB),
  .Data_Valid (Data_Valid_TB),
  .P_data (P_data_TB),
  .busy (busy_TB),
  .TX_OUT (TX_OUT_TB)
  );
  initial
    begin
      //system function
      $dumpfile("UART_TX .vcd");
      $dumpvars;
      //initialization
      initialize();
      //reset
      reset();
   
  
  $display("Test case with parity bit"); 
    UART_CONFEG (1'b1,1'b0);  
	Operation(8'b10111010);
	check_operation(8'b10111010);
	#(Clock_Period);
	
	$display("Test case without parity bit");
	UART_CONFEG (1'b0,1'b0);
	Operation(8'b10111011);
	check_operation(8'b10111011);
	#(Clock_Period);
	
	$display("Test case with even parity And no. of ones is even"); 
	UART_CONFEG (1'b1,1'b0);
	Operation(8'b10111011);
	check_operation(8'b10111011);
	#(Clock_Period);
	
	$display("Test case with even parity And no. of ones is odd");
	UART_CONFEG (1'b1,1'b0);
	Operation(8'b10011011);
	check_operation(8'b10011011);
	#(Clock_Period);
	
	$display("Test case with odd parity And no. of ones is odd");
	 //PAR_TYP_TB = 1'b1;
     //PAR_EN_TB = 1'b1;
	 UART_CONFEG (1'b1,1'b1);
	Operation(8'b10011011);
	check_operation(8'b10011011);
	#(Clock_Period);
	
	$display("Test case with odd parity And no. of ones is even");
	UART_CONFEG (1'b1,1'b1);
	Operation(8'b10010011);
	check_operation(8'b10010011);
	#(Clock_Period);
	$display("Test case without parity bit");
	UART_CONFEG (1'b0,1'b0);
	Operation(8'b00101011);
	check_operation(8'b00101011);
	
	#(30*Clock_Period);
        $stop;

	
    end
  // ---------Tasks--------
   task initialize ;
     begin
     CLK_TB = 1'b0;
     RST_TB = 1'b1;
     PAR_TYP_TB = 1'b0;
     PAR_EN_TB = 1'b0;
     Data_Valid_TB = 1'b0;
     P_data_TB = 8'b0;
    end
   endtask
   
   
   task reset;
     begin
       RST_TB = 1'b1;
       #(Clock_Period);
       RST_TB = 1'b0;
       #(Clock_Period);
       RST_TB = 1'b1;
     end
   endtask
   
  task UART_CONFEG ;
	input parity_enable;
	input parity_type;
	begin  
		PAR_EN_TB = parity_enable;
		PAR_TYP_TB = parity_type;
	end
	endtask
  
  
   task Operation;
	input	 [7:0]		Data ;
 begin
	P_data_TB = Data;
	Data_Valid_TB	=	1'b1;
	#(Clock_Period);
	Data_Valid_TB	=	1'b0;
	
 end
 endtask
 
 task check_operation ;
	input	[7:0]	in_data;
	integer 	i; 
	reg     parity_bit;
	reg     [10:0]	generated_out1 , expec_out1;
    reg 	[9:0] expec_out2, generated_out2;
 begin

	   if(PAR_EN_TB)
		begin
		  for(i=0;i<11;i=i+1)
            begin
               #(Clock_Period);
               generated_out1[i] = TX_OUT_TB;
            end
			case (PAR_TYP_TB)
				1'b0: begin
						parity_bit = ^P_data_TB;
						expec_out1 = {1'b1,parity_bit,in_data,1'b0};
				      end
		        1'b1: begin
						parity_bit = ~^P_data_TB;
						expec_out1 = {1'b1,parity_bit,in_data,1'b0};
					  end
			endcase
		  if(generated_out1 == expec_out1)
		    begin
			   $display ("test Case passed with generated Output %d And expected Output %d",generated_out1,expec_out1);
			   end
		else
		  begin
			$display ("test Case is failed with generated Output %d And expected Output %d",generated_out1,expec_out1);
			end
		end
		
	else
	  begin
	    for(i=0;i<10;i=i+1)
            begin
               #(Clock_Period);
               generated_out2[i] = TX_OUT_TB;
            end
            
            expec_out2 = {1'b1,in_data,1'b0};
            
      if(generated_out2 == expec_out2)
         begin
			   $display ("test Case passed with generated Output %d And expected Output %d",generated_out2,expec_out2);
			   end
		else
		  begin
			$display ("test case is failed ");
			end  
	  end
	  

 end
 endtask
 
  
endmodule