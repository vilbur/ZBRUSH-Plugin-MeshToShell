#SingleInstance force

/**
 */
getFileCount( $path )
{

	loop, % $path
		$file_count := A_Index

	return % $file_count
}



/**
 */
waitForFileCountChanged()
{

;	While ! FileExist( "C:\Filename.ext" )
;  Sleep 250
	$zbrush_decimationmaster_path := "c:\Users\Public\Documents\ZBrushData2022\ZPluginData\DecimationMasterData\*.*"


	$file_count_start := getFileCount( $zbrush_decimationmaster_path )

	$timeout	:= 3000
	$timeout	:= 120 * 1000
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

/** Execute hotkey in ZBRUSH
 */
executeDecimateCurrent()
{

	;MsgBox,262144,TEST, executeKeyboardShortcutInZbrush,3

	if( $zbrush_window	:= WinExist( "ahk_exe ZBrush.exe" ) )
	{
		WinActivate, ahk_exe ZBrush.exe

		sleep 2000 ;;; long sleep is needed; 1500 doesn't work sometimes
		;sleep 500 ;;; long sleep is needed; 1500 doesn't work sometimes

		/*
			Execute command "~VIL-PLUGINS:MaxZbrushSync:Max to Zbrush" in "../../Zbrush/MaxZbrushSync.txt"
		*/
		Send, {Ctrl Down}{Shift Down}{F9}{Ctrl Up}{Shift Up}
	}
}


/** Execute hotkey in ZBRUSH
 */
preprocessCurrent()
{

	;;MsgBox,262144,TEST, executeKeyboardShortcutInZbrush,3

	if( $zbrush_window	:= WinExist( "ahk_exe ZBrush.exe" ) )
	{
		WinActivate, ahk_exe ZBrush.exe

		/*
			Execute command "~VIL-PLUGINS:MaxZbrushSync:Max to Zbrush" in "../../Zbrush/MaxZbrushSync.txt"
		*/
		Send, {Ctrl Down}{Shift Down}{F8}{Ctrl Up}{Shift Up}
	}
}

/*

/** EXECUTE
  *
  */
sleep 500


preprocessCurrent()

;sleep 3000



if( waitForFileCountChanged() )
	executeDecimateCurrent()

else
	MsgBox,262144, waitFoPreprocessAndExecuteDecimation.ahk, File count does not changed in folder:`n`n "Users\Public\...\ZPluginData\DecimationMasterData"


;executeDecimateCurrent()
