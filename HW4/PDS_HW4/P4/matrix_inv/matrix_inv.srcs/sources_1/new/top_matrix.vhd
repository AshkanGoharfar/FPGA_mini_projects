----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/19/2019 05:34:09 PM
-- Design Name: 
-- Module Name: top_matrix - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_matrix is
    Port ( data_in : in STD_LOGIC_VECTOR (15 downto 0);
           data_in_index : in STD_LOGIC_VECTOR (1 downto 0);
           data_out : out STD_LOGIC_VECTOR (15 downto 0);
           data_out_index : out STD_LOGIC_VECTOR (1 downto 0);
           clk   : in std_logic;
           valid : out STD_LOGIC);
end top_matrix;

architecture Behavioral of top_matrix is
COMPONENT mult_gen_0
  PORT (
    CLK : IN STD_LOGIC;
    A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    P : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;

COMPONENT div_gen_0
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_divisor_tvalid : IN STD_LOGIC;
    s_axis_divisor_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_dividend_tvalid : IN STD_LOGIC;
    s_axis_dividend_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_dout_tvalid : OUT STD_LOGIC;
    m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
  );
END COMPONENT;


signal a11:std_logic_vector(15 downto 0);
signal a12:std_logic_vector(15 downto 0);
signal a21:std_logic_vector(15 downto 0);
signal a22:std_logic_vector(15 downto 0);
signal P1 :STD_LOGIC_VECTOR(31 DOWNTO 0);
signal P2 :STD_LOGIC_VECTOR(31 DOWNTO 0);

signal b11:std_logic_vector(47 downto 0);
signal b12:std_logic_vector(47 downto 0);
signal b21:std_logic_vector(47 downto 0);
signal b22:std_logic_vector(47 downto 0);



signal a:std_logic_vector(15 downto 0);
signal b:std_logic_vector(15 downto 0);
signal P :STD_LOGIC_VECTOR(31 DOWNTO 0);
signal det :STD_LOGIC_VECTOR(31 DOWNTO 0);


signal   s_axis_divisor_tvalid :  STD_LOGIC;
signal    s_axis_divisor_tdata : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal    s_axis_dividend_tvalid :  STD_LOGIC;
signal    s_axis_dividend_tdata :  STD_LOGIC_VECTOR(15 DOWNTO 0);
signal    m_axis_dout_tvalid :  STD_LOGIC;
signal    m_axis_dout_tdata :  STD_LOGIC_VECTOR(47 DOWNTO 0);
type st  is(read,cal1,cal2,cal3,cal4,cal5,cal6,cal7,result1,result2,result3,result4);
signal state :st:=read;
signal delay :unsigned(7 downto 0):=x"00";

begin
my_multi  : mult_gen_0
  PORT MAP (
    CLK => CLK,
    A => a,
    B => b,
    P => P
  );

 
my_divide : div_gen_0
    PORT MAP (
      aclk => clk,
      s_axis_divisor_tvalid => s_axis_divisor_tvalid,
      s_axis_divisor_tdata => s_axis_divisor_tdata,
      s_axis_dividend_tvalid => s_axis_dividend_tvalid,
      s_axis_dividend_tdata => s_axis_dividend_tdata,
      m_axis_dout_tvalid => m_axis_dout_tvalid,
      m_axis_dout_tdata => m_axis_dout_tdata
    );

process(clk)
begin
if rising_edge(clk) then

   case state is
     when read =>
        if data_in_index="00"   then
           a11<=data_in;
        elsif data_in_index="01" then
           a12<=data_in; 
        elsif data_in_index="10" then
           a21<=data_in; 
        elsif data_in_index="11" then
            a22<=data_in; 
            state<=cal1;
            delay<=x"05";
        end if;   
     when cal1=>
          a<=a11;
          b<=a22;
          if delay>x"00" then
            delay<=delay-1;
          else
            p1<=p;
            state<=cal2;
            delay<=x"05";
          end if;  
     when cal2=>
     a<=a21;
     b<=a12;
     if delay>x"00" then
       delay<=delay-1;
     else
       p2<=p;
       state<=cal3;
     end if; 
     when cal3=>
      det<=std_logic_vector(signed(p1)-signed(p2));
      state<=cal4;
      delay<=x"40";
     when cal4=>
      s_axis_dividend_tdata<=a22;
      s_axis_divisor_tdata<=det;
      s_axis_dividend_tvalid<='1';
      s_axis_divisor_tvalid<='1';
      if  delay>0 then
         delay<=delay-1;
      else
         b11<=m_axis_dout_tdata;
         state<=cal5;
         delay<=x"40";
      end if;
     when cal5=>
     s_axis_dividend_tdata<=std_logic_vector(unsigned(not(a12))+1);
     s_axis_divisor_tdata<=det;
     s_axis_dividend_tvalid<='1';
     s_axis_divisor_tvalid<='1';
     if  delay>0 then
        delay<=delay-1;
     else
        b12<=m_axis_dout_tdata;
        state<=cal6;
        delay<=x"40";
     end if;  
     when cal6=>
     s_axis_dividend_tdata<=a21;
     s_axis_divisor_tdata<=det;
     s_axis_dividend_tvalid<='1';
     s_axis_divisor_tvalid<='1';
     if  delay>0 then
        delay<=delay-1;
     else
        b21<=m_axis_dout_tdata;
        state<=cal7;
        delay<=x"40";
     end if;
     when cal7=>
     s_axis_dividend_tdata<=a11;
     s_axis_divisor_tdata<=det;
     s_axis_dividend_tvalid<='1';
     s_axis_divisor_tvalid<='1';
     if  delay>0 then
        delay<=delay-1;
     else
        b22<=m_axis_dout_tdata;
        state<=result1;
        delay<=x"40";
     end if;
   
     
     when result1=>
        data_out_index<="00";
        data_out<=b11(38 downto 23);
        valid<='1';
        state<=result2;
      when result2=>
           data_out_index<="01";
           data_out<=b12(38 downto 23);
            valid<='1';
           state<=result3;  
      when result3=>
              data_out_index<="10";
              data_out<=b21(38 downto 23);
               valid<='1';
              state<=result4;
     when result4=>
                 data_out_index<="11";
                 data_out<=b22(38 downto 23);
                  valid<='1';
                 state<=result4;
  end case;

end if;
end process;


end Behavioral;
