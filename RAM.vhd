library ieee;  -- include libraries
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM is
port(clk,rd,we: in std_logic; -- define input pins clock , read and write enables
addr: in integer range 0 to 3; -- define the address bus with 4 lines
Data_in: in std_logic_vector(7 downto 0);  -- define data in bus with 8 bits ( word of 8 bits)
Data_out: out std_logic_vector(7 downto 0) -- define data out bus with 8 bits ( word of 8 bits)
);		end entity;
architecture arc of ram is 
type my_ram is ARRAY(0 to 3) of std_logic_vector(7 downto 0);  -- Array to store memory data ( ram array )
signal ram: my_ram; -- create signal of my array to be the ram where data will be stored
begin
write_process:	process(clk,we) is  -- create logic for wrtting to the ram memory  with falling eadge of the clock 
		begin 
				if(clk'event and clk = '0') then 
								if(we = '1') then	 ram(addr) <= data_in; end if; -- if write is enabled ( active high)  then write data to the ram ( array)
								end if;	end process;
read_process:	process(clk,rd) 
		begin
			if(clk'event and clk = '1') then
					if(rd = '1') then data_out <= ram(addr);  -- if read is enabled (active high) then read the data from the given address of the ram
					else data_out <= (others => 'Z'); end if;  -- if not enabled of reading then output high impedence ( ZZZZZ)
			end if; end process;
end arc;