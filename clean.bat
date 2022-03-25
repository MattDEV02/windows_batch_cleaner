:: Simple batch script that optimize Windows computers (It must has runned as administrator).
@ECHO OFF && CLS && TITLE Windows Cleaner && SET PROMPT=Clean: && ECHO Batch script started. 
ECHO Loading system informations... && DIR && systeminfo && ipconfig /all && netsh wlan show interface && wifi_checker.exe
ECHO Deleting temp folders... && (ECHO S | DEL /S %temp%\*) && (ECHO S | DEL /S %windir%\Temp\*)
ECHO Cleaning... && cleanmgr /sagerun:64 
ECHO Deleting trash folder... && (ECHO S | RMDIR /s %systemdrive%\$Recycle.bin) 
ECHO Optimizing C: unity...
Defrag /D /C && ECHO C: unity optimized.
ECHO Optimizing RAM... && ipconfig /FlushDNS && net start dnscache && ECHO RAM optimized. 
sfc /scannow 
CD %ProgramFiles%\Windows Defender && MpCmdRun -Scan -ScanType 2 -Trace -SignatureUpdate -Restore && MpCopyAccelerator && mrt /F:Y
ECHO: && ECHO Batch script finished. && ECHO: && PAUSE
::%windir%\system32\rundll32 advapi32.dll, ProcessIdleTasks
