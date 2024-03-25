#SingleInstance force



/**
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




/**
 */
waitForFileCountChanged()
{

;	While ! FileExist( "C:\Filename.ext" )
;  Sleep 250
	$zbrush_decimationmaster_path := "c:\Users\Public\Documents\ZBrushData2022\ZPluginData\DecimationMasterData"


	$file_count_start := getFileCount( $zbrush_decimationmaster_path )

	$timeout	:= 3000
	$timeout	:= 300 * 1000 ;;; TIME LILMIT 300s = 5 min
	$tick     := 100
	$counter	:= 0

	While (  $counter < $timeout && $file_count_start == getFileCount( $zbrush_decimationmaster_path ) )
	{
		Sleep $tick

		;MsgBox,262144,counter, %$counter%,3
		$counter += $tick
	}

	$result := $counter != $timeout


	return % $counter != $timeout
}
/**
 */
getFileCount( $path )
{
	;$path := "c:\\Users\\Public\\Documents\\ZBrushData2022\\ZPluginData\\DecimationMasterData"
	count = 0

	Loop, % $path "\\*.zpm", 1, 0
		 count++

	;MsgBox,262144,count, %count%,3

	return % count
}

/* IF TRUE THEN NEXT COMMAMND AFTER DECIMATION IS EXECUTED

*/
$CONTINUE	= %1%

;MsgBox,262144,CONTINUE, %$CONTINUE%,3



/** EXECUTE
  *
  */
sleep 500


/* preprocess Current tool for decimation
*/
sendHotkeyToZbrsuh("{Ctrl Down}{Shift Down}{F8}{Ctrl Up}{Shift Up}")



if( waitForFileCountChanged() )
{
	sleep 2000 ;;; long sleep is needed; 1500 doesn't work sometimes

	;MsgBox,262144,variable, "Precocess Done",3

	/* execute Decimate Current Tool
	*/
	sendHotkeyToZbrsuh("{Ctrl Down}{Shift Down}{F9}{Ctrl Up}{Shift Up}")

	/* CONTINUE AFTER DECIMATION

		DISABLE LINE BELOW FORSTEP BY STEP TESTING
	*/
	if( $CONTINUE	 )
	{
		sleep 2000 ;;;
		sendHotkeyToZbrsuh("{Ctrl Down}{Shift Down}{F7}{Ctrl Up}{Shift Up}")
	}

}
else
	MsgBox,262144, waitFoPreprocessAndExecuteDecimation.ahk, Time limit waiting for decimation is up:`n`n "Users\Public\...\ZPluginData\DecimationMasterData"
