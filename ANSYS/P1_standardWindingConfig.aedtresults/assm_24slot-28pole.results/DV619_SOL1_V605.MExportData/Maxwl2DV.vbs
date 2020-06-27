' ----------------------------------------------------------------------
' Script Created by RMxprt to generate Maxwell 2D Version 2016.0 design 
' Can specify one arg to setup external circuit                         
' ----------------------------------------------------------------------

On Error Resume Next
Set oAnsoftApp = CreateObject("Ansoft.ElectronicsDesktop")
On Error Goto 0
Set oDesktop = oAnsoftApp.GetAppDesktop()
Set oArgs = AnsoftScript.arguments
oDesktop.RestoreWindow
Set oProject = oDesktop.GetActiveProject()
Set oDesign = oProject.GetActiveDesign()
designName = oDesign.GetName
Set oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.SetModelUnits Array("NAME:Units Parameter", "Units:=", "mm", _
  "Rescale:=", false)
oDesign.SetSolutionType "Transient", "XY"
Set oModule = oDesign.GetModule("BoundarySetup")
if (oArgs.Count = 1) then 
oModule.EditExternalCircuit oArgs(0), Array(), Array(), Array(), Array()
end if
oEditor.SetModelValidationSettings Array("NAME:Validation Options", _
  "EntityCheckLevel:=", "Strict", "IgnoreUnclassifiedObjects:=", true)
On Error Resume Next
Set oModule = oDesign.GetModule("MeshSetup")
oModule.InitialMeshSettings Array("NAME:MeshSettings", "MeshMethod:=", _
  "AnsoftTAU")
On Error Goto 0
On Error Resume Next
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:fractions", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "2"))))
On Error Goto 0
Set oDefinitionManager = oProject.GetDefinitionManager()
oDefinitionManager.ModifyLibraries designName, Array("NAME:PersonalLib"), _
  Array("NAME:UserLib"), Array("NAME:SystemLib", "Materials:=", Array(_
  "Materials", "RMxprt"))
