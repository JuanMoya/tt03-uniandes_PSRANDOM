/*######################################################################
//#	G0B1T: HDL EXAMPLES. 2023.
//######################################################################
//# Copyright (C) 2023. F.E.Segura-Quijano (FES) fsegura@uniandes.edu.co
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
`default_nettype none

module BB_SYSTEM (
  input [7:0] io_in,
  output [7:0] io_out
);

//=======================================================
//  PARAMETER declarations
//=======================================================
parameter DATAWIDTH_BUS = 8;
//=======================================================
//  PORT declarations
//=======================================================
wire		[DATAWIDTH_BUS-1:0]	BB_SYSTEM_data_OutBUS;
assign 		io_out[7:0] = BB_SYSTEM_data_OutBUS;

wire		BB_SYSTEM_CLOCK_50 = io_in[0];
wire		BB_SYSTEM_RESET_InHigh = io_in[1];
wire		BB_SYSTEM_load_InLow = io_in[2];
wire		BB_SYSTEM_rand_InLow = io_in[3];
wire		[DATAWIDTH_BUS-5:0] BB_SYSTEM_data_InBUS;
assign		BB_SYSTEM_data_InBUS = io_in[3:0];
//=======================================================
//  REG/WIRE declarations
//=======================================================
wire	STATEMACHINE_load_cwire;
wire	STATEMACHINE_rand_cwire;
wire 	BB_SYSTEM_load_InLow_cwire;
wire 	BB_SYSTEM_rand_InLow_cwire;
wire 	[DATAWIDTH_BUS-1:0] PSRANDOM_to_RegGENERAL_cwire;
//=======================================================
//  Structural coding
//=======================================================
SC_DEBOUNCE1 SC_DEBOUNCE1_u0 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_load_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(BB_SYSTEM_load_InLow)
);

SC_DEBOUNCE1 SC_DEBOUNCE1_u1 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_rand_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(BB_SYSTEM_rand_InLow)
);

	SC_STATEMACHINE SC_STATEMACHINE_u0 (
// port map - connection between master ports and signals/registers   
	.SC_STATEMACHINE_load_OutLow(STATEMACHINE_load_cwire), 
	.SC_STATEMACHINE_rand_OutLow(STATEMACHINE_rand_cwire), 
	.SC_STATEMACHINE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINE_load_InLow(BB_SYSTEM_load_InLow_cwire),
	.SC_STATEMACHINE_rand_InLow(BB_SYSTEM_rand_InLow_cwire)
);

SC_PSRANDOM #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_PSRANDOM_u0 (
// port map - connection between master ports and signals/registers   
	.SC_PSRANDOM_data_OutBUS(PSRANDOM_to_RegGENERAL_cwire),
	.SC_PSRANDOM_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_PSRANDOM_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_PSRANDOM_data_InBUS(BB_SYSTEM_data_InBUS)
);

SC_RegGENERAL #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_RegGENERAL_u0 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_data_OutBUS(BB_SYSTEM_data_OutBUS),
	.SC_RegGENERAL_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegGENERAL_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegGENERAL_load_InLow(STATEMACHINE_load_cwire),
	.SC_RegGENERAL_rand_InLow(STATEMACHINE_rand_cwire),
	.SC_RegGENERAL_data_InBUS(PSRANDOM_to_RegGENERAL_cwire)
);

endmodule
