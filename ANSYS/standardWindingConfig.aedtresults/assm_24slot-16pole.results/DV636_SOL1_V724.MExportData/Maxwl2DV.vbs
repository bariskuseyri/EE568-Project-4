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
  "Value:=", "4"))))
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
  "NAME:Coordinate", "X:=", 15.9356, "Y:=", 0.095001), Array(_
  "NAME:Coordinate", "X:=", 31.8712, "Y:=", 0.190002), Array(_
  "NAME:Coordinate", "X:=", 38.6004, "Y:=", 0.285002), Array(_
  "NAME:Coordinate", "X:=", 44.8737, "Y:=", 0.380003), Array(_
  "NAME:Coordinate", "X:=", 51.4369, "Y:=", 0.475003), Array(_
  "NAME:Coordinate", "X:=", 58.7526, "Y:=", 0.570004), Array(_
  "NAME:Coordinate", "X:=", 67.2449, "Y:=", 0.665004), Array(_
  "NAME:Coordinate", "X:=", 77.4196, "Y:=", 0.760005), Array(_
  "NAME:Coordinate", "X:=", 89.9991, "Y:=", 0.855006), Array(_
  "NAME:Coordinate", "X:=", 106.201, "Y:=", 0.950007), Array(_
  "NAME:Coordinate", "X:=", 128.547, "Y:=", 1.04501), Array("NAME:Coordinate", _
  "X:=", 163.753, "Y:=", 1.14001), Array("NAME:Coordinate", "X:=", 234.832, _
  "Y:=", 1.23501), Array("NAME:Coordinate", "X:=", 435.253, "Y:=", 1.33003), _
  Array("NAME:Coordinate", "X:=", 1108.32, "Y:=", 1.42507), Array(_
  "NAME:Coordinate", "X:=", 2801.2, "Y:=", 1.52018), Array("NAME:Coordinate", _
  "X:=", 5591.07, "Y:=", 1.61535), Array("NAME:Coordinate", "X:=", 9708.76, _
  "Y:=", 1.71061), Array("NAME:Coordinate", "X:=", 16041.4, "Y:=", 1.80601), _
  Array("NAME:Coordinate", "X:=", 31313.3, "Y:=", 1.90197), Array(_
  "NAME:Coordinate", "X:=", 88477, "Y:=", 2.00056), Array("NAME:Coordinate", _
  "X:=", 159968, "Y:=", 2.10005), Array("NAME:Coordinate", "X:=", 874878, _
  "Y:=", 3.09497))), Array("NAME:core_loss_type", "property_type:=", _
  "ChoiceProperty", "Choice:=", "Electrical Steel"), "core_loss_kh:=", _
  76.1206, "core_loss_kc:=", 0.675237, "core_loss_ke:=", 0, "conductivity:=", _
  2e+06, "mass_density:=", 7267.5) 
end if
if (oDefinitionManager.DoesMaterialExist("Arnold_Magnetics_N50H_60C_2DSF1.000_X")) then
else
oDefinitionManager.AddMaterial Array(_
  "NAME:Arnold_Magnetics_N50H_60C_2DSF1.000_X", "CoordinateSystemType:=", _
  "Cartesian", Array("NAME:AttachedData"), Array("NAME:ModifierData"), _
  "permeability:=", "1", "conductivity:=", "555556", "mass_density:=", "7500", _
  Array("NAME:magnetic_coercivity", "property_type:=", "VectorProperty", _
  "Magnitude:=", "-1.00794e+06A_per_meter", "DirComp1:=", "1", "DirComp2:=", _
  "0", "DirComp3:=", "0"))
end if
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "252.8mm"), Array("NAME:Pair", "Name:=", _
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
  "Name:=", "DiaGap", "Value:=", "252.8mm"), Array("NAME:Pair", "Name:=", _
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
  "Name:=", "DiaGap", "Value:=", "252.8mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "391.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", "4"), Array(_
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
  "OuterRegion", "XPosition:=", "138.41615241726669mm", "YPosition:=", _
  "138.41615241726669mm", "ZPosition:=", "0mm"))
oModule.AssignVectorPotential Array("NAME:VectorPotential1", "Edges:=", Array(edgeID), _
  "Value:=", "0", "CoordinateSystem:=", "")
edgeID = oEditor.GetEdgeByPosition(Array("NAME:Parameters", "BodyName:=", _
  "OuterRegion", "XPosition:=", "97.875mm", "YPosition:=", "0mm", _
  "ZPosition:=", "0mm"))
oModule.AssignMaster Array("NAME:Master1", "Edges:=", Array(edgeID), _
  "ReverseV:=", false)