if (oDefinitionManager.DoesMaterialExist("AK_2DSF0.950")) then
else
oDefinitionManager.AddMaterial Array("NAME:AK_2DSF0.950", _
  "CoordinateSystemType:=", "Cartesian", Array("NAME:AttachedData"), Array(_
  "NAME:ModifierData"), Array("NAME:permeability", "property_type:=", _
  "nonlinear", "HUnit:=", "A_per_meter", "BUnit:=", "tesla", Array(_
  "NAME:BHCoordinates", Array("NAME:Coordinate", "X:=", 0, "Y:=", 0), Array(_
  "NAME:Coordinate", "X:=", 39.7885, "Y:=", 0.27801), Array("NAME:Coordinate", _
  "X:=", 41.78, "Y:=", 0.29655), Array("NAME:Coordinate", "X:=", 43.7839, _
  "Y:=", 0.315652), Array("NAME:Coordinate", "X:=", 45.8127, "Y:=", 0.335445), _
  Array("NAME:Coordinate", "X:=", 47.8788, "Y:=", 0.356073), Array(_
  "NAME:Coordinate", "X:=", 49.976, "Y:=", 0.377496), Array("NAME:Coordinate", _
  "X:=", 52.0235, "Y:=", 0.398884), Array("NAME:Coordinate", "X:=", 53.9217, _
  "Y:=", 0.419128), Array("NAME:Coordinate", "X:=", 55.5713, "Y:=", 0.437046), _
  Array("NAME:Coordinate", "X:=", 56.9141, "Y:=", 0.451857), Array(_
  "NAME:Coordinate", "X:=", 58.0581, "Y:=", 0.464631), Array(_
  "NAME:Coordinate", "X:=", 59.1522, "Y:=", 0.476985), Array(_
  "NAME:Coordinate", "X:=", 60.3459, "Y:=", 0.490615), Array(_
  "NAME:Coordinate", "X:=", 61.7551, "Y:=", 0.506911), Array(_
  "NAME:Coordinate", "X:=", 63.3632, "Y:=", 0.525775), Array(_
  "NAME:Coordinate", "X:=", 65.1205, "Y:=", 0.54672), Array("NAME:Coordinate", _
  "X:=", 66.9773, "Y:=", 0.569221), Array("NAME:Coordinate", "X:=", 68.8921, _
  "Y:=", 0.592829), Array("NAME:Coordinate", "X:=", 70.8567, "Y:=", 0.617473), _
  Array("NAME:Coordinate", "X:=", 72.871, "Y:=", 0.641255), Array(_
  "NAME:Coordinate", "X:=", 74.935, "Y:=", 0.665005), Array("NAME:Coordinate", _
  "X:=", 77.0446, "Y:=", 0.688755), Array("NAME:Coordinate", "X:=", 79.1791, _
  "Y:=", 0.712505), Array("NAME:Coordinate", "X:=", 81.3136, "Y:=", 0.736255), _
  Array("NAME:Coordinate", "X:=", 83.4232, "Y:=", 0.760005), Array(_
  "NAME:Coordinate", "X:=", 85.4997, "Y:=", 0.783755), Array(_
  "NAME:Coordinate", "X:=", 87.601, "Y:=", 0.807506), Array("NAME:Coordinate", _
  "X:=", 89.8018, "Y:=", 0.831256), Array("NAME:Coordinate", "X:=", 92.1767, _
  "Y:=", 0.855006), Array("NAME:Coordinate", "X:=", 94.7878, "Y:=", 0.878756), _
  Array("NAME:Coordinate", "X:=", 97.6476, "Y:=", 0.902506), Array(_
  "NAME:Coordinate", "X:=", 100.756, "Y:=", 0.926256), Array(_
  "NAME:Coordinate", "X:=", 104.113, "Y:=", 0.950007), Array(_
  "NAME:Coordinate", "X:=", 107.709, "Y:=", 0.973757), Array(_
  "NAME:Coordinate", "X:=", 111.491, "Y:=", 0.997507), Array(_
  "NAME:Coordinate", "X:=", 115.397, "Y:=", 1.02126), Array("NAME:Coordinate", _
  "X:=", 119.366, "Y:=", 1.04501), Array("NAME:Coordinate", "X:=", 123.396, _
  "Y:=", 1.06876), Array("NAME:Coordinate", "X:=", 127.738, "Y:=", 1.09251), _
  Array("NAME:Coordinate", "X:=", 132.701, "Y:=", 1.11626), Array(_
  "NAME:Coordinate", "X:=", 138.597, "Y:=", 1.14001), Array("NAME:Coordinate", _
  "X:=", 145.819, "Y:=", 1.16376), Array("NAME:Coordinate", "X:=", 155.092, _
  "Y:=", 1.18751), Array("NAME:Coordinate", "X:=", 167.226, "Y:=", 1.21126), _
  Array("NAME:Coordinate", "X:=", 183.027, "Y:=", 1.23501), Array(_
  "NAME:Coordinate", "X:=", 203.74, "Y:=", 1.25876), Array("NAME:Coordinate", _
  "X:=", 232.348, "Y:=", 1.28251), Array("NAME:Coordinate", "X:=", 272.271, _
  "Y:=", 1.30627), Array("NAME:Coordinate", "X:=", 326.929, "Y:=", 1.33002), _
  Array("NAME:Coordinate", "X:=", 400.175, "Y:=", 1.35378), Array(_
  "NAME:Coordinate", "X:=", 497.605, "Y:=", 1.37753), Array("NAME:Coordinate", _
  "X:=", 625.249, "Y:=", 1.40129), Array("NAME:Coordinate", "X:=", 789.139, _
  "Y:=", 1.42505), Array("NAME:Coordinate", "X:=", 995.127, "Y:=", 1.44881), _
  Array("NAME:Coordinate", "X:=", 1248.36, "Y:=", 1.47258), Array(_
  "NAME:Coordinate", "X:=", 1553.82, "Y:=", 1.49635), Array("NAME:Coordinate", _
  "X:=", 1916.48, "Y:=", 1.52012), Array("NAME:Coordinate", "X:=", 2340.16, _
  "Y:=", 1.5439), Array("NAME:Coordinate", "X:=", 2824.15, "Y:=", 1.56768), _
  Array("NAME:Coordinate", "X:=", 3366.58, "Y:=", 1.59146), Array(_
  "NAME:Coordinate", "X:=", 3965.59, "Y:=", 1.61525), Array("NAME:Coordinate", _
  "X:=", 4611.41, "Y:=", 1.63879), Array("NAME:Coordinate", "X:=", 5262.78, _
  "Y:=", 1.66086), Array("NAME:Coordinate", "X:=", 5870.49, "Y:=", 1.68), _
  Array("NAME:Coordinate", "X:=", 6385.39, "Y:=", 1.6947), Array(_
  "NAME:Coordinate", "X:=", 6803.93, "Y:=", 1.70404), Array("NAME:Coordinate", _
  "X:=", 7305.09, "Y:=", 1.7092), Array("NAME:Coordinate", "X:=", 8113.49, _
  "Y:=", 1.71188), Array("NAME:Coordinate", "X:=", 9453.75, "Y:=", 1.7138), _
  Array("NAME:Coordinate", "X:=", 11481.5, "Y:=", 1.71635), Array(_
  "NAME:Coordinate", "X:=", 14076.7, "Y:=", 1.71961), Array("NAME:Coordinate", _
  "X:=", 17050.1, "Y:=", 1.72335), Array("NAME:Coordinate", "X:=", 20212.6, _
  "Y:=", 1.72732), Array("NAME:Coordinate", "X:=", 51837.6, "Y:=", 1.76703))), _
  Array("NAME:core_loss_type", "property_type:=", "ChoiceProperty", _
  "Choice:=", "Electrical Steel"), "core_loss_kh:=", 76.1206, _
  "core_loss_kc:=", 0.675237, "core_loss_ke:=", 0, "conductivity:=", 2e+06, _
  "mass_density:=", 7267.5) 
