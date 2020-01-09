------------------------------------------------------------------------------
--                                                                          --
--                           OCARINA COMPONENTS                             --
--                                                                          --
--   O C A R I N A . B A C K E N D S . P O _ H I _ A D A . M A P P I N G    --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
--    Copyright (C) 2006-2009 Telecom ParisTech, 2010-2020 ESA & ISAE.      --
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
--                 Ocarina is maintained by the TASTE project               --
--                      (taste-users@lists.tuxfamily.org)                   --
--                                                                          --
------------------------------------------------------------------------------

--  This package contains routines to map entities from the AADL tree
--  into entities of the PolyORB-HI Ada tree.

with Ocarina.Backends.Properties; use Ocarina.Backends.Properties;

package Ocarina.Backends.PO_HI_Ada.Mapping is

   function Map_Distributed_Application (E : Node_Id) return Node_Id;
   --  Create a PolyORB-HI Ada distributed application node mapped
   --  from the AADL architecture instance node E.

   function Map_HI_Node (E : Node_Id) return Node_Id;
   --  Create a PolyORB-HI Ada node of a distributed application

   function Map_HI_Unit (E : Node_Id) return Node_Id;
   --  Create the node that contain all the Ada units generated for a
   --  particular node of the distributed application.

   function Map_Ada_Time (T : Time_Type) return Node_Id;
   --  Create the call from the corresponding Ada real time routines
   --  to create an Ada time span that corresponds to the given time
   --  T. If an error occurs (for example if the given time is too
   --  small to be generated by Ada or the used unit is too fine
   --  grained (picoseconds), return No_Node.

   function Map_Ada_Priority (P : Unsigned_Long_Long) return Node_Id;
   --  Maps the given AADL priority into an Ada priority

   function Map_Refined_Global_Name (E : Node_Id) return Node_Id;

   function Map_Marshallers_Name (E : Node_Id) return Name_Id;
   --  Maps a name for the marshallers package instantiation generated
   --  for node E.

   function Map_Task_Job_Identifier (E : Node_Id) return Node_Id;
   --  Map an identifier for the parameterless subprogram that
   --  executes the job of thread instance E.

   function Map_Task_Init_Identifier (E : Node_Id) return Node_Id;
   --  Map an identifier for the parameterless subprogram that
   --  executes the initialization of thread instance E.

   function Map_Task_Recover_Identifier (E : Node_Id) return Node_Id;
   --  Map an identifier for the parameterless subprogram that
   --  executes the recovery action of thread instance E.

   function Map_Task_Identifier (E : Node_Id) return Node_Id;
   --  Map an identifier for the Ada package instance that contains
   --  the task mapped from the thread instance E.

   function Map_Port_Enumeration_Name (E : Node_Id) return Name_Id;
   --  Map a name for the port enumeration type specific to one thread
   --  or subprogram

   function Map_Port_Interface_Name (E : Node_Id) return Name_Id;
   --  Map a name for the record type corresponding to a thread or
   --  subprogram's interface.

   function Map_Port_Status_Name (E : Node_Id) return Name_Id;
   --  Map a name for the Status type corresponding to the subprogram
   --  E.

   function Map_Scheduler_Instance_Name (E : Node_Id) return Name_Id;
   --  Map a name for the scheduler associated to a thread

   function Map_Scheduler_Instance_Object_Name (E : Node_Id) return Name_Id;
   --  Map a name for the scheduler associated to a thread

   function Map_Port_Enumeration (E : Node_Id) return Node_Id;
   --  Creates an enumeration type declaration that gathers all the
   --  ports of the given thread or subprogram E.

   function Map_Port_Interface (E : Node_Id) return Node_Id;
   --  Creates a discriminated record type declaration that
   --  represents the thread or subprogram interface.

   function Map_Port_Status
     (E                : Node_Id;
      Full_Declaration : Boolean) return Node_Id;
   --  Creates the type declaration that gathers the state of the out
   --  ports of a subprogram. If 'Full_Declaration' is False, cretes a
   --  provate type declaration, otherwise, creates the full type
   --  declaration.

   function Map_Node_Name_Identifier (E : Node_Id) return Node_Id;
   --  Map an identifier for the string variable that contains the
   --  node name.

   function Map_Bus_Name (E : Node_Id) return Node_Id;

   function Map_Exported_Length_Symbol (E : Node_Id) return Name_Id;
   --  Map a string literal corresponding to the E 'Length' function
   --  symbol exported to C language.

   function Map_Integer_Array_Name (E : Node_Id) return Name_Id;
   function Map_Kind_Array_Name (E : Node_Id) return Name_Id;
   function Map_Image_Array_Name (E : Node_Id) return Name_Id;
   function Map_Address_Array_Name (E : Node_Id) return Name_Id;
   function Map_Overflow_Protocol_Array_Name (E : Node_Id) return Name_Id;
   function Map_Port_Kinds_Name (E : Node_Id) return Name_Id;
   function Map_Port_Images_Name (E : Node_Id) return Name_Id;
   function Map_FIFO_Sizes_Name (E : Node_Id) return Name_Id;
   function Map_Offsets_Name (E : Node_Id) return Name_Id;
   function Map_Overflow_Protocols_Name (E : Node_Id) return Name_Id;
   function Map_Urgencies_Name (E : Node_Id) return Name_Id;
   function Map_Total_Size_Name (E : Node_Id) return Name_Id;
   function Map_Destination_Name (E : Node_Id) return Name_Id;
   function Map_N_Destination_Name (E : Node_Id) return Name_Id;
   function Map_Interrogators_Name (E : Node_Id) return Name_Id;
   --  Internal routine names used to instanciate the thread interface
   --  generic.

   function Map_Deliver_Name (E : Node_Id) return Name_Id;
   function Map_Send_Name (E : Node_Id) return Name_Id;
   --  Map the names of the internal per-thread subprogram that
   --  perform the delivery/sending of a message for the given thread
   --  instance.

   function Map_Modes_Enumeration_Name (E : Node_Id) return Name_Id;
   function Map_Current_Mode_Name (E : Node_Id) return Name_Id;
   --  Routines for the generation of thread operational modes related
   --  entities.

   function Need_Deliver (E : Node_Id) return Boolean;
   --  Return True if the node E needs a message delivery
   --  subprogram. If the process has at least IN ports or if one of
   --  its threads has at least one IN port, we generate a delivery
   --  subprogram. This subprogram is called by the different
   --  transport layers to deliver messages to the correspoding
   --  destination.

   function Need_Send (E : Node_Id) return Boolean;
   --  Return True if the node E needs a message sending
   --  subprogram. If the process has at least OUT ports or if one of
   --  its threads has at least one OUT port, we generate a sending
   --  subprogram. This subprogram is called by the protocol layer to
   --  send messages to the correspoding destination.

   Node_Type_Size   : constant := 8;
   Entity_Type_Size : constant := 8;
   Port_Type_Size   : constant := 16;
   --  Sizes (in bits) for the generated deployment related types

   function Estimate_Data_Size (E : Node_Id) return Unsigned_Long_Long;
   --  Return an approximative value greater than or equal the size of
   --  the Ada data type mapped from node E.

   function Extract_Enumerator
     (E : Node_Id;
      D : Boolean := True) return Node_Id;
   --  Extracts the enumeration literal associated to node E (process,
   --  thread or port) and adds the appropriate with clause.  If E is
   --  a port instance and then D is False, return the enumeration
   --  literal declared in the Activity package.

   --  Tree binding operations

   procedure Bind_AADL_To_Marshallers (G : Node_Id; A : Node_Id);
   procedure Bind_AADL_To_Activity (G : Node_Id; A : Node_Id);
   procedure Bind_AADL_To_Types (G : Node_Id; A : Node_Id);
   procedure Bind_AADL_To_Subprograms (G : Node_Id; A : Node_Id);
   procedure Bind_AADL_To_Deployment (G : Node_Id; A : Node_Id);
   procedure Bind_AADL_To_Naming (G : Node_Id; A : Node_Id);
   procedure Bind_AADL_To_Main (G : Node_Id; A : Node_Id);
   procedure Bind_AADL_To_Job (G : Node_Id; A : Node_Id);
   procedure Bind_AADL_To_Enumerator (G : Node_Id; A : Node_Id);
   procedure Bind_AADL_To_Marshall (G : Node_Id; A : Node_Id);
   procedure Bind_AADL_To_Unmarshall (G : Node_Id; A : Node_Id);
   procedure Bind_AADL_To_Port_Interface (G : Node_Id; A : Node_Id);
   procedure Bind_AADL_To_Port_Enumeration (G : Node_Id; A : Node_Id);
   procedure Bind_AADL_To_Type_Definition (G : Node_Id; A : Node_Id);
   procedure Bind_AADL_To_Default_Value (G : Node_Id; A : Node_Id);
   procedure Bind_AADL_To_Feature_Subprogram (G : Node_Id; A : Node_Id);
   procedure Bind_AADL_To_Subprogram (G : Node_Id; A : Node_Id);
   procedure Bind_AADL_To_Transport (G : Node_Id; A : Node_Id);
   procedure Bind_AADL_To_Object (G : Node_Id; A : Node_Id);
   procedure Bind_AADL_To_Get_Value (G : Node_Id; A : Node_Id);
   procedure Bind_AADL_To_Put_Value (G : Node_Id; A : Node_Id);
   procedure Bind_AADL_To_Get_Count (G : Node_Id; A : Node_Id);
   procedure Bind_AADL_To_Next_Value (G : Node_Id; A : Node_Id);
   procedure Bind_AADL_To_Store_Received_Message (G : Node_Id; A : Node_Id);
   procedure Bind_AADL_To_Deliver (G : Node_Id; A : Node_Id);
   procedure Bind_AADL_To_Send (G : Node_Id; A : Node_Id);

end Ocarina.Backends.PO_HI_Ada.Mapping;
