with GNATCOLL.Projects; use GNATCOLL.Projects;

with Libadalang.AST; use Libadalang.AST;

--  This package provides an Unit_File_Provider implemetation that relies on a
--  project file.

package Libadalang.Unit_Files.Projects is

   type Project_Unit_File_Provider_Type is new Unit_File_Provider_Interface
      with private;
   --  Unit_File_PRovider implementation that relies on a project file

   function Create
     (Project : Project_Tree_Access)
      return Project_Unit_File_Provider_Type;
   --  Create an unit file provider using Project. The project pointed by
   --  Project must outlive the returned unit file provider.

   overriding function Get_File
     (Provider : Project_Unit_File_Provider_Type;
      Node     : Ada_Node)
      return String;

   overriding function Get_File
     (Provider : Project_Unit_File_Provider_Type;
      Name     : Text_Type)
      return String;

private

   type Project_Unit_File_Provider_Type is new Unit_File_Provider_Interface
   with record
      Project : Project_Tree_Access;
   end record;

   function Create
     (Project : Project_Tree_Access)
      return Project_Unit_File_Provider_Type
   is ((Project => Project));

end Libadalang.Unit_Files.Projects;