end if
if (oDefinitionManager.DoesMaterialExist("M19_24G_2DSF0.950")) then
else
oDefinitionManager.AddMaterial Array("NAME:M19_24G_2DSF0.950", _
  "CoordinateSystemType:=", "Cartesian", Array("NAME:AttachedData"), Array(_
  "NAME:ModifierData"), Array("NAME:permeability", "property_type:=", _
  "nonlinear", "HUnit:=", "A_per_meter", "BUnit:=", "tesla", Array(_
  "NAME:BHCoordinates", Array("NAME:Coordinate", "X:=", 0, "Y:=", 0), Array(_
  "NAME:Coordinate", "X:=", 22.28, "Y:=", 0.0475014), Array("NAME:Coordinate", _
  "X:=", 25.46, "Y:=", 0.0950016), Array("NAME:Coordinate", "X:=", 31.83, _
  "Y:=", 0.142502), Array("NAME:Coordinate", "X:=", 47.74, "Y:=", 0.342003), _
  Array("NAME:Coordinate", "X:=", 63.66, "Y:=", 0.513004), Array(_
  "NAME:Coordinate", "X:=", 79.57, "Y:=", 0.617505), Array("NAME:Coordinate", _
  "X:=", 159.15, "Y:=", 0.94051), Array("NAME:Coordinate", "X:=", 318.3, _
  "Y:=", 1.14002), Array("NAME:Coordinate", "X:=", 477.46, "Y:=", 1.21603), _
  Array("NAME:Coordinate", "X:=", 636.61, "Y:=", 1.26354), Array(_
  "NAME:Coordinate", "X:=", 795.77, "Y:=", 1.29205), Array("NAME:Coordinate", _
  "X:=", 1591.5, "Y:=", 1.3681), Array("NAME:Coordinate", "X:=", 3183, "Y:=", _
  1.4442), Array("NAME:Coordinate", "X:=", 4774.6, "Y:=", 1.5013), Array(_
  "NAME:Coordinate", "X:=", 6366.1, "Y:=", 1.5489), Array("NAME:Coordinate", _
  "X:=", 7957.7, "Y:=", 1.587), Array("NAME:Coordinate", "X:=", 15915, "Y:=", _
  1.711), Array("NAME:Coordinate", "X:=", 31830, "Y:=", 1.807), Array(_
  "NAME:Coordinate", "X:=", 111407, "Y:=", 1.907), Array("NAME:Coordinate", _
  "X:=", 190984, "Y:=", 2.007), Array("NAME:Coordinate", "X:=", 350138, "Y:=", _
  2.207), Array("NAME:Coordinate", "X:=", 509292, "Y:=", 2.407), Array(_
  "NAME:Coordinate", "X:=", 2.10083e+06, "Y:=", 4.407))), Array(_
  "NAME:core_loss_type", "property_type:=", "ChoiceProperty", "Choice:=", _
  "Electrical Steel"), "core_loss_kh:=", 172.842, "core_loss_kc:=", 1.36842, _
  "core_loss_ke:=", 1.76468, "conductivity:=", 1.96e+06, "mass_density:=", _
  7267.5) 
end if
if (oDefinitionManager.DoesMaterialExist("NdFe35_2DSF1.000_X")) then
else
oDefinitionManager.AddMaterial Array("NAME:NdFe35_2DSF1.000_X", _
  "CoordinateSystemType:=", "Cartesian", Array("NAME:AttachedData"), Array(_
  "NAME:ModifierData"), "permeability:=", "1.09978", "conductivity:=", _
  "625000", "mass_density:=", "7400", Array("NAME:magnetic_coercivity", _
  "property_type:=", "VectorProperty", "Magnitude:=", "-890000A_per_meter", _
  "DirComp1:=", "1", "DirComp2:=", "0", "DirComp3:=", "0"))
end if
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "188.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", "1"), Array(_
  "NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array("NAME:Pair", _
  "Name:=", "InfoCore", "Value:=", "0"))), Array("NAME:Attributes", "Name:=", _
  "Band", "Flags:=", "", "Color:=", "(0 255 255)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "vacuum", _
  "SolveInside:=", true) 
On Error Resume Next
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "188.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", "1"), Array(_
  "NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array("NAME:Pair", _
  "Name:=", "InfoCore", "Value:=", "100"))), Array("NAME:Attributes", _
  "Name:=", "Shaft", "Flags:=", "", "Color:=", "(0 255 255)", _
  "Transparency:=", 0, "PartCoordinateSystem:=", "Global", "MaterialName:=", _
  "vacuum", "SolveInside:=", true) 
On Error Resume Next
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "188.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "270.2mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", "2"), Array(_
  "NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array("NAME:Pair", _
  "Name:=", "InfoCore", "Value:=", "100"))), Array("NAME:Attributes", _
  "Name:=", "OuterRegion", "Flags:=", "", "Color:=", "(0 255 255)", _
  "Transparency:=", 0, "PartCoordinateSystem:=", "Global", "MaterialName:=", _
  "vacuum", "SolveInside:=", true) 
On Error Resume Next
On Error Goto 0
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion:CreateUserDefinedPart:1", "Fractions", "fractions"
oEditor.Copy Array("NAME:Selections", "Selections:=", "OuterRegion")
oEditor.Paste
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion1:CreateUserDefinedPart:1", "InfoCore", "1"
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "OuterRegion1"), _
  Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "Tool"))))
oEditor.FitAll
Set oModule = oDesign.GetModule("ModelSetup")
oModule.SetSymmetryMultiplier "fractions"
Set oModule = oDesign.GetModule("BoundarySetup")
edgeID = oEditor.GetEdgeByPosition(Array("NAME:Parameters", "BodyName:=", _
  "OuterRegion", "XPosition:=", "8.2724891282403706e-15mm", "YPosition:=", _
  "135.09999999999999mm", "ZPosition:=", "0mm"))
oModule.AssignVectorPotential Array("NAME:VectorPotential1", "Edges:=", Array(edgeID), _
  "Value:=", "0", "CoordinateSystem:=", "")
edgeID = oEditor.GetEdgeByPosition(Array("NAME:Parameters", "BodyName:=", _
  "OuterRegion", "XPosition:=", "67.549999999999997mm", "YPosition:=", "0mm", _
  "ZPosition:=", "0mm"))
oModule.AssignMaster Array("NAME:Master1", "Edges:=", Array(edgeID), _
  "ReverseV:=", false)
