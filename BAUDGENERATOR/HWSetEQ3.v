/*
Module/Entity Name:  HWSetEQ3
Signal Names:

	Clk 		-- Clock
	Reset		-- Active High Reset
	Baud_select	-- <as per Q> -bit input to select the baud rate
	Clock_out	-- Output clock/baud
*/

/*
Standard baud rates supported by most serial ports:
//4 bits should cover all 	

1200				//12288/2=6144
 	
2400				//6144/2=3072
4800				//3072/2=1536
		
9600				//1536/2=768
14400				//1024/2=512
 	
19200				//768/2=384
28800				//512/2=256
 	
38400				//384/2=192			
 	
57600				//256/2=128	
115200			//128/2=64
*/
module HWSetEQ3(Clk, Reset, Baud_select, Clock_out);
	input Clk;
	input Reset;		//Asynchronous
	input [3:0]Baud_select;
	output Clock_out;
	
	//Max value is 6143
	reg [15:0]baud_value=16'b0;
	reg Clock_out=0;
/*	
always @(Reset)
	if(Reset==1)
		Clock_out = 0;
	*/
always @(posedge Clk,posedge Reset)
begin
	if(Reset==1)
		Clock_out = 0;
	else
	begin
		baud_value = baud_value+1'b1;
				
		case(Baud_select)
		0:	begin
				if(baud_value==6143)				//Works as 1200
					begin
						Clock_out = ~Clock_out;
						baud_value = 0;
					end
				else
					Clock_out =  Clock_out;
			end
		1:	begin
				if(baud_value==3072)				//Works as 2400
					begin
						Clock_out = ~Clock_out;
						baud_value = 0;
					end
				else
					Clock_out =  Clock_out;
			end
		2:	begin
				if(baud_value==1536)				//Works as 4800
					begin
						Clock_out = ~Clock_out;
						baud_value = 0;
					end
				else
					Clock_out =  Clock_out;
			end
			
		3:	begin
				if(baud_value==768)				//Works as 9600
					begin
						Clock_out = ~Clock_out;
						baud_value = 0;
					end
				else
					Clock_out =  Clock_out;
			end
		4:	begin
				if(baud_value==512)				//Works as 14400
					begin
						Clock_out = ~Clock_out;
						baud_value = 0;
					end
				else
					Clock_out =  Clock_out;
			end
		5:	begin
				if(baud_value==384)				//Works as 19200
					begin
						Clock_out = ~Clock_out;
						baud_value = 0;
					end
				else
					Clock_out =  Clock_out;
			end
		6:	begin
				if(baud_value==256)				//Works as 28800
					begin
						Clock_out = ~Clock_out;
						baud_value = 0;
					end
				else
					Clock_out =  Clock_out;
			end
		7:	begin
				if(baud_value==192)				//Works as 38400
					begin
						Clock_out = ~Clock_out;
						baud_value = 0;
					end
				else
					Clock_out =  Clock_out;
			end
		8:	begin
				if(baud_value==128)				//Works as 57600
					begin
						Clock_out = ~Clock_out;
						baud_value = 0;
					end
				else
					Clock_out =  Clock_out;
			end
		9:	begin
				if(baud_value==64)				//Works as 115200
					begin
						Clock_out = ~Clock_out;
						baud_value = 0;
					end
				else
					Clock_out =  Clock_out;
			end
		default: Clock_out = 0;
		endcase
	end
end
endmodule 