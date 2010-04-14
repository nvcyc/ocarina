------------------------------------------------------------------------------
--                                                                          --
--                           OCARINA COMPONENTS                             --
--                                                                          --
--  O C A R I N A . B A C K E N D S . X M L _ C O M M O N . M A P P I N G   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--                 Copyright (C) 2009, GET-Telecom Paris.                   --
--                                                                          --
-- Ocarina  is free software;  you  can  redistribute  it and/or  modify    --
-- it under terms of the GNU General Public License as published by the     --
-- Free Software Foundation; either version 2, or (at your option) any      --
-- later version. Ocarina is distributed  in  the  hope  that it will be    --
-- useful, but WITHOUT ANY WARRANTY;  without even the implied warranty of  --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General --
-- Public License for more details. You should have received  a copy of the --
-- GNU General Public License distributed with Ocarina; see file COPYING.   --
-- If not, write to the Free Software Foundation, 51 Franklin Street, Fifth --
-- Floor, Boston, MA 02111-1301, USA.                                       --
--                                                                          --
-- As a special exception,  if other files  instantiate  generics from this --
-- unit, or you link  this unit with other files  to produce an executable, --
-- this  unit  does not  by itself cause  the resulting  executable to be   --
-- covered  by the  GNU  General  Public  License. This exception does not  --
-- however invalidate  any other reasons why the executable file might be   --
-- covered by the GNU Public License.                                       --
--                                                                          --
--                 Ocarina is maintained by the Ocarina team                --
--                       (ocarina-users@listes.enst.fr)                     --
--                                                                          --
------------------------------------------------------------------------------

with Ocarina.Backends.XML_Values;
with Ocarina.Backends.XML_Tree.Nutils;

package body Ocarina.Backends.XML_Common.Mapping is

   use Ocarina.Backends.XML_Tree.Nutils;
   package XV  renames Ocarina.Backends.XML_Values;

   --------------
   -- Map_Time --
   --------------

   function Map_Time (T : Time_Type) return Node_Id is
      Time : Unsigned_Long_Long;
   begin
      case T.U is
         when Picosecond =>
            --  Our framework only support microseconds
            --  Picosecond and Nanosecond are ignored
            if T.T mod 1_000_000 = 0 then
               Time := T.T / 1_000_000;
            else
               return No_Node;
            end if;

         when Nanosecond =>
            if T.T mod 1000 = 0 then
               Time := T.T / 1000;
            else
               return No_Node;
            end if;

         when Microsecond =>
            Time := T.T;

         when Millisecond =>
            Time := T.T;

         when Second =>
            Time := T.T;

         when Minute =>
            Time := T.T;

         when Hour =>
            --  Convert it into minutes

            Time := T.T * 60;
      end case;

      return Make_Literal (XV.New_Numeric_Value (Time, 1, 10));
   end Map_Time;

end Ocarina.Backends.XML_Common.Mapping;
