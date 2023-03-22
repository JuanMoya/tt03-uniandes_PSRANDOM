/*######################################################################
//#	G0B1T: HDL EXAMPLES. 2018.
//######################################################################
//# Copyright (C) 2018. F.E.Segura-Quijano (FES) fsegura@uniandes.edu.co
//# 
//# This program is free software: you can redistribute it and/or modify
//# it under the terms of the GNU General Public License as published by
//# the Free Software Foundation, version 3 of the License.
//#
//# This program is distributed in the hope that it will be useful,
//# but WITHOUT ANY WARRANTY; without even the implied warranty of
//# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//# GNU General Public License for more details.
//#
//# You should have received a copy of the GNU General Public License
//# along with this program.  If not, see <http://www.gnu.org/licenses/>
//####################################################################*/
//=======================================================
//  MODULE Definition
//=======================================================
module SC_PSRANDOM #(parameter RegGENERAL_DATAWIDTH=8)(
	//////////// OUTPUTS //////////
	SC_PSRANDOM_data_OutBUS,
	//////////// INPUTS //////////
	SC_PSRANDOM_CLOCK_50,
	SC_PSRANDOM_RESET_InHigh
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[RegGENERAL_DATAWIDTH-1:0]	SC_PSRANDOM_data_OutBUS;
input		SC_PSRANDOM_CLOCK_50;
input		SC_PSRANDOM_RESET_InHigh;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [RegGENERAL_DATAWIDTH-1:0] PSRANDOM_Register;
reg [RegGENERAL_DATAWIDTH-1:0] PSRANDOM_Signal;
wire feedback;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
		PSRANDOM_Signal = {PSRANDOM_Register[6:0], feedback}; //shift left the xor'd every posedge clock;
end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_PSRANDOM_CLOCK_50, posedge SC_PSRANDOM_RESET_InHigh)
begin
	if (SC_PSRANDOM_RESET_InHigh == 1'b1)
		PSRANDOM_Register <= 8'b10000001;
	else
		PSRANDOM_Register <= PSRANDOM_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign feedback = PSRANDOM_Register[7] ^ PSRANDOM_Register[5] ^ PSRANDOM_Register[3] ^ PSRANDOM_Register[0];  
assign SC_PSRANDOM_data_OutBUS = PSRANDOM_Register;

endmodule