edgeID = oEditor.GetEdgeByPosition(Array("NAME:Parameters", "BodyName:=", _
  "OuterRegion", "XPosition:=", "-67.549999999999997mm", "YPosition:=", _
  "8.2724891282403706e-15mm", "ZPosition:=", "0mm"))
oModule.AssignSlave Array("NAME:Slave1", "Edges:=", Array(edgeID), _
  "ReverseU:=", true, "Master:=", "Master1", "SameAsMaster:=", true)
oDesign.SetDesignSettings Array("NAME:Design Settings Data", "ModelDepth:=", _
  "43.4mm")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "189.3mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "270.2mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs01", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "2mm"), Array("NAME:Pair", _
  "Name:=", "Hs2", "Value:=", "20mm"), Array("NAME:Pair", "Name:=", "Bs0", _
  "Value:=", "5mm"), Array("NAME:Pair", "Name:=", "Bs1", "Value:=", _
  "13.45934376927683mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", _
  "18.72544367277267mm"), Array("NAME:Pair", "Name:=", "Rs", "Value:=", "5mm"), _
  Array("NAME:Pair", "Name:=", "FilletType", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "HalfSlot", "Value:=", "0"), Array("NAME:Pair", _
  "Name:=", "SegAngle", "Value:=", "15deg"), Array("NAME:Pair", "Name:=", _
  "LenRegion", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "InfoCore", _
  "Value:=", "0"))), Array("NAME:Attributes", "Name:=", "Stator", "Flags:=", _
  "", "Color:=", "(132 132 193)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "AK_2DSF0.950", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Stator:CreateUserDefinedPart:1", _
  "LenRegion", "43.4mm + 2*endRegion"
On Error Goto 0
On Error Resume Next
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:delta", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", _
  "114deg"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:conds", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", _
  "29"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:R1", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", _
  "0.015800415263177627ohm"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:Le1", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", _
  "2.0243341143590508e-05H"))))
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "189.3mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "270.2mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "2mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "20mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "13.45934376927683mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "18.72544367277267mm"), Array("NAME:Pair", "Name:=", "Rs", _
  "Value:=", "5mm"), Array("NAME:Pair", "Name:=", "FilletType", "Value:=", _
  "0"), Array("NAME:Pair", "Name:=", "Layers", "Value:=", "1"), Array(_
  "NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), Array("NAME:Pair", _
  "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "SpanExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "0mm"), Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", "2"))), Array(_
  "NAME:Attributes", "Name:=", "Coil", "Flags:=", "", "Color:=", _
  "(250 167 14)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "copper", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil:CreateUserDefinedPart:1", _
  "LenRegion", "43.4mm + 2*endRegion"
On Error Goto 0
oEditor.DuplicateAroundAxis Array("NAME:Selections", "Selections:=", "Coil"), _
  Array("NAME:DuplicateAroundAxisParameters", "CoordinateSystemID:=", -1, _
  "CreateNewObjects:=", true, "WhichAxis:=", "Z", "AngleStr:=", "15deg", _
  "NumClones:=", "24"), Array("NAME:Options", "DuplicateBoundaries:=", false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Coil"), Array(_
  "NAME:ChangedProps", Array("NAME:Name", "Value:=", "Coil_0"))))
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_0,Coil_12"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_1,Coil_13"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_2,Coil_14"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_3,Coil_15"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_4,Coil_16"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_5,Coil_17"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_6,Coil_18"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_7,Coil_19"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_8,Coil_20"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_9,Coil_21"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_10,Coil_22"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_11,Coil_23"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseA", "Type:=", "Voltage", _
  "IsSolid:=", false, "Current:=", "0A", "Voltage:=", _
  "1959.59*sin(2*pi*630*time+delta)", "Resistance:=", "R1", "Inductance:=", _
  "Le1", "ParallelBranchesNum:=", "1")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseB", "Type:=", "Voltage", _
  "IsSolid:=", false, "Current:=", "0A", "Voltage:=", _
  "1959.59*sin(2*pi*630*time+delta-2*pi/3)", "Resistance:=", "R1", _
  "Inductance:=", "Le1", "ParallelBranchesNum:=", "1")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseC", "Type:=", "Voltage", _
  "IsSolid:=", false, "Current:=", "0A", "Voltage:=", _
  "1959.59*sin(2*pi*630*time+delta-4*pi/3)", "Resistance:=", "R1", _
  "Inductance:=", "Le1", "ParallelBranchesNum:=", "1")
