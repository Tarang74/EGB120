@ECHO OFF

setlocal ENABLEDELAYEDEXPANSION

@REM Display help text
IF "%~1"=="-h" GOTO :help
IF "%~1"=="-help" GOTO :help

@REM Set global variables
SET filename=%~nx0

SET /A verbose=0
SET /A open=0

@REM Set file to compile
IF "%~1"=="" GOTO :noFile
SET tex=%1
SHIFT

@REM If no parameters, build without opening
IF "%~1"=="" GOTO :default

@REM Loop through all parameters
SET /A numP=0
:loop
    @REM Use numP to test each parameter for validity
    SET numP=0

    @REM Check options
    IF "%1"=="-v" (
        SET numP=1
        SET verbose=1
    ) ELSE (
        IF "%1"=="-verbose" (
            SET numP=1
            SET verbose=1
        )
        IF "%1"=="-o" (
            SET numP=1
            SET open=1
        )
        IF "%1"=="-open" (
            SET numP=1
            SET open=1
        )
    )

    @REM If current option is not valid
    IF !numP!==0 GOTO :invalid
    
    @REM Shift variables and loop if another option exists
    SHIFT
    IF NOT "%1"=="" GOTO :loop

:: Default
:default
    @REM Verbose options
    IF %verbose%==0 CALL :buildPDF
    IF %verbose%==1 CALL :buildPDFv
    
    @REM Open options
    IF %open%==0 GOTO :EOF
    IF %open%==1 CALL :openPDF

    @REM Finally:
    GOTO :EOF

:: Build PDF
:buildPDF
    ECHO -- Building PDF --
    latexmk -aux-directory=Debug -shell-escape -file-line-error -interaction=nonstopmode -halt-on-error -output-directory=figures -silent -xelatex tikz/%tex%.tikz
    EXIT /B

:: Build PDF verbose
:buildPDFv
    ECHO -- Building PDF --
    latexmk -aux-directory=Debug -shell-escape -file-line-error -interaction=nonstopmode -halt-on-error -output-directory=figures -verbose -xelatex tikz/%tex%.tikz
    EXIT /B

:: Open PDF
:openPDF
    ECHO -- Opening PDF --
    figures\%tex%.pdf
    EXIT /B

:: Help
:help
    ECHO %scriptname% compile tikz diagrams using XeLaTeX.
    ECHO.
    ECHO     Usage: %scriptname% [filename] [option] ...
    ECHO.
    ECHO Available options:
    ECHO     %scriptname% [-h ^| -help]                  Provides help information.
    ECHO     %scriptname% [filename] [-v ^| -verbose]    Show compiler output.
    ECHO     %scriptname% [filename] [-o ^| -open]       Open the PDF after compilation.
    GOTO :EOF

:: No File
:noFile
    ECHO No file specified.
    ECHO Try "%scriptname% -h" for more information.
    GOTO :EOF

:: Invalid Parameter
:invalid
    ECHO Unknown option: %1
    ECHO Try "%scriptname% -h" for more information.
    GOTO :EOF