# Summary

This tool provides a method (and library) for collecting and parsing all heap transactions using the standard Windows heap APIs.

# Usage

If _not_ using PidNewProcess you must configure an executable to start with
heap logging by creating a registry entry like

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\svchost.exe]
"TracingFlags"=dword:00000001
```

## First enable the NT kernel logger, without this you don't get module/process resolution

`xperf -on base`

## Start a capture with

`xperf -start heapsession -heap -pids 0 -stackwalk HeapAlloc+HeapRealloc+HeapCreate+HeapDestroy+HeapFree`

or

`xperf -start heapsession -heap -PidNewProcess notepad.exe -stackwalk HeapAlloc+HeapRealloc+HeapCreate+HeapDestroy+HeapFree`

## Stop capture with (the two stops are intentional, one stops kernel, one stops user)

`xperf -stop -stop heapsession -d trace.etl`

## Pretty-print log with (this output is what we parse)

`xperf -i trace.etl`

or, with symbols (but a lot slower parse time)

`xperf -i trace.etl -symbols`

