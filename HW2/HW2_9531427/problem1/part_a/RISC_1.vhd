

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

 
entity RISC_1 is
    Port ( instruction_bus : in  STD_LOGIC_VECTOR (31 downto 0);
           decode_opcode : out  STD_LOGIC_VECTOR (15 downto 0));
end RISC_1;

architecture Behavioral of RISC_1 is


subtype INSTRUCTION is bit_vector(31 downto 0);


subtype OP_CODE  is  bit_vector(6 downto 0);
subtype RD       is bit_vector(11 downto 7);
subtype IMM      is bit_vector(31 downto 0); 
subtype FUNC3    is bit_vector(2 downto 0);
subtype RS       is bit_vector(4 downto 0);
subtype FUNC7     is bit_vector(6 downto 0);

signal R_Type , I_Type ,S_Type , B_Type , U_Type ,J_Type   : INSTRUCTION;
signal opcode_R,opcode_I,opcode_S,opcode_B,opcode_U,opcode_J :OP_CODE;
signal imm_I,imm_S,imm_B,imm_U,imm_J : IMM;
signal rd_R,rd_I,rd_U,rd_J : RD;
signal func3_R,func3_I,func3_S,func3_B : FUNC3;
signal rs1_R,rs1_I,rs1_S,rs1_B  : RS;
signal rs2_R,rs2_S,rs2_B  :RS;
signal func7_R :FUNC7;

begin
 opcode_R<=R_Type(6 downto 0);
 opcode_I<=I_Type(6 downto 0);
 opcode_S<=S_Type(6 downto 0);
 opcode_B<=B_Type(6 downto 0);
 opcode_U<=U_Type(6 downto 0);
 opcode_J<=J_Type(6 downto 0);
 
 rd_R<=R_Type(11 downto 7);
 rd_I<=I_Type(11 downto 7);
 rd_U<=U_Type(11 downto 7);
 rd_J<=J_Type(11 downto 7);
 
 func3_R<=R_Type(14 downto 12);
 func3_I<=I_Type(14 downto 12);
 func3_S<=S_Type(14 downto 12);
 func3_B<=B_Type(14 downto 12); 
 
 imm_I(11 downto 0)<=I_Type(31 downto  20);
 imm_S(11 downto 0)<=S_Type(31 downto 25) & S_Type(11 downto 7);
 imm_B(12 downto 1)<=B_Type(31)&B_Type(7)&B_Type(30 downto 25)&B_Type(4 downto 1);
 imm_U(31 downto 12) <=U_Type(31 downto 12);
 imm_J(20 downto 1) <=J_Type(31)&J_Type(19 downto 12)&J_Type(20)&J_Type(30 downto 21); 
 
 rs1_R<=R_Type(19 downto 15);
 rs1_I<=I_Type(19 downto 15);
 rs1_S<=S_Type(19 downto 15);
 rs1_B<= B_Type(19 downto 15);
 
 rs2_R<=R_Type(24 downto 20);
 rs2_S<=S_Type(24 downto 20);
 rs2_B(3 downto 0)<=B_Type(23 downto 20);

 func7_R<=R_Type(31 downto 25);
  


end Behavioral;

