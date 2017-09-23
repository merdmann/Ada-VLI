package VLI is

   subtype Digit_Type is Integer range 0..10;

   MAX_VLI : constant Integer   := 20;

   type VLI_Type is array (Natural range 1..MAX_VLI ) of Digit_Type;

   VLI_Null : constant VLI_Type := (others=> 0);

   function Add(a,b : VLI_Type) return VLI_Type;

   function To_VLI( S : in String ) return VLI_Type;
   function To_String(R : VLI_Type) return String;



   function "+" (Left, Right : VLI_Type) return VLI_Type;
   function "-" (Left, Right : VLI_Type) return VLI_Type;

   function multiply( scalar : Float; value : VLI_Type ) return VLI_Type;


end VLI;
