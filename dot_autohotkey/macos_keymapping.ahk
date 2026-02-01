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