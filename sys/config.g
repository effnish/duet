; Configuration file for Duet WiFi (firmware version 4)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v2.1.8 on Fri May 15 2020 21:38:33 GMT-0600 (Mountain Daylight Time)

; General preferences
G90                                            ; send absolute coordinates...
M83                                            ; ...but relative extruder moves
M550 P"Voron"                                  ; set printer name

M667 S1                                        ; select CoreXY mode

; Network
M552 S1                                        ; enable network
M586 P0 S1                                     ; enable HTTP
M586 P1 S0                                     ; disable FTP
M586 P2 S0                                     ; disable Telnet

; Drives
M569 P0 S1                                     ; physical drive 0 goes forwards
M569 P1 S1                                     ; physical drive 1 goes forwards
M569 P2 S1                                     ; physical drive 2 goes forwards
M569 P3 S1                                     ; physical drive 3 goes forwards
M584 X0 Y1 Z2:3 E4                             ; set drive mapping
M671 X-53:274 Y112:112 S0.5                    ; leadscrews at left (connected to Z) and right
M350 X16 Y16 Z16 E16 I1                        ; configure microstepping with interpolation
; M92 X80.00 Y80.00 Z400.00 E461.00            ; set steps per mm bondtech XR
M92 X80.00 Y80.00 Z400.00 E420.00              ; set steps per mm afterburner
M566 X740.00 Y720.00 Z25.00 E6000.00           ; set maximum instantaneous speed changes (mm/min)
M203 X18000.00 Y18000.00 Z300.00 E12000.00     ; set maximum speeds (mm/min)
M201 X2800.00 Y2800.00 Z250.00 E3000.00        ; set accelerations (mm/s^2)
M204 P2400 T2800                               ; Set printing acceleration and travel accelerations
M906 X1000 Y1000 Z400 E650 I30                 ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                        ; Set idle timeout
M569 P2:3 F3:3                                 ; Set CHOPCON register to reduce stand-still noise on z-axis

; Axis Limits
M208 X0 Y0 Z0 S1                               ; set axis minima
M208 X238 Y222 Z230 S0                         ; set axis maxima

; Endstops
M574 X2 S1 P"xstop"                            ; configure active-high endstop for high end on X via pin xstop
M574 Y2 S1 P"ystop"                            ; configure active-high endstop for high end on Y via pin ystop
M574 Z0 S1                                     ; Disable the z-endstop we have multiple

; Z-Probe
M98 P"/macros/print_scripts/activate_z_probe.g";              ; Select the inductive probe on power up

;M558 P1 C"zprobe.in+zprobe.mod" H5 F100 T12000 A1 S0.01      ; set Z probe type to unmodulated and the dive height + speeds
;G31 P600 X0 Y23.7 Z3.55                                      ; set Z probe trigger value, offset and trigger height
;M557 X6:214 Y24:178 S68:61                                   ; define mesh grid
M557 X6:214 Y26:180 S52:38                                    ; define 4x4 mesh grid

; Heaters
M308 S0 P"bedtemp" Y"thermistor" T100000 B4092 C0 R4700      ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bedheat" T0                                          ; create bed heater output on bedheat and map it to sensor 0
M143 H0 S115                                                 ; set temperature limit for heater 0 to 115C
M307 H0 B0 S1.00                                             ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                                      ; map heated bed to heater 0
M308 S1 P"e1temp" Y"thermistor" T100000 B4725 C7.06e-8 R4700 ; configure sensor 1 as thermistor on pin e0temp
M950 H1 C"e1heat" T1                                         ; create nozzle heater output on e0heat and map it to sensor 1
M143 H1 S280                                                 ; set temperature limit for heater 1 to 280C
M307 H1 B0 S1.00                                             ; disable bang-bang mode for heater  and set PWM limit

; Fans
M950 F0 C"fan0" Q150                           ; create fan 0 on pin fan0 and set its frequency
M106 P0 C"part" S0 H-1                         ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"fan1" Q250                           ; create fan 1 on pin fan1 and set its frequency
M106 P1 S1.0 H1 T45                            ; set fan 1 value. Thermostatic control is turned on
M950 F2 C"fan2"                                ; create fan 2 on pin fan2 and set its frequency
M106 P2 C"exhaust" S0 H-1                      ; set fan 2 value. Thermostatic control is turned off

; Tools
M563 P0 D0 H1 F0                               ; define tool 0
G10 P0 X0 Y0 Z0                                ; set tool 0 axis offsets
G10 P0 R0 S0                                   ; set initial tool 0 active and standby temperatures to 0C

; Custom settings are not defined
;M671 X91:2:200 Y-33:148:148

M501                                           ; Load stored config in config-override.g
