
/**
  
  sendHotkeyToZbrsuh("{Ctrl Down}{Shift Down}{F8}{Ctrl Up}{Shift Up}")
  
 */
sendHotkeyToZbrsuh( $key_shortcut )
{
	;MsgBox,262144,par, %par%,3
	;MsgBox,262144,"key_shortcut", %$key_shortcut%,3

	if( $zbrush_window	:= WinExist( "ahk_exe ZBrush.exe" ) )
	{
		WinActivate, ahk_exe ZBrush.exe

		/*
			Execute command "~VIL-PLUGINS:MaxZbrushSync:Max to Zbrush" in "../../Zbrush/MaxZbrushSync.txt"
		*/
		;Send, {Ctrl Down}{Shift Down}{F8}{Ctrl Up}{Shift Up}
		Send, %$key_shortcut%
	}
}