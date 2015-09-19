@echo off

	setlocal EnableDelayedExpansion

	for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
		set "DEL=%%a"
	)

	for /f "tokens=*" %%L in ('findstr /n $') do (
		set "Line=%%L%"
		set "Line=!Line:~2!"

		if "!Line!" == "newline " (
			echo.
		) else if "!Line!" == "newline" (
			echo.
		) else (
			set "BColor=!Line:~,3!"
			set "FColor=!Line:~4,3!"

			set "Continue=1"

			if "!BColor!" == "blk" (
				set "BColor=0"
			) else if "!BColor!" == "red" (
				set "BColor=4"
			) else if "!BColor!" == "grn" (
				set "BColor=2"
			) else if "!BColor!" == "ylw" (
				set "BColor=6"
			) else if "!BColor!" == "blu" (
				set "BColor=1"
			) else if "!BColor!" == "mgn" (
				set "BColor=5"
			) else if "!BColor!" == "cyn" (
				set "BColor=3"
			) else if "!BColor!" == "wht" (
				set "BColor=8"
			) else (
				set "Continue=0"
			)

			if "!FColor!" == "blk" (
				set "FColor=0"
			) else if "!FColor!" == "dgr" (
				set "FColor=8"
			) else if "!FColor!" == "red" (
				set "FColor=4"
			) else if "!FColor!" == "lrd" (
				set "FColor=c"
			) else if "!FColor!" == "grn" (
				set "FColor=2"
			) else if "!FColor!" == "lgr" (
				set "FColor=a"
			) else if "!FColor!" == "ylw" (
				set "FColor=6"
			) else if "!FColor!" == "lyl" (
				set "FColor=e"
			) else if "!FColor!" == "blu" (
				set "FColor=1"
			) else if "!FColor!" == "lbl" (
				set "FColor=9"
			) else if "!FColor!" == "prp" (
				set "FColor=5"
			) else if "!FColor!" == "lpr" (
				set "FColor=d"
			) else if "!FColor!" == "cyn" (
				set "FColor=3"
			) else if "!FColor!" == "lcy" (
				set "FColor=b"
			) else if "!FColor!" == "gry" (
				set "FColor=7"
			) else if "!FColor!" == "wht" (
				set "FColor=f"
			) else (
				set "Continue=0"
			)

			if "!Continue!" == "1" (
				call :Write !BColor!!FColor! !Line:~8!
			) else (
				echo !Line!
			)
		)
	)

	goto :eof

	REM Thanks to http://stackoverflow.com/questions/2048509/how-to-echo-with-different-colors-in-the-windows-command-line/23072489#23072489

	:Write
		echo off
		<nul set /p ".=%DEL%" > "%~2"
		findstr /v /a:%1 /R "^$" "%~2" nul
		del "%~2" > nul 2>&1
	goto :eof