oModule.AssignCoil Array("NAME:PhA_0", "Objects:=", Array("Coil_0"), _
  "Conductor number:=", "conds", "PolarityType:=", "Positive", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhARe_0", "Objects:=", Array("Coil_1"), _
  "Conductor number:=", "conds", "PolarityType:=", "Negative", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhCRe_1", "Objects:=", Array("Coil_2"), _
  "Conductor number:=", "conds", "PolarityType:=", "Negative", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhC_1", "Objects:=", Array("Coil_3"), _
  "Conductor number:=", "conds", "PolarityType:=", "Positive", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhB_2", "Objects:=", Array("Coil_4"), _
  "Conductor number:=", "conds", "PolarityType:=", "Positive", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhBRe_2", "Objects:=", Array("Coil_5"), _
  "Conductor number:=", "conds", "PolarityType:=", "Negative", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhARe_3", "Objects:=", Array("Coil_6"), _
  "Conductor number:=", "conds", "PolarityType:=", "Negative", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhA_3", "Objects:=", Array("Coil_7"), _
  "Conductor number:=", "conds", "PolarityType:=", "Positive", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhC_4", "Objects:=", Array("Coil_8"), _
  "Conductor number:=", "conds", "PolarityType:=", "Positive", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhCRe_4", "Objects:=", Array("Coil_9"), _
  "Conductor number:=", "conds", "PolarityType:=", "Negative", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhBRe_5", "Objects:=", Array("Coil_10"), _
  "Conductor number:=", "conds", "PolarityType:=", "Negative", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhB_5", "Objects:=", Array("Coil_11"), _
  "Conductor number:=", "conds", "PolarityType:=", "Positive", "Winding:=", _
  "PhaseB")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/IPMCore", "Version:=", "19.0", "NoOfParameters:=", 16, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "188.1mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Poles", "Value:=", "28"), _
  Array("NAME:Pair", "Name:=", "PoleType", "Value:=", "2"), Array("NAME:Pair", _
  "Name:=", "D1", "Value:=", "186.1mm"), Array("NAME:Pair", "Name:=", "O1", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "O2", "Value:=", _
  "32.675408056257mm"), Array("NAME:Pair", "Name:=", "B1", "Value:=", "10mm"), _
  Array("NAME:Pair", "Name:=", "Rib", "Value:=", "2mm"), Array("NAME:Pair", _
  "Name:=", "HRib", "Value:=", "9.958756297575817mm"), Array("NAME:Pair", _
  "Name:=", "DminMag", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "ThickMag", "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "WidthMag", _
  "Value:=", "15mm"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "0mm"), Array("NAME:Pair", "Name:=", "InfoCore", "Value:=", "0"))), Array(_
  "NAME:Attributes", "Name:=", "Rotor", "Flags:=", "", "Color:=", _
  "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "M19_24G_2DSF0.950", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Rotor:CreateUserDefinedPart:1", _
  "LenRegion", "43.4mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Rotor"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "6.4285714285714288deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/IPMCore", "Version:=", "19.0", "NoOfParameters:=", 16, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "188.1mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Poles", "Value:=", "28"), _
  Array("NAME:Pair", "Name:=", "PoleType", "Value:=", "2"), Array("NAME:Pair", _
  "Name:=", "D1", "Value:=", "186.1mm"), Array("NAME:Pair", "Name:=", "O1", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "O2", "Value:=", _
  "32.675408056257mm"), Array("NAME:Pair", "Name:=", "B1", "Value:=", "10mm"), _
  Array("NAME:Pair", "Name:=", "Rib", "Value:=", "2mm"), Array("NAME:Pair", _
  "Name:=", "HRib", "Value:=", "9.958756297575817mm"), Array("NAME:Pair", _
  "Name:=", "DminMag", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "ThickMag", "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "WidthMag", _
  "Value:=", "15mm"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "0mm"), Array("NAME:Pair", "Name:=", "InfoCore", "Value:=", "3"))), Array(_
  "NAME:Attributes", "Name:=", "Mag", "Flags:=", "", "Color:=", "(0 255 128)", _
  "Transparency:=", 0, "PartCoordinateSystem:=", "Global", "MaterialName:=", _
  "NdFe35_2DSF1.000_X", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Mag:CreateUserDefinedPart:1", _
  "LenRegion", "43.4mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Mag"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "6.4285714285714288deg")
oEditor.DuplicateAroundAxis Array("NAME:Selections", "Selections:=", "Mag"), _
  Array("NAME:DuplicateAroundAxisParameters", "CoordinateSystemID:=", -1, _
  "CreateNewObjects:=", true, "WhichAxis:=", "Z", "AngleStr:=", _
  "12.857142857142858deg", "NumClones:=", "28"), Array("NAME:Options", _
  "DuplicateBoundaries:=", false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag"), Array(_
  "NAME:ChangedProps", Array("NAME:Name", "Value:=", "Mag_0"))))
oEditor.Unite Array("NAME:Selections", "Selections:=", "Mag_0,Mag_14"), Array(_
  "NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.993712", "XAxisYvec:=", "0.111964", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.111964", "YAxisYvec:=", "0.993712", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_0")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_0"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_0"))))
oEditor.Unite Array("NAME:Selections", "Selections:=", "Mag_1,Mag_15"), Array(_
  "NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_1"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "NdFe35_2DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.943883", "XAxisYvec:=", "-0.330279", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.330279", "YAxisYvec:=", "-0.943883", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_1")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_1"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_1"))))
oEditor.Unite Array("NAME:Selections", "Selections:=", "Mag_2,Mag_16"), Array(_
  "NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.846724", "XAxisYvec:=", "0.532032", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.532032", "YAxisYvec:=", "0.846724", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_2")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_2"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_2"))))
oEditor.Unite Array("NAME:Selections", "Selections:=", "Mag_3,Mag_17"), Array(_
  "NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_3"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "NdFe35_2DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.707107", "XAxisYvec:=", "-0.707107", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.707107", "YAxisYvec:=", "-0.707107", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_3")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_3"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_3"))))
oEditor.Unite Array("NAME:Selections", "Selections:=", "Mag_4,Mag_18"), Array(_
  "NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.532032", "XAxisYvec:=", "0.846724", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.846724", "YAxisYvec:=", "0.532032", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_4")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_4"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_4"))))
oEditor.Unite Array("NAME:Selections", "Selections:=", "Mag_5,Mag_19"), Array(_
  "NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_5"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "NdFe35_2DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.330279", "XAxisYvec:=", "-0.943883", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.943883", "YAxisYvec:=", "-0.330279", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_5")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_5"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_5"))))