edgeID = oEditor.GetEdgeByPosition(Array("NAME:Parameters", "BodyName:=", _
  "OuterRegion", "XPosition:=", "5.99311527332736e-15mm", "YPosition:=", _
  "97.875mm", "ZPosition:=", "0mm"))
oModule.AssignSlave Array("NAME:Slave1", "Edges:=", Array(edgeID), _
  "ReverseU:=", true, "Master:=", "Master1", "SameAsMaster:=", true)
oDesign.SetDesignSettings Array("NAME:Design Settings Data", "ModelDepth:=", _
  "49.6mm")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "253.4mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "391.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs01", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "2mm"), Array("NAME:Pair", _
  "Name:=", "Hs2", "Value:=", "43.5mm"), Array("NAME:Pair", "Name:=", "Bs0", _
  "Value:=", "14mm"), Array("NAME:Pair", "Name:=", "Bs1", "Value:=", _
  "17.72063077618766mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", _
  "29.1743980662911mm"), Array("NAME:Pair", "Name:=", "Rs", "Value:=", "5mm"), _
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
  "LenRegion", "49.6mm + 2*endRegion"
On Error Goto 0
On Error Resume Next
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:delta", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", _
  "49.057068432540149deg"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:conds", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", _
  "29"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:R1", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", _
  "0.019049205724832756ohm"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:Le1", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", _
  "1.7601038546011492e-05H"))))
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "253.4mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "391.5mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "2mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "43.5mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "14mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "17.72063077618766mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "29.1743980662911mm"), Array("NAME:Pair", "Name:=", "Rs", _
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
  "LenRegion", "49.6mm + 2*endRegion"
On Error Goto 0
oEditor.DuplicateAroundAxis Array("NAME:Selections", "Selections:=", "Coil"), _
  Array("NAME:DuplicateAroundAxisParameters", "CoordinateSystemID:=", -1, _
  "CreateNewObjects:=", true, "WhichAxis:=", "Z", "AngleStr:=", "-15deg", _
  "NumClones:=", "24"), Array("NAME:Options", "DuplicateBoundaries:=", false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Coil"), Array(_
  "NAME:ChangedProps", Array("NAME:Name", "Value:=", "Coil_0"))))
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_0,Coil_6,Coil_12" & _
  ",Coil_18"), Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, _
  "KeepOriginals:=", false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_1,Coil_7,Coil_13" & _
  ",Coil_19"), Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, _
  "KeepOriginals:=", false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_2,Coil_8,Coil_14" & _
  ",Coil_20"), Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, _
  "KeepOriginals:=", false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_3,Coil_9,Coil_15" & _
  ",Coil_21"), Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, _
  "KeepOriginals:=", false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_4,Coil_10,Coil_16" & _
  ",Coil_22"), Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, _
  "KeepOriginals:=", false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_5,Coil_11,Coil_17" & _
  ",Coil_23"), Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, _
  "KeepOriginals:=", false)
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseA", "Type:=", "Voltage", _
  "IsSolid:=", false, "Current:=", "0A", "Voltage:=", _
  "1959.59*sin(2*pi*360*time+delta)", "Resistance:=", "R1", "Inductance:=", _
  "Le1", "ParallelBranchesNum:=", "1")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseB", "Type:=", "Voltage", _
  "IsSolid:=", false, "Current:=", "0A", "Voltage:=", _
  "1959.59*sin(2*pi*360*time+delta-2*pi/3)", "Resistance:=", "R1", _
  "Inductance:=", "Le1", "ParallelBranchesNum:=", "1")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseC", "Type:=", "Voltage", _
  "IsSolid:=", false, "Current:=", "0A", "Voltage:=", _
  "1959.59*sin(2*pi*360*time+delta-4*pi/3)", "Resistance:=", "R1", _
  "Inductance:=", "Le1", "ParallelBranchesNum:=", "1")
