M83                         ; set extruder to relative mode
G21                         ; set units to mm
T0                          ; select tool 0
G92 E0.0                    ; reset extruder position
M220 S100                   ; reset speed multiplier
G32                         ; level the gantry while everything is hot
M592 D0 A-0.004522 B0.00160 ; non-linear extrusion
M572 S0.030                 ; Set pressure advance

   
M98 P"/macros/print_scripts/do_nozzle_wipe.g"
