; homey.g
; called to home the Y axis

M564 H0                                           ; Allow movements without homing
M98 P"/macros/print_scripts/set_travel_limits.g"  ; Allow travel off of the bed

M98 P"/macros/print_scripts/z_current_low.g"
G91                                               ; relative positioning
G1 H2 Z5 F6000                                    ; lift Z relative to current position
G90                                               ; absolute positioning
M98 P"/macros/print_scripts/z_current_high.g"

M98 P"/macros/print_scripts/xy_current_low.g"
G1 H1 Y300 F1800                                  ; move quickly to Y axis endstop and stop there (first pass)
G91                                               ; relative positioning
G1 Y-5 F6000                                      ; go back a few mm
G90                                               ; absolute positioning
G1 H1 Y250 F360                                   ; move slowly to Y axis endstop once more (second pass)

M98 P"/macros/print_scripts/xy_current_high.g"
M98 P"/macros/print_scripts/set_bed_limits.g"     ; Restrict travel to within the bed limits
M564 S1 H1                                        ; Homing done enforce limits

; M208 Y228 S0     ; set axis maxima to max endstop
; G91              ; relative positioning
; G1 H2 Z5 F6000   ; lift Z relative to current position
; G1 H1 Y250 F1800 ; move quickly to Y axis endstop and stop there (first pass)
; G1 Y-5 F6000     ; go back a few mm
; G1 H1 Y240 F360  ; move slowly to Y axis endstop once more (second pass)
; G1 H2 Z-5 F6000  ; lower Z again
; G90              ; absolute positioning
; 
; M208 Y208 S0     ; update the y-axis maximum to bed limit
