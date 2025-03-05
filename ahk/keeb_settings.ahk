; Notes
; # = Win
; ^ = Ctrl
; ! = Alt
; + = Shift

SetCapsLockState "AlwaysOff" ; Disable CapsLock

CapsLock & A:: Reload

CapsLock & L:: Send "#^{Right}"       ; Desktop right
CapsLock & H:: Send "#^{Left}"        ; Desktop left
CapsLock & Q:: Send "!{F4}"           ; Close window
CapsLock & R:: Send "!+R"             ; Windows Search
CapsLock & S:: Send "{PrintScreen}"   ; Print Screen
CapsLock & T:: Send "#2"              ; Opens 2nd task bar item (terminal)
CapsLock & Space:: Send "^!{Tab}"     ; Task Switcher