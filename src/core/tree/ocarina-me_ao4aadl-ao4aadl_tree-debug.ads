------------------------------------------------------------------------------
--                                                                          --
--                           OCARINA COMPONENTS                             --
--                                                                          --
--                  OCARINA.ME_AO4AADL.AO4AADL_TREE.DEBUG                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
--         Copyright (C) 2016-2019 ESA & ISAE, 2019-2020 OpenAADL           --
--                                                                          --
-- Ocarina  is free software; you can redistribute it and/or modify under   --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion. Ocarina is distributed in the hope that it will be useful, but     --
-- WITHOUT ANY WARRANTY; without even the implied warranty of               --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                     --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
--                    Ocarina is maintained by OpenAADL team                --
--                              (info@openaadl.org)                         --
--                                                                          --
------------------------------------------------------------------------------

with Ocarina.ME_AO4AADL.AO4AADL_Tree.Nodes;
with Ocarina.Output; use Ocarina.Output;
with Ocarina.Types;

package Ocarina.ME_AO4AADL.AO4AADL_Tree.Debug is
   use Ocarina.ME_AO4AADL.AO4AADL_Tree.Nodes;
   use Ocarina.Types;

   N_Indents : Integer := -1;

   procedure W_Eol         (N : Natural := 1) renames Output.Write_Eol;
   procedure W_Int         (N : Int)          renames Output.Write_Int;
   procedure W_Indentation;
   procedure W_Line        (N : String)       renames Output.Write_Line;
   procedure W_Str         (N : String)       renames Output.Write_Str;

   procedure W_Boolean     (N : Boolean);
   procedure W_Byte        (N : Byte);

   procedure W_List_Id     (L : List_Id);
   procedure W_Node_Id     (N : Node_Id);
   procedure W_Node_Header (N : Node_Id);

   procedure W_Node_Attribute
     (A : String;
      T : String;
      V : String;
      N : Int := 0);

   function Image (N : Node_Kind) return String;
   function Image (N : Name_Id) return String;
   function Image (N : Node_Id) return String;
   function Image (N : List_Id) return String;
   function Image (N : Operator_Id) return String;
   function Image (N : Boolean) return String;
   function Image (N : Byte) return String;
   function Image (N : Int) return String;
   function Image (N : Value_Id) return String;
   function Image (N : Mode_Id) return String;

end Ocarina.ME_AO4AADL.AO4AADL_Tree.Debug;
