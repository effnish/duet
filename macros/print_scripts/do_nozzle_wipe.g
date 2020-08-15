G0 X200 Y220 F4000     ; Move over the bed
G1 Z0.3                ; Set layer height
G1 X200 Y120 E12 F4000 ; Prime extruder
G92 E0                 ; Zero the extruder
M83                    ; Set relative extrusion
