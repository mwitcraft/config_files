; # - WIN
; ^ - Ctrl
; ! - Alt
; + - Shift


;-------------- Remap keys --------------
SetCapsLockState, AlwaysOff ; Disables CapsLock
SetNumLockState, AlwaysOn
LAlt::Esc
;-------------- Remap keys --------------

; Open Windows search
CapsLock & r::#s

; Switch workspaces
CapsLock & h::#^Left
CapsLock & l::#^Right
XButton2::#^Right
XButton1::#^Left

; Mouse middle button open task view
MButton::#Tab

; Close active window
CapsLock & q::!F4

; Open snip and share
CapsLock & s::#+s

; Open bluetooth connections
CapsLock & k::#k

; Show app switcher
CapsLock & Space:: Send, {CTRLDOWN}{ALTDOWN}{TAB}{ALTUP}{CTRLUP}
^+F1:: Send, {CTRLDOWN}{ALTDOWN}{TAB}{ALTUP}{CTRLUP}
^+F2:: Send, {CTRLDOWN}{ALTDOWN}{TAB}{ALTUP}{CTRLUP}
#If WinActive("ahk_class MultitaskingViewFrame")
	l:: Send, {Right}
    h:: Send, {Left}
    Space:: Send, {Enter}
#If