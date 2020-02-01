library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity INC is
generic(N :integer:=8);
 Port ( 
   Iin :in std_logic_vector(N-1 downto 0);
   Y :out  std_logic_vector(N downto 0)
 );
end entity INC;

architecture Behavioral of INC is 

component HA is 
             port(
                  A :in std_logic;
                  B :in std_logic;
                  S :out std_logic;
                  C :out std_logic
                 );
 end component;
signal ca :std_logic_vector (N downto 0);
begin
    ADDER: for I in N-1 downto 0 generate
    
    ADDFIRST: if I=0 generate
       HA1: HA port map(A=>Iin(0),B=>'1',S=>Y(0),C=>ca(0));
    end generate ADDFIRST;
    
    ADD: if I/=0 and I/=N-1 generate
       HA2: HA port map(A=>Iin(I),B=>ca(I-1),S=>Y(I),C=>ca(I));
    end generate ADD;
    
    ADDEND: if I=N-1 generate
       HA3: HA port map(A=>Iin(N-1),B=>ca(N-2),S=>Y(N-1),C=>ca(N-1));
    end generate ADDEND;

end generate ADDER;
Y(N)<=ca(N-1);

end architecture ;






