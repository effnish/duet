; Select mechanical plunger switch

; P4 C2:    connected to Z endstop SIG and GND
; I0:       Switch is wired NC
; T18000:   Move to probe points at 300mm/s
; F120:     Probing Speed: 2mm/s
; H5:       Dive height: 5mm
; A5 S0.01: Perform up to 5 touches until change is below 0.01mm
; B1:       Turn off heaters while probing

M400                                             ; wait for current moves to finish
M558 P5 C"zstop" I0 H5 F120 T3000 A5 S0.01 R0.2  ; declare the z-probe on the z-endstop dive 5mm at 120 mm/min travel at 3000 mm/min probe max 5 tries for 0.01mm accuracy
G31 P500 X0 Y0 Z-0.85                            ; Set parameters for z switch (if positive, greater value = lower nozzle. if negative, more negative = higher nozzle)
G4 P200                                          ; Delay 200ms
