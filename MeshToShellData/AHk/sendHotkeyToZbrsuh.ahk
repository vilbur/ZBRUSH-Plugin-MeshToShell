#SingleInstance force


/** Execute hotkey in ZBRUSH
 */
sendHotkeyToZbrsuh ($hotkey)
{

	;;MsgBox,262144,TEST, executeKeyboardShortcutInZbrush,3

	MsgBox,262144,hotkey, %$hotkey%,3

	if( $zbrush_window	:= WinExist( "ahk_exe ZBrush.exe" ) )
	{
		WinActivate, ahk_exe ZBrush.exe

		/*
			Execute command "~VIL-PLUGINS:MaxZbrushSync:Max to Zbrush" in "../../Zbrush/MaxZbrushSync.txt"
		*/
		;Send, {Ctrl Down}{Shift Down}{F8}{Ctrl Up}{Shift Up}
		Send, %$hotkey%
	}
}

;$parameter	= %1%
;
;
;MsgBox,262144,$parameter, %$parameter%,3

/*








/** EXECUTE
  *
  */
;sleep 500
;
;
;sendHotkeyToZbrsuh()
;
;;sleep 3000
;
;
;
;if( waitForFileCountChanged() )
;	executeDecimateCurrent()
;
;else
;	MsgBox,262144, waitFoPreprocessAndExecuteDecimation.ahk, File count does not changed in folder:`n`n "Users\Public\...\ZPluginData\DecimationMasterData"


;executeDecimateCurrent()
