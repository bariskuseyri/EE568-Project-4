' ----------------------------------------------------------------------
' Script Created by RMxprt to generate Maxwell 3D Version 2016.0 design 
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
oDesign.SetSolutionType "Transient"
Set oModule = oDesign.GetModule("BoundarySetup")
if (oArgs.Count = 1) then 
oModule.EditExternalCircuit oArgs(0), Array(), Array(), Array(), Array()
end if
oEditor.SetModelValidationSettings Array("NAME:Validation Options", _
  "EntityCheckLevel:=", "Strict", "IgnoreUnclassifiedObjects:=", true)
oDesign.SetDesignSettings Array("NAME:Design Settings Data", _
  "InsulatorThreshold:=", 2.5e+06)
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
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:halfAxial", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "0"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:endRegion", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "23.962118551151626mm"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:statorSkew", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "0"))))
On Error Goto 0
Set oDefinitionManager = oProject.GetDefinitionManager()
oDefinitionManager.ModifyLibraries designName, Array("NAME:PersonalLib"), _
  Array("NAME:UserLib"), Array("NAME:SystemLib", "Materials:=", Array(_
  "Materials", "RMxprt"))
if (oDefinitionManager.DoesMaterialExist("AK_3DSF0.950")) then
else
oDefinitionManager.AddMaterial Array("NAME:AK_3DSF0.950", _
  "CoordinateSystemType:=", "Cartesian", Array("NAME:AttachedData"), Array(_
  "NAME:ModifierData"), Array("NAME:permeability", "property_type:=", _
  "nonlinear", "HUnit:=", "A_per_meter", "BUnit:=", "tesla", Array(_
  "NAME:BHCoordinates", Array("NAME:Coordinate", "X:=", 0, "Y:=", 0), Array(_
  "NAME:Coordinate", "X:=", 15.9356, "Y:=", 0.1), Array("NAME:Coordinate", _
  "X:=", 31.8712, "Y:=", 0.2), Array("NAME:Coordinate", "X:=", 38.6004, "Y:=", _
  0.3), Array("NAME:Coordinate", "X:=", 44.8737, "Y:=", 0.4), Array(_
  "NAME:Coordinate", "X:=", 51.4369, "Y:=", 0.5), Array("NAME:Coordinate", _
  "X:=", 58.7526, "Y:=", 0.6), Array("NAME:Coordinate", "X:=", 67.2449, "Y:=", _
  0.7), Array("NAME:Coordinate", "X:=", 77.4196, "Y:=", 0.8), Array(_
  "NAME:Coordinate", "X:=", 89.9991, "Y:=", 0.9), Array("NAME:Coordinate", _
  "X:=", 106.201, "Y:=", 1), Array("NAME:Coordinate", "X:=", 128.547, "Y:=", _
  1.1), Array("NAME:Coordinate", "X:=", 163.753, "Y:=", 1.2), Array(_
  "NAME:Coordinate", "X:=", 234.832, "Y:=", 1.3), Array("NAME:Coordinate", _
  "X:=", 435.253, "Y:=", 1.4), Array("NAME:Coordinate", "X:=", 1108.32, "Y:=", _
  1.5), Array("NAME:Coordinate", "X:=", 2801.2, "Y:=", 1.6), Array(_
  "NAME:Coordinate", "X:=", 5591.07, "Y:=", 1.7), Array("NAME:Coordinate", _
  "X:=", 9708.76, "Y:=", 1.8), Array("NAME:Coordinate", "X:=", 16041.4, "Y:=", _
  1.9), Array("NAME:Coordinate", "X:=", 31313.3, "Y:=", 2), Array(_
  "NAME:Coordinate", "X:=", 88477, "Y:=", 2.1), Array("NAME:Coordinate", _
  "X:=", 159968, "Y:=", 2.2), Array("NAME:Coordinate", "X:=", 874878, "Y:=", _
  3.2))), Array("NAME:core_loss_type", "property_type:=", "ChoiceProperty", _
  "Choice:=", "Electrical Steel"), "core_loss_kh:=", 72.3146, _
  "core_loss_kc:=", 0.641475, "core_loss_ke:=", 0, "conductivity:=", 2e+06, _
  "mass_density:=", 7650, Array("NAME:stacking_type", "property_type:=", _
  "ChoiceProperty", "Choice:=", "Lamination"), "stacking_factor:=", "0.95", _
  Array("NAME:stacking_direction", "property_type:=", "ChoiceProperty", _
  "Choice:=", "V(3)"))
