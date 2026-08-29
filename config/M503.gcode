; Linear Units:
;  G21 ; (mm)
; Auto Temp Control:
;  M104 S235 B250 F0.00
; Temperature Units:
;  M149 C ; Units in Celsius
; Filament settings (Disabled):
;  M200 S0
;  M200 T0 D1.75
;  M200 T1 D1.75
; Steps per unit:
  M92 X80.00 Y80.00 Z400.00 E133.00
; Max feedrates (units/s):
;  M203 X500.00 Y300.00 Z20.00 E70.00
; Max Acceleration (units/s2):
;  M201 X1000.00 Y1000.00 Z100.00 E1000.00
; Acceleration (units/s2) (P<print-accel> R<retract-accel> T<travel-accel>):
;  M204 P500.00 R1000.00 T500.00
; Advanced (B<min_segment_time_us> S<min_feedrate> T<min_travel_feedrate> J<junc_dev>):
;  M205 B20000.00 S0.00 T0.00 J0.01
; Home offset:
;  M206 X0.00 Y0.00 Z0.00
; Hotend offsets:
;  M218 T1 X18.00 Y0.00 Z0.000
; Unified Bed Leveling:
;  M420 S0 Z10.00 ; Leveling OFF
;Unified Bed Leveling System v1.01 inactive
;Active Mesh Slot 0
;EEPROM can hold 31 meshes.
; X-Twist Correction:
  M423 A44.00 I81.50
  M423 X0 Z-0.02
  M423 X1 Z-0.03
  M423 X2 Z+0.05
; Material heatup parameters:
  M145 S0 H180.00 B70.00 F0
  M145 S1 H240.00 B80.00 F0
; Hotend PID:
  M301 E0 P10.30 I0.51 D52.11
  M301 E1 P10.68 I0.51 D56.41
; Z-Probe Offset:
  M851 X62.00 Y5.01 Z-3.05 ; (mm)
; Stepper driver current:
;  M906 X800 Y800 Z800
;  M906 T0 E800
;  M906 T1 E800
; Driver stepping mode:
;  M569 S1 X Y Z
;  M569 S1 T0 E
;  M569 S1 T1 E
; Filament load/unload:
;  M603 T0 L420.00 U440.00 ; (mm)
;  M603 T1 L420.00 U440.00 ; (mm)
; Tool-changing:
;  M217 Z10.00
; Filament runout sensor:
;  M412 S1 ; Sensor ON

;------------- 
; SAVE 
;-------------
M500
