M566 X900 Y900 Z25 E6000        ; Set maximum instantaneous speed changes (mm/min)
M203 X18000 Y18000 Z300 E12000  ; Set maximum speeds (mm/min)
M201 X2800 Y2800 Z250 E2000     ; Set maximum accelerations (mm/s^2) 
M204 P7000 T7000                ; Set printing acceleration and travel accelerations
M593 F43.0                      ; Set dynamic automatic acceleration to reduce ringing