end if
if (oDefinitionManager.DoesMaterialExist("Arnold_Magnetics_N50H_60C_3DSF1.000_X")) then
else
oDefinitionManager.AddMaterial Array(_
  "NAME:Arnold_Magnetics_N50H_60C_3DSF1.000_X", "CoordinateSystemType:=", _
  "Cartesian", Array("NAME:AttachedData"), Array("NAME:ModifierData"), _
  "permeability:=", "1", "conductivity:=", "555556", "mass_density:=", "7500", _
  Array("NAME:magnetic_coercivity", "property_type:=", "VectorProperty", _
  "Magnitude:=", "-1.00794e+06A_per_meter", "DirComp1:=", "1", "DirComp2:=", _
  "0", "DirComp3:=", "0"))
end if
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.05mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "0deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", _
  "1"), Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "0"))), Array(_
  "NAME:Attributes", "Name:=", "Band", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Band:CreateUserDefinedPart:1", _
  "Length", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.05mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "0deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", _
  "1"), Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "100"))), Array(_
  "NAME:Attributes", "Name:=", "Shaft", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Shaft:CreateUserDefinedPart:1", _
  "Length", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.05mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "424.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "0deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", _
  "2"), Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "100"))), Array(_
  "NAME:Attributes", "Name:=", "OuterRegion", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion:CreateUserDefinedPart:1", "Length", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion:CreateUserDefinedPart:1", "Fractions", "fractions"
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion:CreateUserDefinedPart:1", "HalfAxial", "halfAxial"
On Error Goto 0
oEditor.Copy Array("NAME:Selections", "Selections:=", "OuterRegion")
oEditor.Paste
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion1:CreateUserDefinedPart:1", "InfoCore", "2"
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "OuterRegion1"), _
  Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "MasterSheet"))))
oEditor.Copy Array("NAME:Selections", "Selections:=", "MasterSheet")
oEditor.Paste
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "MasterSheet1:CreateUserDefinedPart:1", "InfoCore", "3"
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "MasterSheet1"), _
  Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "SlaveSheet"))))
oEditor.Copy Array("NAME:Selections", "Selections:=", "OuterRegion")
oEditor.Paste
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion1:CreateUserDefinedPart:1", "InfoCore", "1"
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "OuterRegion1"), _
  Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "Tool"))))
oEditor.FitAll
Set oModule = oDesign.GetModule("ModelSetup")
oModule.SetSymmetryMultiplier "fractions*(1+halfAxial)"
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignMaster Array("NAME:Master", "Objects:=", Array("MasterSheet"), _
  Array("NAME:CoordSysVector", "Origin:=", Array("0mm", "0mm", "0mm"), _
  "UPos:=", Array("212.25mm", "0mm", "0mm")), "ReverseV:=", true)
