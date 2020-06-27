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
if (oArgs.Count > 0) then 
  Set oDesign = oProject.GetDesign(oArgs(0))
else
  Set oDesign = oProject.GetActiveDesign()
end if
designName = oDesign.GetName
Set oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.SetModelUnits Array("NAME:Units Parameter", "Units:=", "mm", _
  "Rescale:=", false)
oDesign.SetSolutionType "Transient"
Set oModule = oDesign.GetModule("BoundarySetup")
oEditor.SetModelValidationSettings Array("NAME:Validation Options", _
  "EntityCheckLevel:=", "Strict", "IgnoreUnclassifiedObjects:=", true)
oDesign.SetDesignSettings Array("NAME:Design Settings Data", _
  "InsulatorThreshold:=", 2.5e+06)
On Error Resume Next
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:fractions", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "1"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:halfAxial", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "0"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:endRegion", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "45.593001737430157mm"))))
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
  "NAME:Coordinate", "X:=", 39.7885, "Y:=", 0.292639), Array(_
  "NAME:Coordinate", "X:=", 41.78, "Y:=", 0.312155), Array("NAME:Coordinate", _
  "X:=", 43.7839, "Y:=", 0.332262), Array("NAME:Coordinate", "X:=", 45.8127, _
  "Y:=", 0.353097), Array("NAME:Coordinate", "X:=", 47.8788, "Y:=", 0.37481), _
  Array("NAME:Coordinate", "X:=", 49.976, "Y:=", 0.397361), Array(_
  "NAME:Coordinate", "X:=", 52.0235, "Y:=", 0.419874), Array(_
  "NAME:Coordinate", "X:=", 53.9217, "Y:=", 0.441184), Array(_
  "NAME:Coordinate", "X:=", 55.5713, "Y:=", 0.460045), Array(_
  "NAME:Coordinate", "X:=", 56.9141, "Y:=", 0.475635), Array(_
  "NAME:Coordinate", "X:=", 58.0581, "Y:=", 0.489081), Array(_
  "NAME:Coordinate", "X:=", 59.1522, "Y:=", 0.502086), Array(_
  "NAME:Coordinate", "X:=", 60.3459, "Y:=", 0.516433), Array(_
  "NAME:Coordinate", "X:=", 61.7551, "Y:=", 0.533586), Array(_
  "NAME:Coordinate", "X:=", 63.3632, "Y:=", 0.553443), Array(_
  "NAME:Coordinate", "X:=", 65.1205, "Y:=", 0.57549), Array("NAME:Coordinate", _
  "X:=", 66.9773, "Y:=", 0.599176), Array("NAME:Coordinate", "X:=", 68.8921, _
  "Y:=", 0.624026), Array("NAME:Coordinate", "X:=", 70.8567, "Y:=", 0.649967), _
  Array("NAME:Coordinate", "X:=", 72.871, "Y:=", 0.675), Array(_
  "NAME:Coordinate", "X:=", 74.935, "Y:=", 0.7), Array("NAME:Coordinate", _
  "X:=", 77.0446, "Y:=", 0.725), Array("NAME:Coordinate", "X:=", 79.1791, _
  "Y:=", 0.75), Array("NAME:Coordinate", "X:=", 81.3136, "Y:=", 0.775), _
  Array("NAME:Coordinate", "X:=", 83.4232, "Y:=", 0.8), Array(_
  "NAME:Coordinate", "X:=", 85.4997, "Y:=", 0.825), Array("NAME:Coordinate", _
  "X:=", 87.601, "Y:=", 0.85), Array("NAME:Coordinate", "X:=", 89.8018, "Y:=", _
  0.875), Array("NAME:Coordinate", "X:=", 92.1767, "Y:=", 0.9), Array(_
  "NAME:Coordinate", "X:=", 94.7878, "Y:=", 0.925), Array("NAME:Coordinate", _
  "X:=", 97.6476, "Y:=", 0.95), Array("NAME:Coordinate", "X:=", 100.756, _
  "Y:=", 0.975), Array("NAME:Coordinate", "X:=", 104.113, "Y:=", 1), Array(_
  "NAME:Coordinate", "X:=", 107.709, "Y:=", 1.025), Array("NAME:Coordinate", _
  "X:=", 111.491, "Y:=", 1.05), Array("NAME:Coordinate", "X:=", 115.397, _
  "Y:=", 1.075), Array("NAME:Coordinate", "X:=", 119.366, "Y:=", 1.1), Array(_
  "NAME:Coordinate", "X:=", 123.396, "Y:=", 1.125), Array("NAME:Coordinate", _
  "X:=", 127.738, "Y:=", 1.15), Array("NAME:Coordinate", "X:=", 132.701, _
  "Y:=", 1.175), Array("NAME:Coordinate", "X:=", 138.597, "Y:=", 1.2), Array(_
  "NAME:Coordinate", "X:=", 145.819, "Y:=", 1.225), Array("NAME:Coordinate", _
  "X:=", 155.092, "Y:=", 1.25), Array("NAME:Coordinate", "X:=", 167.226, _
  "Y:=", 1.275), Array("NAME:Coordinate", "X:=", 183.027, "Y:=", 1.3), Array(_
  "NAME:Coordinate", "X:=", 203.74, "Y:=", 1.325), Array("NAME:Coordinate", _
  "X:=", 232.348, "Y:=", 1.35), Array("NAME:Coordinate", "X:=", 272.271, _
  "Y:=", 1.375), Array("NAME:Coordinate", "X:=", 326.929, "Y:=", 1.4), Array(_
  "NAME:Coordinate", "X:=", 400.175, "Y:=", 1.425), Array("NAME:Coordinate", _
  "X:=", 497.605, "Y:=", 1.45), Array("NAME:Coordinate", "X:=", 625.249, _
  "Y:=", 1.475), Array("NAME:Coordinate", "X:=", 789.139, "Y:=", 1.5), Array(_
  "NAME:Coordinate", "X:=", 995.127, "Y:=", 1.525), Array("NAME:Coordinate", _
  "X:=", 1248.36, "Y:=", 1.55), Array("NAME:Coordinate", "X:=", 1553.82, _
  "Y:=", 1.575), Array("NAME:Coordinate", "X:=", 1916.48, "Y:=", 1.6), Array(_
  "NAME:Coordinate", "X:=", 2340.16, "Y:=", 1.625), Array("NAME:Coordinate", _
  "X:=", 2824.15, "Y:=", 1.65), Array("NAME:Coordinate", "X:=", 3366.58, _
  "Y:=", 1.675), Array("NAME:Coordinate", "X:=", 3965.59, "Y:=", 1.7), Array(_
  "NAME:Coordinate", "X:=", 4611.41, "Y:=", 1.72474), Array("NAME:Coordinate", _
  "X:=", 5262.78, "Y:=", 1.74793), Array("NAME:Coordinate", "X:=", 5870.49, _
  "Y:=", 1.76803), Array("NAME:Coordinate", "X:=", 6385.39, "Y:=", 1.78347), _
  Array("NAME:Coordinate", "X:=", 6803.93, "Y:=", 1.79328), Array(_
  "NAME:Coordinate", "X:=", 7305.09, "Y:=", 1.79867), Array("NAME:Coordinate", _
  "X:=", 8113.49, "Y:=", 1.80144), Array("NAME:Coordinate", "X:=", 9453.75, _
  "Y:=", 1.80338), Array("NAME:Coordinate", "X:=", 11481.5, "Y:=", 1.80593), _
  Array("NAME:Coordinate", "X:=", 14076.7, "Y:=", 1.80919), Array(_
  "NAME:Coordinate", "X:=", 17050.1, "Y:=", 1.81293), Array("NAME:Coordinate", _
  "X:=", 20212.6, "Y:=", 1.8169), Array("NAME:Coordinate", "X:=", 51837.6, _
  "Y:=", 1.8566))), Array("NAME:core_loss_type", "property_type:=", _
  "ChoiceProperty", "Choice:=", "Electrical Steel"), "core_loss_kh:=", _
  72.3146, "core_loss_kc:=", 0.641475, "core_loss_ke:=", 0, "conductivity:=", _
  2e+06, "mass_density:=", 7650, Array("NAME:stacking_type", _
  "property_type:=", "ChoiceProperty", "Choice:=", "Lamination"), _
  "stacking_factor:=", "0.95", Array("NAME:stacking_direction", _
  "property_type:=", "ChoiceProperty", "Choice:=", "V(3)"))
