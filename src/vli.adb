with Ada.Text_IO;               use Ada.Text_IO;
with Ada.Unchecked_Conversion;

package body VLI is

 -----------
 -- Add   --
 -----------
function Add( a : VLI_Type; b : VLI_Type ) return VLI_Type is 
      result    : VLI_Type := VLI_NULL;
      d         : Integer := 0;
      carryover : Integer := 0;
   begin
      for i in result'range loop
         d := a(i) + b(i) + carryover ;
         if(d > 9 ) then
            carryover := d / 10;
            put_line("carryover :" & Integer'Image(carryover));
         else
            carryover := 0;
         end if;
        
         result(i) := d rem 10;
      end loop;
            
      return result;
end Add;
 
------------
-- To_VLI --
------------
function To_VLI( S : in String ) return VLI_Type is
    result : VLI_Type := VLI_Null;
     
   function Convert is new Ada.Unchecked_Conversion (Source => Character,
                                                     Target => Integer);


    function To_String(c : Character ) return String is
        result : String := " ";
    begin
        result(result'first) := c;

        return result;
    end To_String;


   begin
      for i in reverse S'range loop
         declare 
         -- translates the string position into the digit place in the vli
            function place(i : Integer) return Integer is 
            begin
               return S'last - i+1; -- place value
            end place;
   
         begin
            if( place(i) in result'range ) then
               result(place(i)) := Convert( S(i) ) - Character'Pos('0');
            else
               put_line(Integer'Image(place(i)));
            end if;
         end ;
    end loop;

    return result;
end To_VLI;

---------------
-- To_String --
---------------
function To_String(R : VLI_Type) return string is 
      result : String(R'range);
      map  : constant array(0..9) of Character := "0123456789";
      
      function place(i : Integer) return Integer is 
      begin
         return R'last - i+1; -- place value
      end place;
   
   begin 
       for i in R'range  loop
         if( R(i) in Digit_Type'Range) then
            result(place(i)) := map(R(i) rem 10);
         else 
            result(Place(i)) := '+';
         end if;
   end loop;

   return result;
end To_String;

end VLI;
