------------------------------------------------------------------------------
--                                                                          --
--                           OCARINA COMPONENTS                             --
--                                                                          --
--                 OCARINA.FE_AADL.PARSER.COMPONENTS.FLOWS                  --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
--               Copyright (C) 2008-2009 Telecom ParisTech,                 --
--                 2010-2019 ESA & ISAE, 2019-2020 OpenAADL                 --
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

--  This package gathers all functions related to flows (which are
--  used within components).

package Ocarina.FE_AADL.Parser.Components.Flows is

   function P_Flow_Implementation_Or_End_To_End_Flow_Spec
     (Container : Node_Id;
      Refinable : Boolean) return Node_Id;
   --  Parse Flow_Implementation, Flow_Implementation_Refinement,
   --        End_To_End_Flow_Spec and End_To_End_Flow_Refinement.
   --  If Refinable = FALSE, refinements are not allowed

   function P_Flow_Spec
     (Container : Node_Id;
      Refinable : Boolean) return Node_Id;
   --  Parse Flow_Spec and Flow_Spec_Refinement
   --  If Refinable = FALSE, Flow_Spec_Refinement is not allowed

end Ocarina.FE_AADL.Parser.Components.Flows;