oEditor.Unite Array("NAME:Selections", "Selections:=", "Mag_6,Mag_20"), Array(_
  "NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.111964", "XAxisYvec:=", "0.993712", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.993712", "YAxisYvec:=", "0.111964", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_6")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_6"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_6"))))
oEditor.Unite Array("NAME:Selections", "Selections:=", "Mag_7,Mag_21"), Array(_
  "NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_7"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "NdFe35_2DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.111964", "XAxisYvec:=", "-0.993712", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.993712", "YAxisYvec:=", "0.111964", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_7")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_7"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_7"))))
oEditor.Unite Array("NAME:Selections", "Selections:=", "Mag_8,Mag_22"), Array(_
  "NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.330279", "XAxisYvec:=", "0.943883", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.943883", "YAxisYvec:=", "-0.330279", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_8")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_8"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_8"))))
oEditor.Unite Array("NAME:Selections", "Selections:=", "Mag_9,Mag_23"), Array(_
  "NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_9"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "NdFe35_2DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.532032", "XAxisYvec:=", "-0.846724", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.846724", "YAxisYvec:=", "0.532032", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_9")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_9"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_9"))))
oEditor.Unite Array("NAME:Selections", "Selections:=", "Mag_10,Mag_24"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.707107", "XAxisYvec:=", "0.707107", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.707107", "YAxisYvec:=", "-0.707107", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_10")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_10"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_10"))))
oEditor.Unite Array("NAME:Selections", "Selections:=", "Mag_11,Mag_25"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_11"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "NdFe35_2DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.846724", "XAxisYvec:=", "-0.532032", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.532032", "YAxisYvec:=", "0.846724", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_11")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_11"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_11"))))
oEditor.Unite Array("NAME:Selections", "Selections:=", "Mag_12,Mag_26"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.943883", "XAxisYvec:=", "0.330279", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.330279", "YAxisYvec:=", "-0.943883", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_12")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_12"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_12"))))
oEditor.Unite Array("NAME:Selections", "Selections:=", "Mag_13,Mag_27"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_13"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "NdFe35_2DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.993712", "XAxisYvec:=", "-0.111964", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.111964", "YAxisYvec:=", "0.993712", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_13")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_13"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_13"))))
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignTrueSurfOp Array("NAME:SurfApprox_Mag", "Objects:=", Array(_
  "Mag_0", "Mag_1", "Mag_2", "Mag_3", "Mag_4", "Mag_5", "Mag_6", "Mag_7", _
  "Mag_8", "Mag_9", "Mag_10", "Mag_11", "Mag_12", "Mag_13"), _
  "SurfDevChoice:=", 2, "SurfDev:=", "0.09405mm", "NormalDevChoice:=", 2, _
  "NormalDev:=", "15deg", "AspectRatioChoice:=", 1)
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/IPMCore", "Version:=", "19.0", "NoOfParameters:=", 16, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "188.1mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Poles", "Value:=", "28"), _
  Array("NAME:Pair", "Name:=", "PoleType", "Value:=", "2"), Array("NAME:Pair", _
  "Name:=", "D1", "Value:=", "186.1mm"), Array("NAME:Pair", "Name:=", "O1", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "O2", "Value:=", _
  "32.675408056257mm"), Array("NAME:Pair", "Name:=", "B1", "Value:=", "10mm"), _
  Array("NAME:Pair", "Name:=", "Rib", "Value:=", "2mm"), Array("NAME:Pair", _
  "Name:=", "HRib", "Value:=", "9.958756297575817mm"), Array("NAME:Pair", _
  "Name:=", "DminMag", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "ThickMag", "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "WidthMag", _
  "Value:=", "15mm"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "0mm"), Array("NAME:Pair", "Name:=", "InfoCore", "Value:=", "100"))), _
  Array("NAME:Attributes", "Name:=", "InnerRegion", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "InnerRegion:CreateUserDefinedPart:1", "LenRegion", "43.4mm + 2*endRegion"
On Error Goto 0
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignTrueSurfOp Array("NAME:SurfApprox_Main", "Objects:=", Array(_
  "Stator", "Rotor", "Band", "OuterRegion", "InnerRegion", "Shaft"), _
  "SurfDevChoice:=", 2, "SurfDev:=", "0.1351mm", "NormalDevChoice:=", 2, _
  "NormalDev:=", "15deg", "AspectRatioChoice:=", 1)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Band", _
  "OuterRegion", "InnerRegion"), Array("NAME:ChangedProps", Array(_
  "NAME:Transparent", "Value:=", 0.75))))
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "Band,InnerRegion" & _
  ",Shaft,Stator,Coil_0,Coil_1,Coil_2,Coil_3,Coil_4,Coil_5,Coil_6,Coil_7" & _
  ",Coil_8,Coil_9,Coil_10,Coil_11,Rotor,Mag_0,Mag_1,Mag_2,Mag_3,Mag_4" & _
  ",Mag_5,Mag_6,Mag_7,Mag_8,Mag_9,Mag_10,Mag_11,Mag_12,Mag_13", _
  "Tool Parts:=", "Tool"), Array("NAME:SubtractParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", false)
