M291 P"Is the bed heated and printer heat soaked?" S3    ; One last chance to cancel
M561                                                     ; ignore current heightmap
G32                                                      ; Level the gantry while everything is hot
G28 Z                                                    ; Home Z to switch to the induction probe and establish Z=0 for it
G29                                                      ; Probe a new bed mesh
M98 P"/macros/print_scripts/do_z_switch_probe.g"         ; Restore Z=0 to the proper reference
