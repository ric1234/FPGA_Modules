onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /HWSetEQ3/Clk
add wave -noupdate /HWSetEQ3/Reset
add wave -noupdate -radix hexadecimal /HWSetEQ3/Baud_select
add wave -noupdate /HWSetEQ3/Clock_out
add wave -noupdate -radix hexadecimal /HWSetEQ3/baud_value
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7851241907 ps} 0} {{Cursor 2} {7018042245 ps} 1}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {6949174917 ps} {9750789589 ps}
