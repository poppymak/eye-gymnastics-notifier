#include <TrayConstants.au3>
#include <MsgBoxConstants.au3>
#include <Date.au3>

; Sleep for 40 minutes = 2.400.000
; Sleep for 45 minutes = 2.700.000
; Sleep for  5 minutes = 300.000

; Makes AutoIt's tran inactive
TraySetIcon("C:\script\script.ico")
AutoItSetOption("TrayAutoPause", 0)
AutoItSetOption("TrayMenuMode", 1)

;
;
;

; Runs Python Script at the same folder
;ShellExecute ( "auto.py" )
;WinSetState("PythonTitle4Close", "", @SW_HIDE)

;
;
;

TrayTip("Начало работы", "Проводи время толково!", 0, $TIP_ICONASTERISK)

;MsgBox($MB_SYSTEMMODAL, '', "The time is: " & _NowTime())
;MsgBox($MB_SYSTEMMODAL, '', "The time is: " & TimerDiff())

$academHour = 0

For $i = 0 To 27000 Step 1

   If @HOUR >= 23 Then
	  SoundPlay(@WindowsDir & "\Media\Windows Proximity Notification.wav", 1)
	  MsgBox($MB_SYSTEMMODAL, '', "Пора спать! Осталось 5 минут!")
	  Sleep(300000)
	  Shutdown (1)
   EndIf

   If $i = 2400 Then
	  SoundPlay(@WindowsDir & "\Media\Windows Proximity Notification.wav", 1)
      TrayTip("Глаза", "40 минут", 0, $TIP_ICONASTERISK)
   EndIf

   If $i = 25800 Then
	  SoundPlay(@WindowsDir & "\Media\Windows Proximity Connection.wav", 1)
      MsgBox($MB_SYSTEMMODAL, "", "Через 2 минуты зарядка!")
   EndIf

   If $i = 26999 Then
	  Run ( "Eye Corrector.exe" , "C:\script\" , @SW_MAXIMIZE)
	  Sleep(300000)
	  $i = 0
	  $academHour += 1
   EndIf

   Sleep(100)

Next