oModule.AssignSlave Array("NAME:Slave", "Objects:=", Array("SlaveSheet"), _
  Array("NAME:CoordSysVector", "Origin:=", Array("0mm", "0mm", "0mm"), _
  "UPos:=", Array("-212.25mm", "2.5993128311902573e-14mm", "0mm")), _
  "ReverseV:=", true, "Master:=", "Master", "RelationIsSame:=", false)
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "424.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs01", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "2mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "48mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "15.9mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "19.1030710912257mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "31.7417108596157mm"), Array("NAME:Pair", "Name:=", "Rs", _
  "Value:=", "5mm"), Array("NAME:Pair", "Name:=", "FilletType", "Value:=", _
  "0"), Array("NAME:Pair", "Name:=", "HalfSlot", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "30deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "90.12423710230325mm"), Array("NAME:Pair", _
  "Name:=", "InfoCore", "Value:=", "0"))), Array("NAME:Attributes", "Name:=", _
  "Stator", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "AK_3DSF0.950", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Stator:CreateUserDefinedPart:1", _
  "Skew", "statorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", "Stator:CreateUserDefinedPart:1", _
  "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
On Error Resume Next
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:delta", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", _
  "105deg"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:conds", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", _
  "29"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:R1", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", _
  "0.017879313991095245ohm"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:Le1", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", _
  "1.7257433587135472e-05H"))))
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "424.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "48mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15.9mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "19.1030710912257mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "31.7417108596157mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "1"))), Array("NAME:Attributes", "Name:=", "Coil_0", "Flags:=", _
  "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_0:CreateUserDefinedPart:1", _
  "Skew", "statorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_0:CreateUserDefinedPart:1", _
  "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "424.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "48mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15.9mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "19.1030710912257mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "31.7417108596157mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "1"))), Array("NAME:Attributes", "Name:=", "Coil_1", "Flags:=", _
  "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_1:CreateUserDefinedPart:1", _
  "Skew", "statorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_1:CreateUserDefinedPart:1", _
  "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_1"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "30deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "424.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "48mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15.9mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "19.1030710912257mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "31.7417108596157mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "1"))), Array("NAME:Attributes", "Name:=", "Coil_2", "Flags:=", _
  "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_2:CreateUserDefinedPart:1", _
  "Skew", "statorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_2:CreateUserDefinedPart:1", _
  "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_2"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "60deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "424.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "48mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15.9mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "19.1030710912257mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "31.7417108596157mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "1"))), Array("NAME:Attributes", "Name:=", "Coil_3", "Flags:=", _
  "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_3:CreateUserDefinedPart:1", _
  "Skew", "statorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_3:CreateUserDefinedPart:1", _
  "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_3"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "90deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "424.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "48mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15.9mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "19.1030710912257mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "31.7417108596157mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "1"))), Array("NAME:Attributes", "Name:=", "Coil_4", "Flags:=", _
  "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_4:CreateUserDefinedPart:1", _
  "Skew", "statorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_4:CreateUserDefinedPart:1", _
  "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_4"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "120deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "424.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "48mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15.9mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "19.1030710912257mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "31.7417108596157mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "1"))), Array("NAME:Attributes", "Name:=", "Coil_5", "Flags:=", _
  "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_5:CreateUserDefinedPart:1", _
  "Skew", "statorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_5:CreateUserDefinedPart:1", _
  "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_5"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "150deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "424.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "48mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15.9mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "19.1030710912257mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "31.7417108596157mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "1"))), Array("NAME:Attributes", "Name:=", "Coil_6", "Flags:=", _
  "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_6:CreateUserDefinedPart:1", _
  "Skew", "statorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_6:CreateUserDefinedPart:1", _
  "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_6"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "180deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "424.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "48mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15.9mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "19.1030710912257mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "31.7417108596157mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "1"))), Array("NAME:Attributes", "Name:=", "Coil_7", "Flags:=", _
  "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_7:CreateUserDefinedPart:1", _
  "Skew", "statorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_7:CreateUserDefinedPart:1", _
  "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_7"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "210deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "424.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "48mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15.9mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "19.1030710912257mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "31.7417108596157mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "1"))), Array("NAME:Attributes", "Name:=", "Coil_8", "Flags:=", _
  "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_8:CreateUserDefinedPart:1", _
  "Skew", "statorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_8:CreateUserDefinedPart:1", _
  "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_8"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "240deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "424.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "48mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15.9mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "19.1030710912257mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "31.7417108596157mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "1"))), Array("NAME:Attributes", "Name:=", "Coil_9", "Flags:=", _
  "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_9:CreateUserDefinedPart:1", _
  "Skew", "statorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_9:CreateUserDefinedPart:1", _
  "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_9"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "270deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "424.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "48mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15.9mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "19.1030710912257mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "31.7417108596157mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "1"))), Array("NAME:Attributes", "Name:=", "Coil_10", "Flags:=", _
  "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_10:CreateUserDefinedPart:1", _
  "Skew", "statorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_10:CreateUserDefinedPart:1", _
  "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_10"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "300deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "424.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "48mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15.9mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "19.1030710912257mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "31.7417108596157mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "1"))), Array("NAME:Attributes", "Name:=", "Coil_11", "Flags:=", _
  "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_11:CreateUserDefinedPart:1", _
  "Skew", "statorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_11:CreateUserDefinedPart:1", _
  "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_11"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "330deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "424.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "48mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15.9mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "19.1030710912257mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "31.7417108596157mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "2"))), Array("NAME:Attributes", "Name:=", "CoilTerm_0", _
  "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_0:CreateUserDefinedPart:1", "Skew", "statorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_0:CreateUserDefinedPart:1", "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "424.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "48mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15.9mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "19.1030710912257mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "31.7417108596157mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "2"))), Array("NAME:Attributes", "Name:=", "CoilTerm_1", _
  "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_1:CreateUserDefinedPart:1", "Skew", "statorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_1:CreateUserDefinedPart:1", "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_1"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "30deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "424.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "48mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15.9mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "19.1030710912257mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "31.7417108596157mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "2"))), Array("NAME:Attributes", "Name:=", "CoilTerm_2", _
  "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_2:CreateUserDefinedPart:1", "Skew", "statorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_2:CreateUserDefinedPart:1", "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_2"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "60deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "424.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "48mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15.9mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "19.1030710912257mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "31.7417108596157mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "2"))), Array("NAME:Attributes", "Name:=", "CoilTerm_3", _
  "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_3:CreateUserDefinedPart:1", "Skew", "statorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_3:CreateUserDefinedPart:1", "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_3"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "90deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "424.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "48mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15.9mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "19.1030710912257mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "31.7417108596157mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "2"))), Array("NAME:Attributes", "Name:=", "CoilTerm_4", _
  "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_4:CreateUserDefinedPart:1", "Skew", "statorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_4:CreateUserDefinedPart:1", "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_4"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "120deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "424.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "48mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15.9mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "19.1030710912257mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "31.7417108596157mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "2"))), Array("NAME:Attributes", "Name:=", "CoilTerm_5", _
  "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_5:CreateUserDefinedPart:1", "Skew", "statorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_5:CreateUserDefinedPart:1", "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_5"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "150deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "424.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "48mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15.9mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "19.1030710912257mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "31.7417108596157mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "2"))), Array("NAME:Attributes", "Name:=", "CoilTerm_6", _
  "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_6:CreateUserDefinedPart:1", "Skew", "statorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_6:CreateUserDefinedPart:1", "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_6"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "180deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "424.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "48mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15.9mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "19.1030710912257mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "31.7417108596157mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "2"))), Array("NAME:Attributes", "Name:=", "CoilTerm_7", _
  "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_7:CreateUserDefinedPart:1", "Skew", "statorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_7:CreateUserDefinedPart:1", "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_7"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "210deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "424.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "48mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15.9mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "19.1030710912257mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "31.7417108596157mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "2"))), Array("NAME:Attributes", "Name:=", "CoilTerm_8", _
  "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_8:CreateUserDefinedPart:1", "Skew", "statorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_8:CreateUserDefinedPart:1", "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_8"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "240deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "424.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "48mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15.9mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "19.1030710912257mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "31.7417108596157mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "2"))), Array("NAME:Attributes", "Name:=", "CoilTerm_9", _
  "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_9:CreateUserDefinedPart:1", "Skew", "statorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_9:CreateUserDefinedPart:1", "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_9"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "270deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "424.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "48mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15.9mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "19.1030710912257mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "31.7417108596157mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "2"))), Array("NAME:Attributes", "Name:=", "CoilTerm_10", _
  "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_10:CreateUserDefinedPart:1", "Skew", "statorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_10:CreateUserDefinedPart:1", "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_10"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "300deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "274.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "424.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "48mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "15.9mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "19.1030710912257mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "31.7417108596157mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "2"))), Array("NAME:Attributes", "Name:=", "CoilTerm_11", _
  "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_11:CreateUserDefinedPart:1", "Skew", "statorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_11:CreateUserDefinedPart:1", "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_11"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "330deg")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseA", "Type:=", "External", _
  "IsSolid:=", false, "Current:=", "0A", "Resistance:=", "R1", "Inductance:=", _
  "Le1", "ParallelBranchesNum:=", "1")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseB", "Type:=", "External", _
  "IsSolid:=", false, "Current:=", "0A", "Resistance:=", "R1", "Inductance:=", _
  "Le1", "ParallelBranchesNum:=", "1")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseC", "Type:=", "External", _
  "IsSolid:=", false, "Current:=", "0A", "Resistance:=", "R1", "Inductance:=", _
  "Le1", "ParallelBranchesNum:=", "1")
