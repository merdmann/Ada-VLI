with Ada.Text_IO;  use Ada.Text_IO;

procedure Testme is


    function C(x : Integer) return Integer is
    begin
        if( (x rem 2) = 0) then
           return(x/2);
        else
           return 3*x+1;
        end if;
    end C;

begin
    declare
      initial : Integer := 5;
    begin
        loop
            declare
                count  : Integer :=  0;
                result : Integer :=  initial;
            begin
                while result > 1 loop
                    result := C(result);

                    count := count + 1;
                end loop;

                Put_line( INteger'Image(initial) & Integer'Image(result) & Integer'Image(count));
            end;
            initial := initial + 1;
        end loop;
    end;
    
end Testme;