oEditor.FitAll
Set oModule = oDesign.GetModule("ModelSetup")
oModule.AssignBand Array("NAME:MotionSetup1", "Move Type:=", "Rotate", _
  "Coordinate System:=", "Global", "Axis:=", "Z", "Is Positive:=", true, _
  "InitPos:=", "8.57143deg", "HasRotateLimit:=", false, "NonCylindrical:=", _
  false, "Consider Mechanical Transient:=", true, "Angular Velocity:=", _
  "2700rpm", "Moment of Inertia:=", 0.0416044, "Damping:=", 0.00109974, _
  "Load Torque:=", _
  "if(speed<282.743, -0.506115*speed, -40460.8/speed) - 0.506115*(speed-282.743)*10", _
  "Objects:=", Array("Band"))
oModule.EditMotionSetup "MotionSetup1", Array("NAME:Data", _
  "Consider Mechanical Transient:=", false)
Set oModule = oDesign.GetModule("AnalysisSetup")
oModule.InsertSetup "Transient", Array("NAME:Setup1", "FastReachSteadyState:=", _
  true, "AutoDetectSteadyState:=", true, "FrequencyOfAddedVoltageSource:=", _
  "630Hz", "StopTime:=", "0.02s", "TimeStep:=", "2e-05s")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.SetMinimumTimeStep "0.0002ms" 
Set oModule = oDesign.GetModule("ReportSetup")
oModule.CreateReport "Torque", "Transient", "XY Plot", "Setup1 : Transient", _
  Array(), Array("Time:=", Array("All")), Array("X Component:=", "Time", _
  "Y Component:=", Array("Moving1.Torque")), Array()
oModule.CreateReport "Currents", "Transient", "XY Plot", "Setup1 : Transient", _
  Array(), Array("Time:=", Array("All")), Array("X Component:=", "Time", _
  "Y Component:=", Array("Current(PhaseA)", "Current(PhaseB)", _
  "Current(PhaseC)")), Array()
oModule.CreateReport "Induced Voltages", "Transient", "XY Plot", _
  "Setup1 : Transient", Array(), Array("Time:=", Array("All")), Array(_
  "X Component:=", "Time", "Y Component:=", Array("InducedVoltage(PhaseA)", _
  "InducedVoltage(PhaseB)", "InducedVoltage(PhaseC)")), Array()
oModule.CreateReport "Flux Linkages", "Transient", "XY Plot", _
  "Setup1 : Transient", Array(), Array("Time:=", Array("All")), Array(_
  "X Component:=", "Time", "Y Component:=", Array("FluxLinkage(PhaseA)", _
  "FluxLinkage(PhaseB)", "FluxLinkage(PhaseC)")), Array()
oModule.CreateReport "Voltages", "Transient", "XY Plot", "Setup1 : Transient", _
  Array(), Array("Time:=", Array("All")), Array("X Component:=", "Time", _
  "Y Component:=", Array("InputVoltage(PhaseA)", "InputVoltage(PhaseB)", _
  "InputVoltage(PhaseC)")), Array()
oModule.CreateReport "Powers", "Transient", "XY Plot", "Setup1 : Transient", _
  Array(), Array("Time:=", Array("All")), Array("X Component:=", "Time", _
  "Y Component:=", Array(_
  "InputVoltage(PhaseA)*Current(PhaseA) + InputVoltage(PhaseB)*Current(PhaseB) + InputVoltage(PhaseC)*Current(PhaseC)", _
  "Moving1.Speed*Moving1.Torque")), Array()
oModule.ChangeProperty Array("NAME:AllTabs", Array("NAME:Trace", Array(_
  "NAME:PropServers", _
  "Powers:InputVoltage(PhaseA)*Current(PhaseA) + InputVoltage(PhaseB)*Current(PhaseB) + InputVoltage(PhaseC)*Current(PhaseC)"), _
  Array("NAME:ChangedProps", Array("NAME:Specify Name", "Value:=", true))))
oModule.ChangeProperty Array("NAME:AllTabs", Array("NAME:Trace", Array(_
  "NAME:PropServers", _
  "Powers:InputVoltage(PhaseA)*Current(PhaseA) + InputVoltage(PhaseB)*Current(PhaseB) + InputVoltage(PhaseC)*Current(PhaseC)"), _
  Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "ElecPower"))))
oModule.ChangeProperty Array("NAME:AllTabs", Array("NAME:Trace", Array(_
  "NAME:PropServers", "Powers:Moving1.Speed*Moving1.Torque"), Array(_
  "NAME:ChangedProps", Array("NAME:Specify Name", "Value:=", true))))
oModule.ChangeProperty Array("NAME:AllTabs", Array("NAME:Trace", Array(_
  "NAME:PropServers", "Powers:Moving1.Speed*Moving1.Torque"), Array(_
  "NAME:ChangedProps", Array("NAME:Name", "Value:=", "MechPower"))))
oModule.AddTraceCharacteristics "Torque", "avg", Array(), Array("Specified", _
  "0.002s", "0.004s")
oModule.AddTraceCharacteristics "Currents", "rms", Array(), Array("Specified", _
  "0.002s", "0.004s")
oModule.AddTraceCharacteristics "Currents", "avg", Array(), Array("Specified", _
  "0.002s", "0.004s")
oModule.AddTraceCharacteristics "Voltages", "rms", Array(), Array("Specified", _
  "0.002s", "0.004s")
oModule.AddTraceCharacteristics "Induced Voltages", "rms", Array(), Array(_
  "Specified", "0.002s", "0.004s")
oModule.AddTraceCharacteristics "Powers", "avg", Array(), Array("Specified", _
  "0.002s", "0.004s")
