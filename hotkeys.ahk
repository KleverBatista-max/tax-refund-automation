; #SingleInstance, Force
; SendMode Input
; SetWorkingDir, %A_ScriptDir%
;t=0
;CapsLock::t:=!t
;#if t
; CapsLock & e::RWin
CapsLock & u::1
CapsLock & i::2
CapsLock & o::3
CapsLock & j::4
CapsLock & k::5
CapsLock & l::6
CapsLock & m::7
CapsLock & ,::8
CapsLock & .::9
CapsLock & Space::0
CapsLock & `;::.
CapsLock & w::CapsLock
CapsLock & d::Shift
CapsLock & '::=
CapsLock & /::-



Tab & i::Up
Tab & k::Down
Tab & l::Right
Tab & j::Left 
Tab & f::Shift
Tab & d::Ctrl
Tab & s::Alt
Tab & '::`
Tab::Tab 

; CapsLock Up::SetCapsLockState, on
; Tab::Tab 