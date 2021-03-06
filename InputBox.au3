
;-Begin-----------------------------------------------------------------
;
; AutoIt Version: 3.0
; Language:       English
; Platform:       Win9x/NT
; Author:         Jonathan Bennett (jon at autoitscript dot com)
;
; Script Function:
;   Demonstrates the InputBox, looping and the use of @error.
;
;-----------------------------------------------------------------------

  ;-Includes------------------------------------------------------------
    #include <Constants.au3>

  ;-Main----------------------------------------------------------------

    ; Prompt the user to run the script - use a Yes/No prompt with the
    ; flag parameter set at 4 (see the help file for more details)
    Local $iAnswer = MsgBox(BitOR($MB_YESNO, $MB_SYSTEMMODAL), _
      "AutoIt Example (English Only)", "This script will open an " & _
      "input box and get you to type in some text.  Do you want to run it?")

    ; Check the user's answer to the prompt (see the help file for
    ; MsgBox return values)
    ; If "No" was clicked (7) then exit the script
    If $iAnswer = 7 Then
      MsgBox($MB_SYSTEMMODAL, "AutoIt", "OK.  Bye!")
      Exit
    EndIf

    ; Loop around until the user gives a valid "autoit" answer. This is
    ; not case-sensitive, therefore AutoIt and AuToIT are acceptable
    ; values as well
    Local $iLoop = 1, $sText = ""
    While $iLoop = 1
      $sText = InputBox("AutoIt Example", _
        "Please type in the word ""autoit"" and click OK")
      If @error = 1 Then
        MsgBox($MB_SYSTEMMODAL, "Error", "You pressed 'Cancel' - try again!")
      Else
        ; They clicked OK, but did they type the right thing?
        ; This is not case-sensitive, therefore AutoIt and AuToIT are
        ; acceptable values as well
        If $sText <> "autoit" Then
          MsgBox($MB_SYSTEMMODAL, "Error", _
            "You typed in the wrong thing - try again!")
        Else
          ; Exit the loop - ExitLoop would have been an alternative too
          $iLoop = 0
        EndIf
      EndIf
    Wend

    ; Print the success message
    MsgBox($MB_SYSTEMMODAL, "AutoIt Example", _
      "You typed in the correct word!  Congrats.")

    ; Finished!

    ClipPut($sText)

;-End-------------------------------------------------------------------