oModule.AssignCoil Array("NAME:PhA_0", "Objects:=", Array("Coil_0"), _
  "Conductor number:=", "conds", "PolarityType:=", "Positive", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhARe_0", "Objects:=", Array("Coil_1"), _
  "Conductor number:=", "conds", "PolarityType:=", "Negative", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhB_1", "Objects:=", Array("Coil_2"), _
  "Conductor number:=", "conds", "PolarityType:=", "Positive", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhBRe_1", "Objects:=", Array("Coil_3"), _
  "Conductor number:=", "conds", "PolarityType:=", "Negative", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhC_2", "Objects:=", Array("Coil_4"), _
  "Conductor number:=", "conds", "PolarityType:=", "Positive", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhCRe_2", "Objects:=", Array("Coil_5"), _
  "Conductor number:=", "conds", "PolarityType:=", "Negative", "Winding:=", _
  "PhaseC")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/IPMCore", "Version:=", "19.0", "NoOfParameters:=", 16, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "252.2mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Poles", "Value:=", "16"), _
  Array("NAME:Pair", "Name:=", "PoleType", "Value:=", "2"), Array("NAME:Pair", _
  "Name:=", "D1", "Value:=", "250.2mm"), Array("NAME:Pair", "Name:=", "O1", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "O2", "Value:=", _
  "59.23286396506127mm"), Array("NAME:Pair", "Name:=", "B1", "Value:=", _
  "15mm"), Array("NAME:Pair", "Name:=", "Rib", "Value:=", "2mm"), Array(_
  "NAME:Pair", "Name:=", "HRib", "Value:=", "13.92205321642452mm"), Array(_
  "NAME:Pair", "Name:=", "DminMag", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "ThickMag", "Value:=", "15mm"), Array("NAME:Pair", "Name:=", _
  "WidthMag", "Value:=", "28.7mm"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "InfoCore", "Value:=", "0"))), _
  Array("NAME:Attributes", "Name:=", "Rotor", "Flags:=", "", "Color:=", _
  "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "AK_2DSF0.950", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Rotor:CreateUserDefinedPart:1", _
  "LenRegion", "49.6mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Rotor"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "11.25deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/IPMCore", "Version:=", "19.0", "NoOfParameters:=", 16, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "252.2mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Poles", "Value:=", "16"), _
  Array("NAME:Pair", "Name:=", "PoleType", "Value:=", "2"), Array("NAME:Pair", _
  "Name:=", "D1", "Value:=", "250.2mm"), Array("NAME:Pair", "Name:=", "O1", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "O2", "Value:=", _
  "59.23286396506127mm"), Array("NAME:Pair", "Name:=", "B1", "Value:=", _
  "15mm"), Array("NAME:Pair", "Name:=", "Rib", "Value:=", "2mm"), Array(_
  "NAME:Pair", "Name:=", "HRib", "Value:=", "13.92205321642452mm"), Array(_
  "NAME:Pair", "Name:=", "DminMag", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "ThickMag", "Value:=", "15mm"), Array("NAME:Pair", "Name:=", _
  "WidthMag", "Value:=", "28.7mm"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "InfoCore", "Value:=", "3"))), _
  Array("NAME:Attributes", "Name:=", "Mag", "Flags:=", "", "Color:=", _
  "(0 255 128)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "Arnold_Magnetics_N50H_60C_2DSF1.000_X", "SolveInside:=", _
  true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Mag:CreateUserDefinedPart:1", _
  "LenRegion", "49.6mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Mag"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "11.25deg")
oEditor.DuplicateAroundAxis Array("NAME:Selections", "Selections:=", "Mag"), _
  Array("NAME:DuplicateAroundAxisParameters", "CoordinateSystemID:=", -1, _
  "CreateNewObjects:=", true, "WhichAxis:=", "Z", "AngleStr:=", "22.5deg", _
  "NumClones:=", "16"), Array("NAME:Options", "DuplicateBoundaries:=", false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag"), Array(_
  "NAME:ChangedProps", Array("NAME:Name", "Value:=", "Mag_0"))))
oEditor.Unite Array("NAME:Selections", "Selections:=", "Mag_0,Mag_4,Mag_8" & _
  ",Mag_12"), Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, _
  "KeepOriginals:=", false)
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.980785", "XAxisYvec:=", "0.19509", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.19509", "YAxisYvec:=", "0.980785", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_0")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_0"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_0"))))
oEditor.Unite Array("NAME:Selections", "Selections:=", "Mag_1,Mag_5,Mag_9" & _
  ",Mag_13"), Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, _
  "KeepOriginals:=", false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_1"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "Arnold_Magnetics_N50H_60C_2DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.83147", "XAxisYvec:=", "-0.55557", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.55557", "YAxisYvec:=", "-0.83147", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_1")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_1"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_1"))))
oEditor.Unite Array("NAME:Selections", "Selections:=", "Mag_2,Mag_6,Mag_10" & _
  ",Mag_14"), Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, _
  "KeepOriginals:=", false)
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.55557", "XAxisYvec:=", "0.83147", "XAxisZvec:=", "0", _
  "YAxisXvec:=", "-0.83147", "YAxisYvec:=", "0.55557", "YAxisZvec:=", "0"), _
  Array("NAME:Attributes", "Name:=", "relativeCS_2")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_2"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_2"))))