end if
if (oDefinitionManager.DoesMaterialExist("M19_24G_3DSF0.950")) then
else
oDefinitionManager.AddMaterial Array("NAME:M19_24G_3DSF0.950", _
  "CoordinateSystemType:=", "Cartesian", Array("NAME:AttachedData"), Array(_
  "NAME:ModifierData"), Array("NAME:permeability", "property_type:=", _
  "nonlinear", "HUnit:=", "A_per_meter", "BUnit:=", "tesla", Array(_
  "NAME:BHCoordinates", Array("NAME:Coordinate", "X:=", 0, "Y:=", 0), Array(_
  "NAME:Coordinate", "X:=", 22.28, "Y:=", 0.05), Array("NAME:Coordinate", _
  "X:=", 25.46, "Y:=", 0.1), Array("NAME:Coordinate", "X:=", 31.83, "Y:=", _
  0.15), Array("NAME:Coordinate", "X:=", 47.74, "Y:=", 0.36), Array(_
  "NAME:Coordinate", "X:=", 63.66, "Y:=", 0.54), Array("NAME:Coordinate", _
  "X:=", 79.57, "Y:=", 0.65), Array("NAME:Coordinate", "X:=", 159.15, "Y:=", _
  0.99), Array("NAME:Coordinate", "X:=", 318.3, "Y:=", 1.2), Array(_
  "NAME:Coordinate", "X:=", 477.46, "Y:=", 1.28), Array("NAME:Coordinate", _
  "X:=", 636.61, "Y:=", 1.33), Array("NAME:Coordinate", "X:=", 795.77, "Y:=", _
  1.36), Array("NAME:Coordinate", "X:=", 1591.5, "Y:=", 1.44), Array(_
  "NAME:Coordinate", "X:=", 3183, "Y:=", 1.52), Array("NAME:Coordinate", _
  "X:=", 4774.6, "Y:=", 1.58), Array("NAME:Coordinate", "X:=", 6366.1, "Y:=", _
  1.63), Array("NAME:Coordinate", "X:=", 7957.7, "Y:=", 1.67), Array(_
  "NAME:Coordinate", "X:=", 15915, "Y:=", 1.8), Array("NAME:Coordinate", _
  "X:=", 31830, "Y:=", 1.9), Array("NAME:Coordinate", "X:=", 111407, "Y:=", 2), _
  Array("NAME:Coordinate", "X:=", 190984, "Y:=", 2.1), Array(_
  "NAME:Coordinate", "X:=", 350138, "Y:=", 2.3), Array("NAME:Coordinate", _
  "X:=", 509292, "Y:=", 2.5), Array("NAME:Coordinate", "X:=", 2.10083e+06, _
  "Y:=", 4.5))), Array("NAME:core_loss_type", "property_type:=", _
  "ChoiceProperty", "Choice:=", "Electrical Steel"), "core_loss_kh:=", 164.2, _
  "core_loss_kc:=", 1.3, "core_loss_ke:=", 1.72, "conductivity:=", 1.96e+06, _
  "mass_density:=", 7650, Array("NAME:stacking_type", "property_type:=", _
  "ChoiceProperty", "Choice:=", "Lamination"), "stacking_factor:=", "0.95", _
  Array("NAME:stacking_direction", "property_type:=", "ChoiceProperty", _
  "Choice:=", "V(3)"))
