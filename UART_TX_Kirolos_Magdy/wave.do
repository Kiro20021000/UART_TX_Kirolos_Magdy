onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {main signals} -color {Midnight Blue} /UART_TX_TB/DUT/CLK
add wave -noupdate -expand -group {main signals} /UART_TX_TB/DUT/Data_Valid
add wave -noupdate -expand -group {main signals} /UART_TX_TB/DUT/Mux_sel
add wave -noupdate -expand -group {main signals} /UART_TX_TB/DUT/PAR_EN
add wave -noupdate -expand -group {main signals} /UART_TX_TB/DUT/PAR_TYP
add wave -noupdate -expand -group {main signals} /UART_TX_TB/DUT/P_data
add wave -noupdate -expand -group {main signals} /UART_TX_TB/DUT/Par_bit
add wave -noupdate -expand -group {main signals} /UART_TX_TB/DUT/RST
add wave -noupdate -expand -group {main signals} /UART_TX_TB/DUT/Ser_data
add wave -noupdate -expand -group {main signals} -color Firebrick /UART_TX_TB/DUT/TX_OUT
add wave -noupdate -expand -group {main signals} /UART_TX_TB/DUT/busy
add wave -noupdate -expand -group {main signals} /UART_TX_TB/DUT/ser_Done
add wave -noupdate -expand -group {main signals} /UART_TX_TB/DUT/ser_En
add wave -noupdate -expand -group {fsm signals} /UART_TX_TB/DUT/F/Data_valid
add wave -noupdate -expand -group {fsm signals} /UART_TX_TB/DUT/F/busy
add wave -noupdate -expand -group {fsm signals} /UART_TX_TB/DUT/F/busy_comp
add wave -noupdate -expand -group {fsm signals} /UART_TX_TB/DUT/F/current_state
add wave -noupdate -expand -group {fsm signals} /UART_TX_TB/DUT/F/mux_sel
add wave -noupdate -expand -group {fsm signals} /UART_TX_TB/DUT/F/next_state
add wave -noupdate -expand -group {fsm signals} /UART_TX_TB/DUT/F/par_en
add wave -noupdate -expand -group {fsm signals} /UART_TX_TB/DUT/F/ser_done
add wave -noupdate -expand -group {fsm signals} /UART_TX_TB/DUT/F/ser_en
add wave -noupdate -expand -group serializer /UART_TX_TB/DUT/S/Data_valid
add wave -noupdate -expand -group serializer /UART_TX_TB/DUT/S/P_data
add wave -noupdate -expand -group serializer /UART_TX_TB/DUT/S/counter
add wave -noupdate -expand -group serializer /UART_TX_TB/DUT/S/done_signal
add wave -noupdate -expand -group serializer /UART_TX_TB/DUT/S/ser_data
add wave -noupdate -expand -group serializer /UART_TX_TB/DUT/S/ser_done
add wave -noupdate -expand -group serializer /UART_TX_TB/DUT/S/ser_en
add wave -noupdate -expand -group serializer /UART_TX_TB/DUT/S/temp_data
add wave -noupdate -expand -group {TB Signals} /UART_TX_TB/Data_Valid_TB
add wave -noupdate -expand -group {TB Signals} /UART_TX_TB/PAR_EN_TB
add wave -noupdate -expand -group {TB Signals} /UART_TX_TB/PAR_TYP_TB
add wave -noupdate -expand -group {TB Signals} /UART_TX_TB/P_data_TB
add wave -noupdate -expand -group {TB Signals} /UART_TX_TB/TX_OUT_TB
add wave -noupdate -expand -group {TB Signals} /UART_TX_TB/busy_TB
add wave -noupdate -expand -group {TB Signals} /UART_TX_TB/check_operation/expec_out1
add wave -noupdate -expand -group {TB Signals} /UART_TX_TB/check_operation/expec_out2
add wave -noupdate -expand -group {TB Signals} /UART_TX_TB/check_operation/i
add wave -noupdate -expand -group {TB Signals} /UART_TX_TB/check_operation/in_data
add wave -noupdate -expand -group {TB Signals} /UART_TX_TB/check_operation/parity_bit
add wave -noupdate /UART_TX_TB/check_operation/generated_out2
add wave -noupdate /UART_TX_TB/check_operation/generated_out1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {328868 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {310725 ps} {615225 ps}
