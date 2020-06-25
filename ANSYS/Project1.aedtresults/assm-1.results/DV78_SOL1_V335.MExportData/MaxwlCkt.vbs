' -------------------------------------------------------------------------------  
' Script Created by RMxprt Version 2016.0 to generate netlist for external circuit 
' Expect 3 args, first the project name,                                           
'                second the design name,                                           
'                third the path to export netlist                                  
' ---------------------------------------------------------------------------------
Dim oAnsoftApp
Dim oDesktop
Dim oProject
Dim oDesign
Dim oEditor
Dim oModule
On Error Resume Next
Set oAnsoftApp = CreateObject("Ansoft.ElectronicsDesktop")
On Error Goto 0
Set oArgs = AnsoftScript.arguments
Set oDesktop = oAnsoftApp.GetAppDesktop()
Set oProject = oDesktop.GetActiveProject
if (oArgs.Count > 0) then 
  oProject.InsertDesign "Maxwell Circuit", oArgs(0), "", ""
else
  oProject.InsertDesign "Maxwell Circuit", "", "", ""
end if
Set oDesign = oProject.GetActiveDesign()
Set oEditor = oDesign.SetActiveEditor("SchematicEditor")
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:Kle", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", "1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Winding", _
  "Id:=", "637"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.15748, "Y:=", _
  0.01016, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Winding;637;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "PhaseA"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.16256, 0.01016)", "(0.1651, 0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Winding", _
  "Id:=", "644"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.15748, "Y:=", _
  0, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Winding;644;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "PhaseB"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.16256, 0)", "(0.1651, 0)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Winding", _
  "Id:=", "651"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.15748, "Y:=", _
  -0.01016, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Winding;651;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "PhaseC"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.16256, -0.01016)", "(0.1651, -0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Res", "Id:=", _
  "658"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.14478, "Y:=", _
  0.01016, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Res;658;0"), Array("NAME:ChangedProps", _
  Array("NAME:name", "OverridingDef:=", true, "Value:=", "A"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Res;658;0"), Array("NAME:ChangedProps", _
  Array("NAME:R", "OverridingDef:=", true, "Value:=", "0.00878017ohm"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.14986, 0.01016)", "(0.1524, 0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Res", "Id:=", _
  "665"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.14478, "Y:=", 0, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Res;665;0"), Array("NAME:ChangedProps", _
  Array("NAME:name", "OverridingDef:=", true, "Value:=", "B"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Res;665;0"), Array("NAME:ChangedProps", _
  Array("NAME:R", "OverridingDef:=", true, "Value:=", "0.00878017ohm"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.14986, 0)", "(0.1524, 0)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Res", "Id:=", _
  "672"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.14478, "Y:=", _
  -0.01016, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Res;672;0"), Array("NAME:ChangedProps", _
  Array("NAME:name", "OverridingDef:=", true, "Value:=", "C"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Res;672;0"), Array("NAME:ChangedProps", _
  Array("NAME:R", "OverridingDef:=", true, "Value:=", "0.00878017ohm"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.14986, -0.01016)", "(0.1524, -0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Ind", "Id:=", _
  "679"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.13208, "Y:=", _
  0.01016, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Ind;679;0"), Array("NAME:ChangedProps", _
  Array("NAME:name", "OverridingDef:=", true, "Value:=", "A"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Ind;679;0"), Array("NAME:ChangedProps", _
  Array("NAME:L", "OverridingDef:=", true, "Value:=", "2.79676e-06H*Kle"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.13716, 0.01016)", "(0.1397, 0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Ind", "Id:=", _
  "686"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.13208, "Y:=", 0, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Ind;686;0"), Array("NAME:ChangedProps", _
  Array("NAME:name", "OverridingDef:=", true, "Value:=", "B"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Ind;686;0"), Array("NAME:ChangedProps", _
  Array("NAME:L", "OverridingDef:=", true, "Value:=", "2.79676e-06H*Kle"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.13716, 0)", "(0.1397, 0)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Ind", "Id:=", _
  "693"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.13208, "Y:=", _
  -0.01016, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Ind;693;0"), Array("NAME:ChangedProps", _
  Array("NAME:name", "OverridingDef:=", true, "Value:=", "C"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Ind;693;0"), Array("NAME:ChangedProps", _
  Array("NAME:L", "OverridingDef:=", true, "Value:=", "2.79676e-06H*Kle"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.13716, -0.01016)", "(0.1397, -0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Ammeter", _
  "Id:=", "700"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.11938, "Y:=", _
  0.01016, "Degrees:=", 90, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Ammeter;700;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "IA"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.12446, 0.01016)", "(0.127, 0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Ammeter", _
  "Id:=", "707"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.11938, "Y:=", _
  0, "Degrees:=", 90, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Ammeter;707;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "IB"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.12446, 0)", "(0.127, 0)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Ammeter", _
  "Id:=", "714"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.11938, "Y:=", _
  -0.01016, "Degrees:=", 90, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Ammeter;714;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "IC"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.12446, -0.01016)", "(0.127, -0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1651, 0.01016)", "(0.1651, 0)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1651, 0)", "(0.1651, -0.01016)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1016, -0.0508)", "(0.1016, -0.04826)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VPWM", "Id:=", _
  "721"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.1016, "Y:=", _
  -0.04318, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPWM;721;0"), Array("NAME:ChangedProps", _
  Array("NAME:name", "OverridingDef:=", true, "Value:=", "VPWM1"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPWM;721;0"), Array("NAME:ChangedProps", _
  Array("NAME:ModuIndex", "OverridingDef:=", true, "Value:=", "0.8"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPWM;721;0"), Array("NAME:ChangedProps", _
  Array("NAME:FreqTimes", "OverridingDef:=", true, "Value:=", "60"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPWM;721;0"), Array("NAME:ChangedProps", _
  Array("NAME:VFreq", "OverridingDef:=", true, "Value:=", "495"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPWM;721;0"), Array("NAME:ChangedProps", _
  Array("NAME:Phase", "OverridingDef:=", true, "Value:=", "267deg"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1143, -0.0508)", "(0.1143, -0.04826)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VPWM", "Id:=", _
  "728"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.1143, "Y:=", _
  -0.04318, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPWM;728;0"), Array("NAME:ChangedProps", _
  Array("NAME:name", "OverridingDef:=", true, "Value:=", "VPWM2"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPWM;728;0"), Array("NAME:ChangedProps", _
  Array("NAME:ModuIndex", "OverridingDef:=", true, "Value:=", "0.8"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPWM;728;0"), Array("NAME:ChangedProps", _
  Array("NAME:FreqTimes", "OverridingDef:=", true, "Value:=", "60"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPWM;728;0"), Array("NAME:ChangedProps", _
  Array("NAME:VFreq", "OverridingDef:=", true, "Value:=", "495"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPWM;728;0"), Array("NAME:ChangedProps", _
  Array("NAME:Phase", "OverridingDef:=", true, "Value:=", "27deg"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.127, -0.0508)", "(0.127, -0.04826)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VPWM", "Id:=", _
  "735"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.127, "Y:=", -0.04318, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPWM;735;0"), Array("NAME:ChangedProps", _
  Array("NAME:name", "OverridingDef:=", true, "Value:=", "VPWM3"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPWM;735;0"), Array("NAME:ChangedProps", _
  Array("NAME:ModuIndex", "OverridingDef:=", true, "Value:=", "0.8"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPWM;735;0"), Array("NAME:ChangedProps", _
  Array("NAME:FreqTimes", "OverridingDef:=", true, "Value:=", "60"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPWM;735;0"), Array("NAME:ChangedProps", _
  Array("NAME:VFreq", "OverridingDef:=", true, "Value:=", "495"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VPWM;735;0"), Array("NAME:ChangedProps", _
  Array("NAME:Phase", "OverridingDef:=", true, "Value:=", "147deg"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1016, -0.0381)", "(0.1016, -0.03556)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Res", "Id:=", _
  "742"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.1016, "Y:=", _
  -0.03048, "Degrees:=", 90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1143, -0.0381)", "(0.1143, -0.03556)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Res", "Id:=", _
  "749"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.1143, "Y:=", _
  -0.03048, "Degrees:=", 90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.127, -0.0381)", "(0.127, -0.03556)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Res", "Id:=", _
  "756"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.127, "Y:=", -0.03048, _
  "Degrees:=", 90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1016, -0.0254)", "(0.1016, -0.02286)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VoltmeterG", _
  "Id:=", "763"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.09652, "Y:=", _
  -0.03556, "Degrees:=", 90, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VoltmeterG;763;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "Vc1"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1143, -0.0254)", "(0.1143, -0.02286)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VoltmeterG", _
  "Id:=", "770"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.10922, "Y:=", _
  -0.03556, "Degrees:=", 90, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VoltmeterG;770;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "Vc2"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.127, -0.0254)", "(0.127, -0.02286)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VoltmeterG", _
  "Id:=", "777"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.12192, "Y:=", _
  -0.03556, "Degrees:=", 90, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VoltmeterG;777;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "Vc3"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1016, -0.0508)", "(0.1397, -0.0508)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.1397, -0.0508)", "(0.1397, -0.02286)", "(0.1016, -0.02286)")), Array(_
  "NAME:Attributes", "Page:=", 1) 
oEditor.CreateGround Array("NAME:GroundProps", "Id:=", "630"), Array(_
  "NAME:Attributes", "Page:=", 1, "X:=", 0.1397, "Y:=", -0.05334, "Degrees:=", _
  0, "Flip:=", false) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VDC", "Id:=", _
  "784"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0, "Y:=", 0.0127, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VDC;784;0"), Array("NAME:ChangedProps", _
  Array("NAME:V", "OverridingDef:=", true, "Value:=", "110V"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VDC", "Id:=", _
  "791"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0, "Y:=", -0.0127, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VDC;791;0"), Array("NAME:ChangedProps", _
  Array("NAME:V", "OverridingDef:=", true, "Value:=", "110V"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0, 0.01778)", "(0, 0.0508)", "(0.0889, 0.0508)")), Array(_
  "NAME:Attributes", "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0, 0.00762)", "(0, -0.00762)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0, -0.01778)", "(0, -0.0508)", "(0.0889, -0.0508)")), Array(_
  "NAME:Attributes", "Page:=", 1) 
oEditor.CreateGround Array("NAME:GroundProps", "Id:=", "630"), Array(_
  "NAME:Attributes", "Page:=", 1, "X:=", -0.00508, "Y:=", -0.00254, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0, 0)", "(-0.00508, 0)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "DIODE", "Id:=", _
  "798"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0254, "Y:=", _
  -0.03048, "Degrees:=", 90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0254, -0.0254)", "(0.0254, 0.0254)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE;798;0"), Array(_
  "NAME:ChangedProps", Array("NAME:MOD", "OverridingDef:=", true, "Value:=", _
  "DModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "DIODE", "Id:=", _
  "805"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0381, "Y:=", 0.03048, _
  "Degrees:=", 90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0381, 0.03556)", "(0.0381, 0.0508)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE;805;0"), Array(_
  "NAME:ChangedProps", Array("NAME:MOD", "OverridingDef:=", true, "Value:=", _
  "DModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "DIODE", "Id:=", _
  "812"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0508, "Y:=", _
  -0.03048, "Degrees:=", 90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0508, -0.0254)", "(0.0508, 0.0254)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE;812;0"), Array(_
  "NAME:ChangedProps", Array("NAME:MOD", "OverridingDef:=", true, "Value:=", _
  "DModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "DIODE", "Id:=", _
  "819"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0635, "Y:=", 0.03048, _
  "Degrees:=", 90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0635, 0.03556)", "(0.0635, 0.0508)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE;819;0"), Array(_
  "NAME:ChangedProps", Array("NAME:MOD", "OverridingDef:=", true, "Value:=", _
  "DModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "DIODE", "Id:=", _
  "826"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0762, "Y:=", _
  -0.03048, "Degrees:=", 90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0762, -0.0254)", "(0.0762, 0.0254)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE;826;0"), Array(_
  "NAME:ChangedProps", Array("NAME:MOD", "OverridingDef:=", true, "Value:=", _
  "DModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "DIODE", "Id:=", _
  "833"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0889, "Y:=", 0.03048, _
  "Degrees:=", 90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0889, 0.03556)", "(0.0889, 0.0508)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE;833;0"), Array(_
  "NAME:ChangedProps", Array("NAME:MOD", "OverridingDef:=", true, "Value:=", _
  "DModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "DIODE", "Id:=", _
  "840"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0254, "Y:=", 0.04318, _
  "Degrees:=", -90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0254, 0.04826)", "(0.0254, 0.0508)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE;840;0"), Array(_
  "NAME:ChangedProps", Array("NAME:MOD", "OverridingDef:=", true, "Value:=", _
  "DModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "DIODE", "Id:=", _
  "847"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0381, "Y:=", _
  -0.01778, "Degrees:=", -90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0381, -0.0127)", "(0.0381, 0.0254)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE;847;0"), Array(_
  "NAME:ChangedProps", Array("NAME:MOD", "OverridingDef:=", true, "Value:=", _
  "DModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "DIODE", "Id:=", _
  "854"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0508, "Y:=", 0.04318, _
  "Degrees:=", -90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0508, 0.04826)", "(0.0508, 0.0508)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE;854;0"), Array(_
  "NAME:ChangedProps", Array("NAME:MOD", "OverridingDef:=", true, "Value:=", _
  "DModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "DIODE", "Id:=", _
  "861"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0635, "Y:=", _
  -0.01778, "Degrees:=", -90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0635, -0.0127)", "(0.0635, 0.0254)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE;861;0"), Array(_
  "NAME:ChangedProps", Array("NAME:MOD", "OverridingDef:=", true, "Value:=", _
  "DModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "DIODE", "Id:=", _
  "868"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0762, "Y:=", 0.04318, _
  "Degrees:=", -90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0762, 0.04826)", "(0.0762, 0.0508)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE;868;0"), Array(_
  "NAME:ChangedProps", Array("NAME:MOD", "OverridingDef:=", true, "Value:=", _
  "DModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "DIODE", "Id:=", _
  "875"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0889, "Y:=", _
  -0.01778, "Degrees:=", -90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0889, -0.0127)", "(0.0889, 0.0254)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE;875;0"), Array(_
  "NAME:ChangedProps", Array("NAME:MOD", "OverridingDef:=", true, "Value:=", _
  "DModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "SW_V", "Id:=", _
  "882"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0254, "Y:=", 0.03048, _
  "Degrees:=", -90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0254, 0.03556)", "(0.0254, 0.0381)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_V;882;0"), Array("NAME:ChangedProps", _
  Array("NAME:ID_V", "OverridingDef:=", true, "Value:=", "IVc1"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_V;882;0"), Array("NAME:ChangedProps", _
  Array("NAME:MOD", "OverridingDef:=", true, "Value:=", "SModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "SW_V", "Id:=", _
  "889"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0381, "Y:=", _
  -0.03048, "Degrees:=", -90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0381, -0.0254)", "(0.0381, -0.02286)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_V;889;0"), Array("NAME:ChangedProps", _
  Array("NAME:CP", "OverridingDef:=", true, "Value:=", "NEG"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_V;889;0"), Array("NAME:ChangedProps", _
  Array("NAME:ID_V", "OverridingDef:=", true, "Value:=", "IVc1"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_V;889;0"), Array("NAME:ChangedProps", _
  Array("NAME:MOD", "OverridingDef:=", true, "Value:=", "SModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "SW_V", "Id:=", _
  "896"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0508, "Y:=", 0.03048, _
  "Degrees:=", -90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0508, 0.03556)", "(0.0508, 0.0381)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_V;896;0"), Array("NAME:ChangedProps", _
  Array("NAME:ID_V", "OverridingDef:=", true, "Value:=", "IVc2"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_V;896;0"), Array("NAME:ChangedProps", _
  Array("NAME:MOD", "OverridingDef:=", true, "Value:=", "SModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "SW_V", "Id:=", _
  "903"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0635, "Y:=", _
  -0.03048, "Degrees:=", -90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0635, -0.0254)", "(0.0635, -0.02286)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_V;903;0"), Array("NAME:ChangedProps", _
  Array("NAME:CP", "OverridingDef:=", true, "Value:=", "NEG"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_V;903;0"), Array("NAME:ChangedProps", _
  Array("NAME:ID_V", "OverridingDef:=", true, "Value:=", "IVc2"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_V;903;0"), Array("NAME:ChangedProps", _
  Array("NAME:MOD", "OverridingDef:=", true, "Value:=", "SModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "SW_V", "Id:=", _
  "910"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0762, "Y:=", 0.03048, _
  "Degrees:=", -90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0762, 0.03556)", "(0.0762, 0.0381)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_V;910;0"), Array("NAME:ChangedProps", _
  Array("NAME:ID_V", "OverridingDef:=", true, "Value:=", "IVc3"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_V;910;0"), Array("NAME:ChangedProps", _
  Array("NAME:MOD", "OverridingDef:=", true, "Value:=", "SModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "SW_V", "Id:=", _
  "917"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0889, "Y:=", _
  -0.03048, "Degrees:=", -90, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0889, -0.0254)", "(0.0889, -0.02286)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_V;917;0"), Array("NAME:ChangedProps", _
  Array("NAME:CP", "OverridingDef:=", true, "Value:=", "NEG"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_V;917;0"), Array("NAME:ChangedProps", _
  Array("NAME:ID_V", "OverridingDef:=", true, "Value:=", "IVc3"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_V;917;0"), Array("NAME:ChangedProps", _
  Array("NAME:MOD", "OverridingDef:=", true, "Value:=", "SModel1"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0254, -0.0508)", "(0.0254, -0.03556)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0381, -0.0508)", "(0.0381, -0.03556)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0508, -0.0508)", "(0.0508, -0.03556)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0635, -0.0508)", "(0.0635, -0.03556)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0762, -0.0508)", "(0.0762, -0.03556)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0889, -0.0508)", "(0.0889, -0.03556)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0254, 0.00508)", "(0.0381, 0.00508)", "(0.11176, 0.00508)", _
  "(0.11176, 0.01016)", "(0.1143, 0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0508, 0)", "(0.0635, 0)", "(0.1143, 0)", "(0.1143, 0)", "(0.1143, 0)")), _
  Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0762, -0.00508)", "(0.0889, -0.00508)", "(0.1143, -0.00508)", _
  "(0.1143, -0.01016)", "(0.1143, -0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "DIODE_Model", _
  "Id:=", "924"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.1016, "Y:=", _
  0.04826, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE_Model;924;0"), Array(_
  "NAME:ChangedProps", Array("NAME:IS", "OverridingDef:=", true, "Value:=", _
  "0.002585A"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@DIODE_Model;924;0"), Array(_
  "NAME:ChangedProps", Array("NAME:DeviceName", "OverridingDef:=", true, _
  "Value:=", "DModel1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "SW_VModel", _
  "Id:=", "931"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.1143, "Y:=", _
  0.04826, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_VModel;931;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Von", "OverridingDef:=", true, "Value:=", _
  "0.0 V"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_VModel;931;0"), Array(_
  "NAME:ChangedProps", Array("NAME:Voff", "OverridingDef:=", true, "Value:=", _
  "0.0 V"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@SW_VModel;931;0"), Array(_
  "NAME:ChangedProps", Array("NAME:DeviceName", "OverridingDef:=", true, _
  "Value:=", "SModel1"))))
if (oArgs.Count > 0) then 
  oProject.SetActiveDesign oArgs(0)
end if
oEditor.ZoomToFit
if (oArgs.Count > 1) then 
  oDesign.ExportNetList "", oArgs(1)
end if