end if
if (oDefinitionManager.DoesMaterialExist("NdFe35_3DSF1.000_X")) then
else
oDefinitionManager.AddMaterial Array("NAME:NdFe35_3DSF1.000_X", _
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
  "Value:=", "134.5860034748603mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "0deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", _
  "1"), Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "100"))), Array(_
  "NAME:Attributes", "Name:=", "Shaft", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Shaft:CreateUserDefinedPart:1", _
  "Length", "43.4mm + 2*endRegion"
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "188.7mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "270.2mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "134.5860034748603mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "0deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", _
  "1"), Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "100"))), Array(_
  "NAME:Attributes", "Name:=", "OuterRegion", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion:CreateUserDefinedPart:1", "Length", "43.4mm + 2*endRegion"
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
  "OuterRegion1:CreateUserDefinedPart:1", "InfoCore", "1"
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "OuterRegion1"), _
  Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "Tool"))))
oEditor.FitAll
Set oModule = oDesign.GetModule("ModelSetup")
oModule.SetSymmetryMultiplier "fractions*(1+halfAxial)"
Set oModule = oDesign.GetModule("BoundarySetup")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "189.3mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "270.2mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "43.4mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "21"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs01", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "2mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "20mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "17.18817342425676mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "23.21720335428614mm"), Array("NAME:Pair", "Name:=", "Rs", _
  "Value:=", "5mm"), Array("NAME:Pair", "Name:=", "FilletType", "Value:=", _
  "0"), Array("NAME:Pair", "Name:=", "HalfSlot", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "30deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "134.5860034748603mm"), Array("NAME:Pair", _
  "Name:=", "InfoCore", "Value:=", "0"))), Array("NAME:Attributes", "Name:=", _
  "Stator", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "AK_3DSF0.950", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Stator:CreateUserDefinedPart:1", _
  "LenRegion", "43.4mm + 2*endRegion"
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "189.3mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "270.2mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "43.4mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "21"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs01", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "2mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "20mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "17.18817342425676mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "23.21720335428614mm"), Array("NAME:Pair", "Name:=", "Rs", _
  "Value:=", "5mm"), Array("NAME:Pair", "Name:=", "FilletType", "Value:=", _
  "0"), Array("NAME:Pair", "Name:=", "HalfSlot", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "30deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "134.5860034748603mm"), Array("NAME:Pair", _
  "Name:=", "InfoCore", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "StatorSlotInsu", "Flags:=", "", "Color:=", "(132 132 193)", _
  "Transparency:=", 0, "PartCoordinateSystem:=", "Global", "MaterialName:=", _
  "vacuum", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "StatorSlotInsu:CreateUserDefinedPart:1", "LenRegion", _
  "43.4mm + 2*endRegion"
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
  "0.020024902503769714ohm"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:Le1", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", _
  "0.00011149074919060378H"))))
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "189.3mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "270.2mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "43.4mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "21"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "20mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "5mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "17.18817342425676mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "23.21720335428614mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "134.5860034748603mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "1"))), Array("NAME:Attributes", "Name:=", "Coil_0", "Flags:=", _
  "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_0:CreateUserDefinedPart:1", _
  "LenRegion", "43.4mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_0"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "342.85714285714283deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "189.3mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "270.2mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "43.4mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "21"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "20mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "5mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "17.18817342425676mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "23.21720335428614mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "134.5860034748603mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "1"))), Array("NAME:Attributes", "Name:=", "Coil_1", "Flags:=", _
  "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_1:CreateUserDefinedPart:1", _
  "LenRegion", "43.4mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_1"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "17.142857142857142deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "189.3mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "270.2mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "43.4mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "21"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "20mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "5mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "17.18817342425676mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "23.21720335428614mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "2"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "134.5860034748603mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "1"))), Array("NAME:Attributes", "Name:=", "Coil_2", "Flags:=", _
  "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_2:CreateUserDefinedPart:1", _
  "LenRegion", "43.4mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_2"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "171.42857142857142deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "189.3mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "270.2mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "43.4mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "21"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "20mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "5mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "17.18817342425676mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "23.21720335428614mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "134.5860034748603mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "1"))), Array("NAME:Attributes", "Name:=", "Coil_3", "Flags:=", _
  "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_3:CreateUserDefinedPart:1", _
  "LenRegion", "43.4mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_3"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "102.85714285714286deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "189.3mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "270.2mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "43.4mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "21"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "20mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "5mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "17.18817342425676mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "23.21720335428614mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "134.5860034748603mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "1"))), Array("NAME:Attributes", "Name:=", "Coil_4", "Flags:=", _
  "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_4:CreateUserDefinedPart:1", _
  "LenRegion", "43.4mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_4"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "137.14285714285714deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "189.3mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "270.2mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "43.4mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "21"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "20mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "5mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "17.18817342425676mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "23.21720335428614mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "2"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "134.5860034748603mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "1"))), Array("NAME:Attributes", "Name:=", "Coil_5", "Flags:=", _
  "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_5:CreateUserDefinedPart:1", _
  "LenRegion", "43.4mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_5"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "291.42857142857144deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "189.3mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "270.2mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "43.4mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "21"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "20mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "5mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "17.18817342425676mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "23.21720335428614mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "134.5860034748603mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "1"))), Array("NAME:Attributes", "Name:=", "Coil_6", "Flags:=", _
  "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_6:CreateUserDefinedPart:1", _
  "LenRegion", "43.4mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_6"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "222.85714285714286deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "189.3mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "270.2mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "43.4mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "21"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "20mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "5mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "17.18817342425676mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "23.21720335428614mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "134.5860034748603mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "1"))), Array("NAME:Attributes", "Name:=", "Coil_7", "Flags:=", _
  "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_7:CreateUserDefinedPart:1", _
  "LenRegion", "43.4mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_7"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "257.14285714285711deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "189.3mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "270.2mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "43.4mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "21"), Array(_
  "NAME:Pair", "Name:=", "SlotType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "20mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "5mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "17.18817342425676mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "23.21720335428614mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "2"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "134.5860034748603mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "1"))), Array("NAME:Attributes", "Name:=", "Coil_8", "Flags:=", _
  "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_8:CreateUserDefinedPart:1", _
  "LenRegion", "43.4mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_8"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "51.428571428571431deg")