oModule.AssignCoilTerminal Array("NAME:PhA_0", "Objects:=", Array("CoilTerm_0"), _
  "Conductor number:=", "conds", "Point out of terminal:=", false, _
  "Winding:=", "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhA_1", "Objects:=", Array("CoilTerm_1"), _
  "Conductor number:=", "conds", "Point out of terminal:=", false, _
  "Winding:=", "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhCRe_2", "Objects:=", Array(_
  "CoilTerm_2"), "Conductor number:=", "conds", "Point out of terminal:=", _
  true, "Winding:=", "PhaseC")
oModule.AssignCoilTerminal Array("NAME:PhCRe_3", "Objects:=", Array(_
  "CoilTerm_3"), "Conductor number:=", "conds", "Point out of terminal:=", _
  true, "Winding:=", "PhaseC")
oModule.AssignCoilTerminal Array("NAME:PhB_4", "Objects:=", Array("CoilTerm_4"), _
  "Conductor number:=", "conds", "Point out of terminal:=", false, _
  "Winding:=", "PhaseB")
oModule.AssignCoilTerminal Array("NAME:PhB_5", "Objects:=", Array("CoilTerm_5"), _
  "Conductor number:=", "conds", "Point out of terminal:=", false, _
  "Winding:=", "PhaseB")
