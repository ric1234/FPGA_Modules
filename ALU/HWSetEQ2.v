//Q2 from 7:17
module HWSetEQ2(Op, A, B, Y, Clock, Y_temp);
/*A 
Signal Names:

	A 		-- Input < as per Q> bit A to ALU
	B		--  Input < as per Q> bit B to ALU
	Op		--  Input ALU Opcodes
	Y		--  <as per Q> bit output of ALU 
*/

	input [31:0] A;	//Input A
	input [31:0] B;	//Input B
	input [4:0] Op;	//ALU operations
	output [31:0] Y;	//Output
	inout [31:0]Y_temp;
		
	input Clock;
	reg[31:0] ALU_OUT;
	reg[31:0] Y_temp;
	reg[31:0] Y;
	
always @(Op[4:2] or A or B)
	case(Op[4:2])
		3'b000: 	ALU_OUT=A;				//Pass A
		3'b001:	ALU_OUT=A+B;			//Add
		3'b010:	ALU_OUT=A-B;			//Subtract
		3'b011:	ALU_OUT=A & B;		//Logical and
		3'b100:	ALU_OUT=A | B;		//Logical OR
		3'b101:	ALU_OUT=A+1;//Check number 1	//Increment 1
		3'b110:	ALU_OUT=A-1;			//Decrement by 1
		3'b111:	ALU_OUT=B;				//Pass B
		default: ALU_OUT=0;
	endcase
always @(posedge Clock)
	case(Op[1:0])
		2'b00:	Y_temp=ALU_OUT;				//Pass ALU out
		2'b01: 	Y_temp=ALU_OUT<<1;			//Shift left
		2'b10:	Y_temp=ALU_OUT>>1;			//Shift right
		2'b11:	Y_temp=0;						//Pass 0s
	endcase

always @(posedge Clock)
	begin
		Y = Y_temp;
	end
endmodule 