On Error Resume Next
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "StatorSlotInsu", _
  "Tool Parts:=", "Coil_0,Coil_1,Coil_2,Coil_3,Coil_4,Coil_5,Coil_6,Coil_7" & _
  ",Coil_8"), Array("NAME:SubtractParameters", "CoordinateSystemID:=", -1, _
  "KeepOriginals:=", true)
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "StatorSlotInsu", _
  "Tool Parts:=", "Stator"), Array("NAME:SubtractParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", true)
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/IPMCore", "Version:=", "19.0", "NoOfParameters:=", 16, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "188.1mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "43.4mm"), Array("NAME:Pair", "Name:=", "Poles", "Value:=", "22"), _
  Array("NAME:Pair", "Name:=", "PoleType", "Value:=", "2"), Array("NAME:Pair", _
  "Name:=", "D1", "Value:=", "186.1mm"), Array("NAME:Pair", "Name:=", "O1", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "O2", "Value:=", _
  "32.44347547418259mm"), Array("NAME:Pair", "Name:=", "B1", "Value:=", _
  "10mm"), Array("NAME:Pair", "Name:=", "Rib", "Value:=", "2mm"), Array(_
  "NAME:Pair", "Name:=", "HRib", "Value:=", "9.897144274634456mm"), Array(_
  "NAME:Pair", "Name:=", "DminMag", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "ThickMag", "Value:=", "10mm"), Array("NAME:Pair", "Name:=", _
  "WidthMag", "Value:=", "15mm"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "134.5860034748603mm"), Array("NAME:Pair", "Name:=", "InfoCore", _
  "Value:=", "0"))), Array("NAME:Attributes", "Name:=", "Rotor", "Flags:=", _
  "", "Color:=", "(132 132 193)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "M19_24G_3DSF0.950", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Rotor:CreateUserDefinedPart:1", _
  "LenRegion", "43.4mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Rotor"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "8.1818181818181817deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/IPMCore", "Version:=", "19.0", "NoOfParameters:=", 16, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "188.1mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "43.4mm"), Array("NAME:Pair", "Name:=", "Poles", "Value:=", "22"), _
  Array("NAME:Pair", "Name:=", "PoleType", "Value:=", "2"), Array("NAME:Pair", _
  "Name:=", "D1", "Value:=", "186.1mm"), Array("NAME:Pair", "Name:=", "O1", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "O2", "Value:=", _
  "32.44347547418259mm"), Array("NAME:Pair", "Name:=", "B1", "Value:=", _
  "10mm"), Array("NAME:Pair", "Name:=", "Rib", "Value:=", "2mm"), Array(_
  "NAME:Pair", "Name:=", "HRib", "Value:=", "9.897144274634456mm"), Array(_
  "NAME:Pair", "Name:=", "DminMag", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "ThickMag", "Value:=", "10mm"), Array("NAME:Pair", "Name:=", _
  "WidthMag", "Value:=", "15mm"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "134.5860034748603mm"), Array("NAME:Pair", "Name:=", "InfoCore", _
  "Value:=", "3"))), Array("NAME:Attributes", "Name:=", "Mag", "Flags:=", "", _
  "Color:=", "(0 255 128)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "NdFe35_3DSF1.000_X", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Mag:CreateUserDefinedPart:1", _
  "LenRegion", "43.4mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Mag"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "8.1818181818181817deg")