oModule.AssignCoilTerminal Array("NAME:PhARe_6", "Objects:=", Array(_
  "CoilTerm_6"), "Conductor number:=", "conds", "Point out of terminal:=", _
  true, "Winding:=", "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhARe_7", "Objects:=", Array(_
  "CoilTerm_7"), "Conductor number:=", "conds", "Point out of terminal:=", _
  true, "Winding:=", "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhC_8", "Objects:=", Array("CoilTerm_8"), _
  "Conductor number:=", "conds", "Point out of terminal:=", false, _
  "Winding:=", "PhaseC")
oModule.AssignCoilTerminal Array("NAME:PhC_9", "Objects:=", Array("CoilTerm_9"), _
  "Conductor number:=", "conds", "Point out of terminal:=", false, _
  "Winding:=", "PhaseC")
oModule.AssignCoilTerminal Array("NAME:PhBRe_10", "Objects:=", Array(_
  "CoilTerm_10"), "Conductor number:=", "conds", "Point out of terminal:=", _
  true, "Winding:=", "PhaseB")
oModule.AssignCoilTerminal Array("NAME:PhBRe_11", "Objects:=", Array(_
  "CoilTerm_11"), "Conductor number:=", "conds", "Point out of terminal:=", _
  true, "Winding:=", "PhaseB")
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignLengthOp Array("NAME:Length_Coil", "RefineInside:=", true, _
  "Objects:=", Array("Coil_0", "Coil_1", "Coil_2", "Coil_3", "Coil_4", _
  "Coil_5", "Coil_6", "Coil_7", "Coil_8", "Coil_9", "Coil_10", "Coil_11"), _
  "RestrictElem:=", false, "NumMaxElem:=", "1000", "RestrictLength:=", true, _
  "MaxLength:=", "50.8448mm")
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignTrueSurfOp Array("NAME:SurfApprox_Coil", "Objects:=", Array(_
  "Coil_0", "Coil_1", "Coil_2", "Coil_3", "Coil_4", "Coil_5", "Coil_6", _
  "Coil_7", "Coil_8", "Coil_9", "Coil_10", "Coil_11"), "NormalDevChoice:=", 2, _
  "NormalDev:=", "30deg", "AspectRatioChoice:=", 1)
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/IPMCore", "Version:=", "19.0", "NoOfParameters:=", 16, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "273.4mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Poles", "Value:=", "26"), _
  Array("NAME:Pair", "Name:=", "PoleType", "Value:=", "2"), Array("NAME:Pair", _
  "Name:=", "D1", "Value:=", "271.4mm"), Array("NAME:Pair", "Name:=", "O1", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "O2", "Value:=", _
  "70.34353641313533mm"), Array("NAME:Pair", "Name:=", "B1", "Value:=", _
  "15mm"), Array("NAME:Pair", "Name:=", "Rib", "Value:=", "2mm"), Array(_
  "NAME:Pair", "Name:=", "HRib", "Value:=", "14.5903165338557mm"), Array(_
  "NAME:Pair", "Name:=", "DminMag", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "ThickMag", "Value:=", "15mm"), Array("NAME:Pair", "Name:=", _
  "WidthMag", "Value:=", "19.2mm"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "InfoCore", _
  "Value:=", "0"))), Array("NAME:Attributes", "Name:=", "Rotor", "Flags:=", _
  "", "Color:=", "(132 132 193)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "AK_3DSF0.950", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Rotor:CreateUserDefinedPart:1", _
  "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Rotor"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "6.9230769230769234deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/IPMCore", "Version:=", "19.0", "NoOfParameters:=", 16, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "273.4mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Poles", "Value:=", "26"), _
  Array("NAME:Pair", "Name:=", "PoleType", "Value:=", "2"), Array("NAME:Pair", _
  "Name:=", "D1", "Value:=", "271.4mm"), Array("NAME:Pair", "Name:=", "O1", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "O2", "Value:=", _
  "70.34353641313533mm"), Array("NAME:Pair", "Name:=", "B1", "Value:=", _
  "15mm"), Array("NAME:Pair", "Name:=", "Rib", "Value:=", "2mm"), Array(_
  "NAME:Pair", "Name:=", "HRib", "Value:=", "14.5903165338557mm"), Array(_
  "NAME:Pair", "Name:=", "DminMag", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "ThickMag", "Value:=", "15mm"), Array("NAME:Pair", "Name:=", _
  "WidthMag", "Value:=", "19.2mm"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "InfoCore", _
  "Value:=", "3"))), Array("NAME:Attributes", "Name:=", "Mag", "Flags:=", "", _
  "Color:=", "(0 255 128)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "Arnold_Magnetics_N50H_60C_3DSF1.000_X", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Mag:CreateUserDefinedPart:1", _
  "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Mag"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "6.9230769230769234deg")
