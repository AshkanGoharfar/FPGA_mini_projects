library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity INC_a is
 
 Port ( 
   Iin :in std_logic_vector(7 downto 0);
   Y :out  std_logic_vector(8 downto 0)
 );
end entity INC_a;
architecture Behavioral of INC_a is 
component HA is 
             port(
                  A :in std_logic;
                  B :in std_logic;
                  S :out std_logic;
                  C :out std_logic
                 );
 end component;
signal ca :std_logic_vector (Iin'high+1 downto Iin'low );
begin
    ADDER: for I in Iin'range  generate
    
    ADDFIRST: if I=Iin'low generate
       HA1: HA port map(A=>Iin(Iin'low),B=>'1',S=>Y(Y'low),C=>ca(0));
    end generate ADDFIRST;
    
    ADD: if I/=0 and I/=Iin'high generate
       HA2: HA port map(A=>Iin(I),B=>ca(I-1),S=>Y(I),C=>ca(I));
    end generate ADD;
    
    ADDEND: if I=Iin'high generate
       HA3: HA port map(A=>Iin(Iin'high),B=>ca(Iin'high-1),S=>Y(Iin'high),C=>ca(Iin'high));
    end generate ADDEND;

end generate ADDER;
Y(Iin'high+1)<=ca(Iin'high);
end architecture ;