oEditor.DuplicateAroundAxis Array("NAME:Selections", "Selections:=", "Mag"), _
  Array("NAME:DuplicateAroundAxisParameters", "CoordinateSystemID:=", -1, _
  "CreateNewObjects:=", true, "WhichAxis:=", "Z", "AngleStr:=", _
  "16.363636363636363deg", "NumClones:=", "22"), Array("NAME:Options", _
  "DuplicateBoundaries:=", false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag"), Array(_
  "NAME:ChangedProps", Array("NAME:Name", "Value:=", "Mag_0"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.989821", "XAxisYvec:=", "0.142315", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.142315", "YAxisYvec:=", "0.989821", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_0")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_0"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_0"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_1"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "NdFe35_3DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.909632", "XAxisYvec:=", "-0.415415", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.415415", "YAxisYvec:=", "-0.909632", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_1")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_1"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_1"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.75575", "XAxisYvec:=", "0.654861", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.654861", "YAxisYvec:=", "0.75575", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_2")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_2"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_2"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_3"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "NdFe35_3DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.540641", "XAxisYvec:=", "-0.841254", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.841254", "YAxisYvec:=", "-0.540641", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_3")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_3"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_3"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.281733", "XAxisYvec:=", "0.959493", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.959493", "YAxisYvec:=", "0.281733", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_4")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_4"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_4"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_5"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "NdFe35_3DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-1.83697e-16", "XAxisYvec:=", "-1", "XAxisZvec:=", "0", _
  "YAxisXvec:=", "1", "YAxisYvec:=", "-2.44929e-16", "YAxisZvec:=", "0"), _
  Array("NAME:Attributes", "Name:=", "relativeCS_5")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_5"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_5"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.281733", "XAxisYvec:=", "0.959493", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.959493", "YAxisYvec:=", "-0.281733", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_6")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_6"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_6"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_7"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "NdFe35_3DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.540641", "XAxisYvec:=", "-0.841254", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.841254", "YAxisYvec:=", "0.540641", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_7")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_7"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_7"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.75575", "XAxisYvec:=", "0.654861", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.654861", "YAxisYvec:=", "-0.75575", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_8")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_8"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_8"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_9"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "NdFe35_3DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.909632", "XAxisYvec:=", "-0.415415", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.415415", "YAxisYvec:=", "0.909632", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_9")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_9"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_9"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.989821", "XAxisYvec:=", "0.142315", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.142315", "YAxisYvec:=", "-0.989821", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_10")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_10"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_10"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_11"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "NdFe35_3DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.989821", "XAxisYvec:=", "0.142315", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.142315", "YAxisYvec:=", "0.989821", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_11")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_11"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_11"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.909632", "XAxisYvec:=", "-0.415415", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.415415", "YAxisYvec:=", "-0.909632", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_12")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_12"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_12"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_13"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "NdFe35_3DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.75575", "XAxisYvec:=", "0.654861", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.654861", "YAxisYvec:=", "0.75575", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_13")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_13"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_13"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.540641", "XAxisYvec:=", "-0.841254", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.841254", "YAxisYvec:=", "-0.540641", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_14")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_14"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_14"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_15"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "NdFe35_3DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.281733", "XAxisYvec:=", "0.959493", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.959493", "YAxisYvec:=", "0.281733", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_15")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_15"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_15"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-1.83697e-16", "XAxisYvec:=", "-1", "XAxisZvec:=", "0", _
  "YAxisXvec:=", "1", "YAxisYvec:=", "-2.44929e-16", "YAxisZvec:=", "0"), _
  Array("NAME:Attributes", "Name:=", "relativeCS_16")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_16"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_16"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_17"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "NdFe35_3DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.281733", "XAxisYvec:=", "0.959493", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.959493", "YAxisYvec:=", "-0.281733", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_17")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_17"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_17"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.540641", "XAxisYvec:=", "-0.841254", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.841254", "YAxisYvec:=", "0.540641", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_18")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_18"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_18"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_19"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "NdFe35_3DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.75575", "XAxisYvec:=", "0.654861", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.654861", "YAxisYvec:=", "-0.75575", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_19")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_19"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_19"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.909632", "XAxisYvec:=", "-0.415415", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "0.415415", "YAxisYvec:=", "0.909632", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_20")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_20"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_20"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_21"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "NdFe35_3DSF1.000_X"))))
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.989821", "XAxisYvec:=", "0.142315", "XAxisZvec:=", _
  "0", "YAxisXvec:=", "-0.142315", "YAxisYvec:=", "-0.989821", "YAxisZvec:=", _
  "0"), Array("NAME:Attributes", "Name:=", "relativeCS_21")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_21"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS_21"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "OuterRegion"), _
  Array("NAME:ChangedProps", Array("NAME:Transparent", "Value:=", 0.75))))
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "Shaft,Stator,Coil_0" & _
  ",Coil_1,Coil_2,Coil_3,Coil_4,Coil_5,Coil_6,Coil_7,Coil_8,Rotor,Mag_0" & _
  ",Mag_1,Mag_2,Mag_3,Mag_4,Mag_5,Mag_6,Mag_7,Mag_8,Mag_9,Mag_10,Mag_11" & _
  ",Mag_12,Mag_13,Mag_14,Mag_15,Mag_16,Mag_17,Mag_18,Mag_19,Mag_20,Mag_21", _
  "Tool Parts:=", "Tool"), Array("NAME:SubtractParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", false)
oEditor.FitAll
Set oModule = oDesign.GetModule("AnalysisSetup")
oModule.InsertSetup "Transient", Array("NAME:Setup1", "StopTime:=", "0.02s", _
  "TimeStep:=", "2e-05s")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.SetMinimumTimeStep "0.0002ms" 
set oUnclassified = oEditor.GetObjectsInGroup("Unclassified")
Dim oObject
For Each oObject in oUnclassified
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", oObject), Array(_
  "NAME:ChangedProps", Array("NAME:Model", "Value:=", false))))
Next
