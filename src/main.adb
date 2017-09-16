with VLI;           use VLI;
with Ada.Text_IO;   use Ada.Text_IO;

procedure Main is 
   A : VLI_Type := VLI_Null;
   B : VLI_Type := VLI_Null;
   Increment : constant VLI_Type := To_VLI("1");
begin
    Put_line("Test of VLI module");
    A := To_VLI("1");
    -- B := Add(A,Increment);
 
   for i in 1..30 loop
      B := Add(B,Increment);
      Put_line("[" & To_String(B) & "] =" & "A[" & To_String(A) & "] + [" & To_String(Increment) & "]");
   end loop;
end;
