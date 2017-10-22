/*
Module/Entity Name:  HWSetEQ1
Signal Names:

	clk 		-- Clock
	RdPtrClr	--  Read Pointer Clear,  to reset the read pointer
	WrPtrClr	--  Write Pointer Clear, to reset the write pointer
	rdinc		--  Read pointer increment signal 
	wrinc		--  Write pointer increment signal
	DataIn		--  Data input bus
	DataOut	--  Data Output bus
	rden		--  read (output) enable
	wden		--  write (input) enable

*/


module HWSetEQ1(clk, RdPtrClr, WrPtrClr, rdinc, wrinc, DataIn, DataOut, rden, wden);
	input clk;				//Clock
	input RdPtrClr; 		//
	input WrPtrClr; 
	input rdinc; 			
	input	wrinc;
	input [8:0]DataIn; 
	output [8:0]DataOut;
	
	input rden;
	input wden;
	
	reg [8:0]DataOut;
	
	reg [8:0] Element[7:0];
	
	//Since there are 8 elements of size 9bits, the address will be 3 bits long
	reg [2:0]RdPtr; 				
	reg [2:0]WrPtr; 
	
always @(posedge clk)
	begin
		if(RdPtrClr==1)
			RdPtr=3'b000;
			
		if (rdinc==1)
			RdPtr=RdPtr+3'b001;
			
		if(rden==1)
		begin
			DataOut[8:0] = Element[RdPtr][8:0];
			RdPtr=RdPtr+3'b001;
		end
		
		else
			DataOut= 1'bZ;
		
	end	
	
always @(posedge clk)
	begin
		if(WrPtrClr==1)
			WrPtr=3'b000;
		
		if (wrinc==1)
			WrPtr=WrPtr+3'b001;
			
		if(wden == 1)
		begin
			Element[WrPtr][8:0]= DataIn[8:0];
			WrPtr=WrPtr+3'b001;
		end
	end
endmodule 