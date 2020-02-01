

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

 
entity RISC_1 is
    Port ( instruction_bus : in  bit_vector (31 downto 0);
           decode_opcode : out  bit_vector (15 downto 0));
end RISC_1;

architecture Behavioral of RISC_1 is


 


subtype OP_CODE  is  bit_vector(6 downto 0);
subtype RD_I       is bit_vector(11 downto 7);
subtype IMM_I      is bit_vector(31 downto 0); 
subtype FUNC3_I    is bit_vector(2 downto 0);
subtype RS_I       is bit_vector(4 downto 0);
subtype FUNC7_I     is bit_vector(6 downto 0);

type R_Type is record
   op :OP_CODE;
   rd    :RD_I;
	func3:FUNC3_I;
	rs1 :RS_I;
	rs2: RS_I;
	func7:FUNC7_I;
end record;

type I_Type is record
   op :OP_CODE;
   rd    :RD_I;
	func3:FUNC3_I;
	rs1 :RS_I;
   imm  : IMM_I;
end record;

type S_Type is record
   op :OP_CODE;
   imm : IMM_I;
	func3:FUNC3_I;
	rs1 :RS_I;
	rs2: RS_I;
end record;

type B_Type is record
   op :OP_CODE;
   imm : IMM_I;
	func3:FUNC3_I;
	rs1 :RS_I;
	rs2: RS_I;
end record;


type U_Type is record
   op :OP_CODE;
   imm : IMM_I;
   rd    :RD_I;
end record;

type J_Type is record
   op :OP_CODE;
   imm : IMM_I;
   rd    :RD_I;
end record;


 

signal R_instruction  :R_Type;
signal I_instruction  :I_Type;
signal S_instruction  :S_Type;
signal B_instruction  :B_Type;
signal U_instruction  :U_Type;
signal J_instruction  :J_Type;


begin

 

R_instruction.OP<=instruction_bus(6 downto 0);
I_instruction.OP<=instruction_bus(6 downto 0);
S_instruction.OP<=instruction_bus(6 downto 0);
B_instruction.OP<=instruction_bus(6 downto 0);
U_instruction.OP<=instruction_bus(6 downto 0);
J_instruction.OP<=instruction_bus(6 downto 0);
-- 
R_instruction.rd<=instruction_bus(11 downto 7);
I_instruction.rd<=instruction_bus(11 downto 7);
U_instruction.rd<=instruction_bus(11 downto 7);
J_instruction.rd<=instruction_bus(11 downto 7);
-- 
R_instruction.func3<=instruction_bus(14 downto 12);
I_instruction.func3<=instruction_bus(14 downto 12);
S_instruction.func3<=instruction_bus(14 downto 12);
B_instruction.func3<=instruction_bus(14 downto 12); 
-- 
I_instruction.imm(11 downto 0)<=instruction_bus(31 downto  20);
S_instruction.imm(11 downto 0)<=instruction_bus(31 downto 25) & instruction_bus(11 downto 7);
B_instruction.imm(12 downto 1)<=instruction_bus(31)&instruction_bus(7)&instruction_bus(30 downto 25)&instruction_bus(4 downto 1);
U_instruction.imm(31 downto 12) <=instruction_bus(31 downto 12);
J_instruction.imm(20 downto 1) <=instruction_bus(31)&instruction_bus(19 downto 12)&instruction_bus(20)&instruction_bus(30 downto 21); 
-- 
R_instruction.rs1<=instruction_bus(19 downto 15);
I_instruction.rs1<=instruction_bus(19 downto 15);
S_instruction.rs1<=instruction_bus(19 downto 15);
B_instruction.rs1<= instruction_bus(19 downto 15);
-- 
R_instruction.rs2<=instruction_bus(24 downto 20);
S_instruction.rs2<=instruction_bus(24 downto 20);
B_instruction.rs2(3 downto 0)<=instruction_bus(23 downto 20);
--
R_instruction.func7<=instruction_bus(31 downto 25);
  


end Behavioral;

