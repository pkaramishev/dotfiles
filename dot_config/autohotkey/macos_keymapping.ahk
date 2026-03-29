#Requires AutoHotkey v2.0
#SingleInstance Force
#NoTrayIcon

; --- Prevent Start Menu from triggering on Win Key release ---
A_MenuMaskKey := "vkE8" ; Sets an unassigned virtual key as the mask

; --- Remap Windows Keys to Control ---
LWin::LCtrl
RWin::RCtrl

; --- 2. Restore Win functionality via Shift + Win ---
; The '$' prefix prevents the script from triggering itself
; The '*' allows it to work even if other modifiers are held
$*+LWin::Send("{LWin}")
$*+RWin::Send("{RWin}")

; --- Mac-style Screenshot Shortcuts ---
; Since Win is now Ctrl, we use the '^' (Ctrl) modifier here.
; These will physically be triggered by [Win Key] + Shift + [Number]

; Cmd + Shift + 3 (Capture Full Screen to File)
^+3::Send("#+!{PrintScreen}")

; Cmd + Shift + 4 (Rectangular Snip)
^+4::Send("#+s")

; Cmd + Shift + 5 (Screen Snipping Interface)
^+5::Send("#s")

; --- Caps Lock Language Toggle ---
; Intercepts Caps Lock to switch keyboard languages
CapsLock:: {
    ; 0x50 = WM_INPUTLANGCHANGEREQUEST
    ; 2 = INPUTLANGCHANGE_FORWARD
    PostMessage(0x50, 2, 0, , "A")
}

; --- Restore original Caps Lock functionality ---
; Use Shift + CapsLock to actually toggle capitalization
+CapsLock:: {
    SetCapsLockState(!GetKeyState("CapsLock", "T"))
}