oEditor.DuplicateAroundAxis Array("NAME:Selections", "Selections:=", "Mag"), _
  Array("NAME:DuplicateAroundAxisParameters", "CoordinateSystemID:=", -1, _
  "CreateNewObjects:=", true, "WhichAxis:=", "Z", "AngleStr:=", _
  "13.846153846153847deg", "NumClones:=", "26"), Array("NAME:Options", _
  "DuplicateBoundaries:=", false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag"), Array(_
  "NAME:ChangedProps", Array("NAME:Name", "Value:=", "Mag_0"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.992709", "XAxisYvec:=", "0.120537", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.120537", "YAxisYvec:=", "0.992709", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_0")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_0"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_0"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_1"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "Arnold_Magnetics_N50H_60C_3DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.935016", "XAxisYvec:=", "-0.354605", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.354605", "YAxisYvec:=", "-0.935016", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_1")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_1"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_1"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.822984", "XAxisYvec:=", "0.568065", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.568065", "YAxisYvec:=", "0.822984", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_2")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_2"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_2"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_3"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "Arnold_Magnetics_N50H_60C_3DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.663123", "XAxisYvec:=", "-0.748511", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.748511", "YAxisYvec:=", "-0.663123", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_3")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_3"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_3"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.464723", "XAxisYvec:=", "0.885456", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.885456", "YAxisYvec:=", "0.464723", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_4")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_4"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_4"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_5"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "Arnold_Magnetics_N50H_60C_3DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.239316", "XAxisYvec:=", "-0.970942", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.970942", "YAxisYvec:=", "-0.239316", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_5")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_5"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_5"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "2.83277e-16", "XAxisYvec:=", "1", "XAxisZvec:=", "0", _
  "YAxisXvec:=", "-1", "YAxisYvec:=", "1.22465e-16", "YAxisZvec:=", "0"), _
  Array("NAME:Attributes", "Name:=", "relativeCS_6")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_6"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_6"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_7"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "Arnold_Magnetics_N50H_60C_3DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.239316", "XAxisYvec:=", "-0.970942", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.970942", "YAxisYvec:=", "0.239316", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_7")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_7"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_7"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.464723", "XAxisYvec:=", "0.885456", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.885456", "YAxisYvec:=", "-0.464723", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_8")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_8"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_8"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_9"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "Arnold_Magnetics_N50H_60C_3DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.663123", "XAxisYvec:=", "-0.748511", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.748511", "YAxisYvec:=", "0.663123", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_9")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_9"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_9"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.822984", "XAxisYvec:=", "0.568065", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.568065", "YAxisYvec:=", "-0.822984", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_10")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_10"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_10"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_11"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "Arnold_Magnetics_N50H_60C_3DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.935016", "XAxisYvec:=", "-0.354605", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.354605", "YAxisYvec:=", "0.935016", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_11")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_11"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_11"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.992709", "XAxisYvec:=", "0.120537", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.120537", "YAxisYvec:=", "-0.992709", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_12")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_12"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_12"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_13"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "Arnold_Magnetics_N50H_60C_3DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.992709", "XAxisYvec:=", "0.120537", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.120537", "YAxisYvec:=", "0.992709", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_13")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_13"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_13"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.935016", "XAxisYvec:=", "-0.354605", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.354605", "YAxisYvec:=", "-0.935016", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_14")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_14"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_14"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_15"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "Arnold_Magnetics_N50H_60C_3DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.822984", "XAxisYvec:=", "0.568065", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.568065", "YAxisYvec:=", "0.822984", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_15")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_15"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_15"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.663123", "XAxisYvec:=", "-0.748511", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.748511", "YAxisYvec:=", "-0.663123", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_16")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_16"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_16"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_17"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "Arnold_Magnetics_N50H_60C_3DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.464723", "XAxisYvec:=", "0.885456", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.885456", "YAxisYvec:=", "0.464723", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_17")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_17"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_17"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.239316", "XAxisYvec:=", "-0.970942", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.970942", "YAxisYvec:=", "-0.239316", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_18")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_18"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_18"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_19"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "Arnold_Magnetics_N50H_60C_3DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "3.06162e-16", "XAxisYvec:=", "1", "XAxisZvec:=", "0", _
  "YAxisXvec:=", "-1", "YAxisYvec:=", "3.67394e-16", "YAxisZvec:=", "0"), _
  Array("NAME:Attributes", "Name:=", "relativeCS_19")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_19"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_19"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.239316", "XAxisYvec:=", "-0.970942", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.970942", "YAxisYvec:=", "0.239316", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_20")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_20"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_20"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_21"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "Arnold_Magnetics_N50H_60C_3DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.464723", "XAxisYvec:=", "0.885456", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.885456", "YAxisYvec:=", "-0.464723", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_21")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_21"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_21"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.663123", "XAxisYvec:=", "-0.748511", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.748511", "YAxisYvec:=", "0.663123", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_22")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_22"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_22"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_23"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "Arnold_Magnetics_N50H_60C_3DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.822984", "XAxisYvec:=", "0.568065", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.568065", "YAxisYvec:=", "-0.822984", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_23")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_23"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_23"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.935016", "XAxisYvec:=", "-0.354605", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.354605", "YAxisYvec:=", "0.935016", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_24")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_24"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_24"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_25"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "Arnold_Magnetics_N50H_60C_3DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.992709", "XAxisYvec:=", "0.120537", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.120537", "YAxisYvec:=", "-0.992709", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_25")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_25"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_25"))))
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignLengthOp Array("NAME:Length_Mag", "RefineInside:=", true, _
  "Objects:=", Array("Mag_0", "Mag_1", "Mag_2", "Mag_3", "Mag_4", "Mag_5", _
  "Mag_6", "Mag_7", "Mag_8", "Mag_9", "Mag_10", "Mag_11", "Mag_12", "Mag_13", _
  "Mag_14", "Mag_15", "Mag_16", "Mag_17", "Mag_18", "Mag_19", "Mag_20", _
  "Mag_21", "Mag_22", "Mag_23", "Mag_24", "Mag_25"), "RestrictElem:=", _
  false, "NumMaxElem:=", "1000", "RestrictLength:=", true, "MaxLength:=", _
  "30mm")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/IPMCore", "Version:=", "19.0", "NoOfParameters:=", 16, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "273.4mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "42.2mm"), Array("NAME:Pair", "Name:=", "Poles", "Value:=", "26"), _
  Array("NAME:Pair", "Name:=", "PoleType", "Value:=", "2"), Array("NAME:Pair", _
  "Name:=", "D1", "Value:=", "271.4mm"), Array("NAME:Pair", "Name:=", "O1", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "O2", "Value:=", _
  "70.34353641313533mm"), Array("NAME:Pair", "Name:=", "B1", "Value:=", _
  "15mm"), Array("NAME:Pair", "Name:=", "Rib", "Value:=", "2mm"), Array(_
  "NAME:Pair", "Name:=", "HRib", "Value:=", "14.5903165338557mm"), Array(_
  "NAME:Pair", "Name:=", "DminMag", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "ThickMag", "Value:=", "15mm"), Array("NAME:Pair", "Name:=", _
  "WidthMag", "Value:=", "19.2mm"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "90.12423710230325mm"), Array("NAME:Pair", "Name:=", "InfoCore", _
  "Value:=", "100"))), Array("NAME:Attributes", "Name:=", "InnerRegion", _
  "Flags:=", "", "Color:=", "(0 255 255)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "vacuum", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "InnerRegion:CreateUserDefinedPart:1", "LenRegion", "42.2mm + 2*endRegion"
On Error Goto 0
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignLengthOp Array("NAME:Length_Main", "RefineInside:=", true, _
  "Objects:=", Array("Stator", "Rotor", "Band", "OuterRegion", "InnerRegion", _
  "Shaft"), "RestrictElem:=", false, "NumMaxElem:=", "1000", _
  "RestrictLength:=", true, "MaxLength:=", "60.44mm")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Band", _
  "OuterRegion", "InnerRegion", "MasterSheet", "SlaveSheet"), Array(_
  "NAME:ChangedProps", Array("NAME:Transparent", "Value:=", 0.75))))
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "Band,InnerRegion" & _
  ",Shaft,Stator,Coil_0,Coil_1,Coil_2,Coil_3,Coil_4,Coil_5,Coil_6,Coil_7" & _
  ",Coil_8,Coil_9,Coil_10,Coil_11,CoilTerm_0,CoilTerm_1,CoilTerm_2" & _
  ",CoilTerm_3,CoilTerm_4,CoilTerm_5,CoilTerm_6,CoilTerm_7,CoilTerm_8" & _
  ",CoilTerm_9,CoilTerm_10,CoilTerm_11,Rotor,Mag_0,Mag_1,Mag_2,Mag_3,Mag_4" & _
  ",Mag_5,Mag_6,Mag_7,Mag_8,Mag_9,Mag_10,Mag_11,Mag_12,Mag_13,Mag_14" & _
  ",Mag_15,Mag_16,Mag_17,Mag_18,Mag_19,Mag_20,Mag_21,Mag_22,Mag_23,Mag_24" & _
  ",Mag_25", "Tool Parts:=", "Tool"), Array("NAME:SubtractParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", false)
