# params
param (
    [string]$NAME
)

# API
Add-Type @'
using System;
using System.Runtime.InteropServices;

public class API {

    public enum SW : int {
        Hide            = 0,
        Normal          = 1,
        ShowMinimized   = 2,
        Maximize        = 3,
        ShowNoActivate  = 4,
        Show            = 5,
        Minimize        = 6,
        ShowMinNoActive = 7,
        ShowNA          = 8,
        Restore         = 9,
        Showdefault     = 10,
        Forceminimize   = 11
    }

    [DllImport("user32.dll")]
    public static extern int ShowWindow(IntPtr hwnd, SW nCmdShow);
}
'@

# search for processes
$procs = Get-Process $NAME
foreach ($p in $procs) {
    # only non-zero handle is a valid window
    if ($p.MainWindowHandle -ne 0) {
        # do minimize
        [API]::ShowWindow($p.MainWindowHandle, 'Minimize')
    }
}
