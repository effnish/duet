; homex.g
; called to home the X axis

M564 H0                                           ; Allow movements without homing
M98 P"/macros/print_scripts/set_travel_limits.g"  ; Allow travel off of the bed

M98 P"/macros/print_scripts/z_current_low.g"
G91                                               ; relative positioning
G1 H2 Z5 F6000                                    ; lift Z relative to current position
G90                                               ; absolute positioning
M98 P"/macros/print_scripts/z_current_high.g"

M98 P"/macros/print_scripts/xy_current_low.g"
G1 H1 X300 F1800                                  ; move quickly to X axis endstop and stop there (first pass)
G91                                               ; relative positioning
G1 X-5 F6000                                      ; go back a few mm
G90                                               ; absolute positioning
G1 H1 X250 F360                                   ; move slowly to X axis endstop once more (second pass)

M98 P"/macros/print_scripts/xy_current_high.g"
M98 P"/macros/print_scripts/set_bed_limits.g"     ; Restrict travel to within the bed limits
M564 S1 H1                                        ; Homing done enforce limits

; M208 X238 S0     ; set axis maxima to max endstop
; G91              ; relative positioning
; G1 H2 Z5 F6000   ; lift Z relative to current position
; G1 H1 X250 F1800 ; move quickly to X axis endstop and stop there (first pass)
; G1 X-5 F6000     ; go back a few mm
; G1 H1 X240 F360  ; move slowly to X axis endstop once more (second pass)
; G1 H2 Z-5 F6000  ; lower Z again
; G90              ; absolute positioning
; 
; M208 X224 S0     ; update the x-axis maximum to bed limit
