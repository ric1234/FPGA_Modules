/*
Author: This file contains a state machine with 2 states
*/
module stateMachine1 (clk, reset, input1, output1);
	input clk, reset, input1;
	output output1;
	reg output1;
	reg state;
	parameter state_A=0, state_B=1;

always@(posedge clk or posedge reset)
	begin 
		if(reset)
			state=state_A;
		else
			case(state)
				state_A:
					if(input1==0)
						state=state_B;
					else 
						state=state_A;
				state_B:
					if(input1==1)
						state = state_A;
					else
						state = state_B;
				default: 
					state = state_A;
			endcase
	end

always@(state)
	begin
		case(state)
			state_A: output1 = 0;
			state_B: output1 = 1;
			default: output1 = 0;
		endcase
	end
endmodule