oEditor.Unite Array("NAME:Selections", "Selections:=", "Mag_3,Mag_7,Mag_11" & _
  ",Mag_15"), Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, _
  "KeepOriginals:=", false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_3"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "Arnold_Magnetics_N50H_60C_2DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.19509", "XAxisYvec:=", "-0.980785", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.980785", "YAxisYvec:=", "-0.19509", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_3")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_3"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_3"))))
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignTrueSurfOp Array("NAME:SurfApprox_Mag", "Objects:=", Array(_
  "Mag_0", "Mag_1", "Mag_2", "Mag_3"), "SurfDevChoice:=", 2, "SurfDev:=", _
  "0.1261mm", "NormalDevChoice:=", 2, "NormalDev:=", "15deg", _
  "AspectRatioChoice:=", 1)
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/IPMCore", "Version:=", "19.0", "NoOfParameters:=", 16, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "252.2mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Poles", "Value:=", "16"), _
  Array("NAME:Pair", "Name:=", "PoleType", "Value:=", "2"), Array("NAME:Pair", _
  "Name:=", "D1", "Value:=", "250.2mm"), Array("NAME:Pair", "Name:=", "O1", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "O2", "Value:=", _
  "59.23286396506127mm"), Array("NAME:Pair", "Name:=", "B1", "Value:=", _
  "15mm"), Array("NAME:Pair", "Name:=", "Rib", "Value:=", "2mm"), Array(_
  "NAME:Pair", "Name:=", "HRib", "Value:=", "13.92205321642452mm"), Array(_
  "NAME:Pair", "Name:=", "DminMag", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "ThickMag", "Value:=", "15mm"), Array("NAME:Pair", "Name:=", _
  "WidthMag", "Value:=", "28.7mm"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "InfoCore", "Value:=", _
  "100"))), Array("NAME:Attributes", "Name:=", "InnerRegion", "Flags:=", "", _
  "Color:=", "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "vacuum", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "InnerRegion:CreateUserDefinedPart:1", "LenRegion", "49.6mm + 2*endRegion"
On Error Goto 0
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignTrueSurfOp Array("NAME:SurfApprox_Main", "Objects:=", Array(_
  "Stator", "Rotor", "Band", "OuterRegion", "InnerRegion", "Shaft"), _
  "SurfDevChoice:=", 2, "SurfDev:=", "0.19575mm", "NormalDevChoice:=", 2, _
  "NormalDev:=", "15deg", "AspectRatioChoice:=", 1)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Band", _
  "OuterRegion", "InnerRegion"), Array("NAME:ChangedProps", Array(_
  "NAME:Transparent", "Value:=", 0.75))))
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "Band,InnerRegion" & _
  ",Shaft,Stator,Coil_0,Coil_1,Coil_2,Coil_3,Coil_4,Coil_5,Rotor,Mag_0" & _
  ",Mag_1,Mag_2,Mag_3", "Tool Parts:=", "Tool"), Array(_
  "NAME:SubtractParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.FitAll
Set oModule = oDesign.GetModule("ModelSetup")
oModule.AssignBand Array("NAME:MotionSetup1", "Move Type:=", "Rotate", _
  "Coordinate System:=", "Global", "Axis:=", "Z", "Is Positive:=", true, _
  "InitPos:=", "3.75deg", "HasRotateLimit:=", false, "NonCylindrical:=", _
  false, "Consider Mechanical Transient:=", true, "Angular Velocity:=", _
  "2700rpm", "Moment of Inertia:=", 0.153658, "Damping:=", 0.00351173, _
  "Load Torque:=", _
  "if(speed<282.743, -0.587366*speed, -46956.3/speed) - 0.587366*(speed-282.743)*10", _
  "Objects:=", Array("Band"))
oModule.EditMotionSetup "MotionSetup1", Array("NAME:Data", _
  "Consider Mechanical Transient:=", false)
Set oModule = oDesign.GetModule("AnalysisSetup")
oModule.InsertSetup "Transient", Array("NAME:Setup1", "FastReachSteadyState:=", _
  true, "AutoDetectSteadyState:=", true, "FrequencyOfAddedVoltageSource:=", _
  "360Hz", "StopTime:=", "0.03s", "TimeStep:=", "3e-05s")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.SetMinimumTimeStep "0.0003ms" 
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
  "0.003s", "0.006s")
oModule.AddTraceCharacteristics "Currents", "rms", Array(), Array("Specified", _
  "0.003s", "0.006s")
oModule.AddTraceCharacteristics "Currents", "avg", Array(), Array("Specified", _
  "0.003s", "0.006s")
oModule.AddTraceCharacteristics "Voltages", "rms", Array(), Array("Specified", _
  "0.003s", "0.006s")
oModule.AddTraceCharacteristics "Induced Voltages", "rms", Array(), Array(_
  "Specified", "0.003s", "0.006s")
oModule.AddTraceCharacteristics "Powers", "avg", Array(), Array("Specified", _
  "0.003s", "0.006s")
oEditor.ShowWindow
Set oModule = oDesign.GetModule("OutputVariable")
oModule.CreateOutputVariable "pos", _
  "(Moving1.Position -3.75 * PI/180) * 8 + PI", "Setup1 : Transient", _
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