oEditor.ShowWindow
Set oModule = oDesign.GetModule("OutputVariable")
oModule.CreateOutputVariable "pos", _
  "(Moving1.Position -8.57143 * PI/180) * 14 + PI", "Setup1 : Transient", _
  "Transient", Array() 
oModule.CreateOutputVariable "cos0", "cos(pos)", "Setup1 : Transient", _
  "Transient", Array() 
oModule.CreateOutputVariable "cos1", "cos(pos-2*PI/3)", "Setup1 : Transient", _
  "Transient", Array() 
oModule.CreateOutputVariable "cos2", "cos(pos-4*PI/3)", "Setup1 : Transient", _
  "Transient", Array() 
oModule.CreateOutputVariable "sin0", "sin(pos)", "Setup1 : Transient", _
  "Transient", Array() 
oModule.CreateOutputVariable "sin1", "sin(pos-2*PI/3)", "Setup1 : Transient", _
  "Transient", Array() 
oModule.CreateOutputVariable "sin2", "sin(pos-4*PI/3)", "Setup1 : Transient", _
  "Transient", Array() 
oModule.CreateOutputVariable "Lad", _
  "L(PhaseA,PhaseA)*cos0 + L(PhaseA,PhaseB)*cos1 + L(PhaseA,PhaseC)*cos2", _
  "Setup1 : Transient", "Transient", Array() 
oModule.CreateOutputVariable "Laq", _
  "L(PhaseA,PhaseA)*sin0 + L(PhaseA,PhaseB)*sin1 + L(PhaseA,PhaseC)*sin2", _
  "Setup1 : Transient", "Transient", Array() 
oModule.CreateOutputVariable "Lbd", _
  "L(PhaseB,PhaseA)*cos0 + L(PhaseB,PhaseB)*cos1 + L(PhaseB,PhaseC)*cos2", _
  "Setup1 : Transient", "Transient", Array() 
oModule.CreateOutputVariable "Lbq", _
  "L(PhaseB,PhaseA)*sin0 + L(PhaseB,PhaseB)*sin1 + L(PhaseB,PhaseC)*sin2", _
  "Setup1 : Transient", "Transient", Array() 
oModule.CreateOutputVariable "Lcd", _
  "L(PhaseC,PhaseA)*cos0 + L(PhaseC,PhaseB)*cos1 + L(PhaseC,PhaseC)*cos2", _
  "Setup1 : Transient", "Transient", Array() 
oModule.CreateOutputVariable "Lcq", _
  "L(PhaseC,PhaseA)*sin0 + L(PhaseC,PhaseB)*sin1 + L(PhaseC,PhaseC)*sin2", _
  "Setup1 : Transient", "Transient", Array() 
oModule.CreateOutputVariable "L_d", "(Lad*cos0 + Lbd*cos1 + Lcd*cos2) * 2/3", _
  "Setup1 : Transient", "Transient", Array() 
oModule.CreateOutputVariable "L_q", "(Laq*sin0 + Lbq*sin1 + Lcq*sin2) * 2/3", _
  "Setup1 : Transient", "Transient", Array() 
oModule.CreateOutputVariable "Flux_d", _
  "(FluxLinkage(PhaseA)*cos0+FluxLinkage(PhaseB)*cos1+FluxLinkage(PhaseC)*cos2)*2/3", _
  "Setup1 : Transient", "Transient", Array() 
oModule.CreateOutputVariable "Flux_q", _
  "(FluxLinkage(PhaseA)*sin0+FluxLinkage(PhaseB)*sin1+FluxLinkage(PhaseC)*sin2)*2/3", _
  "Setup1 : Transient", "Transient", Array() 
oModule.CreateOutputVariable "I_d", _
  "(Current(PhaseA)*cos0 + Current(PhaseB)*cos1 + Current(PhaseC)*cos2)*2/3", _
  "Setup1 : Transient", "Transient", Array() 
oModule.CreateOutputVariable "I_q", _
  "(Current(PhaseA)*sin0 + Current(PhaseB)*sin1 + Current(PhaseC)*sin2)*2/3", _
  "Setup1 : Transient", "Transient", Array() 
oModule.CreateOutputVariable "Irms", "sqrt(I_d^2+I_q^2)/sqrt(2)", _
  "Setup1 : Transient", "Transient", Array() 
oModule.CreateOutputVariable "Pcu", "3*Irms^2*R1", "Setup1 : Transient", _
  "Transient", Array() 
Set oModule = oDesign.GetModule("ReportSetup")
oModule.CreateReport "L_dq", "Transient", "XY Plot", "Setup1 : Transient", _
  Array(), Array("Time:=", Array("All")), Array("X Component:=", "Time", _
  "Y Component:=", Array("L_d", "L_q")), Array()
oModule.CreateReport "Flux_dq", "Transient", "XY Plot", "Setup1 : Transient", _
  Array(), Array("Time:=", Array("All")), Array("X Component:=", "Time", _
  "Y Component:=", Array("Flux_d", "Flux_q")), Array()
oModule.CreateReport "I_dq", "Transient", "XY Plot", "Setup1 : Transient", _
  Array(), Array("Time:=", Array("All")), Array("X Component:=", "Time", _
  "Y Component:=", Array("I_d", "I_q")), Array()
oDesign.SetDesignSettings Array("NAME:Design Settings Data", _
  "ComputeTransientInductance:=", true, "ComputeIncrementalMatrix:=", false)
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.SetupYConnection Array(Array("NAME:YConnection", "Windings:=", _
  "PhaseA,PhaseB,PhaseC"))