oEditor.FitAll
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:ChangedProps", _
  Array("NAME:statorSkew", "Value:=", "10.3275deg"))))
Set oModule = oDesign.GetModule("ModelSetup")
oModule.AssignBand Array("NAME:MotionSetup1", "Move Type:=", "Rotate", _
  "Coordinate System:=", "Global", "Axis:=", "Z", "Is Positive:=", true, _
  "InitPos:=", "9.23077deg", "HasRotateLimit:=", false, "NonCylindrical:=", _
  false, "Consider Mechanical Transient:=", true, "Angular Velocity:=", _
  "2700rpm", "Moment of Inertia:=", 0.180551, "Damping:=", 0.00278563, _
  "Load Torque:=", _
  "if(speed<282.743, -0.551096*speed, -44056.7/speed) - 0.551096*(speed-282.743)*10", _
  "Objects:=", Array("Band"))
oModule.EditMotionSetup Array("NAME:Data", "Consider Mechanical Transient:=", _
  false)
Set oModule = oDesign.GetModule("AnalysisSetup")
oModule.InsertSetup "Transient", Array("NAME:Setup1", "StopTime:=", "0.02s", _
  "TimeStep:=", "2e-05s")
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
set oUnclassified = oEditor.GetObjectsInGroup("Unclassified")
Dim oObject
For Each oObject in oUnclassified
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", oObject), Array(_
  "NAME:ChangedProps", Array("NAME:Model", "Value:=", false))))
Next
oEditor.ShowWindow
Set oModule = oDesign.GetModule("OutputVariable")
oModule.CreateOutputVariable "pos", _
  "(Moving1.Position -9.23077 * PI/180) * 13 + PI", "Setup1 : Transient", _
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
