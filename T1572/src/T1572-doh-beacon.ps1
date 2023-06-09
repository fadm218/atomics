﻿param(
    [string]$DohServer = "https://8.8.8.8/resolve",
    [string]$Domain = "example.com",
    [string]$Subdomain = "atomicredteam",
    [string]$QueryType = "TXT",
	[int]$C2Interval = 30,
	[int]$C2Jitter = 20,
	[int]$RunTime = 30
)

$RunStart = Get-Date
$RunEnd = $RunStart.addminutes($RunTime)
Do { 
    $TimeNow = Get-Date
    (Invoke-WebRequest "$($DohServer)?name=$Subdomain.$(Get-Random -Minimum 1 -Maximum 999999).$Domain&type=$QueryType" -UseBasicParsing).Content
    $Jitter = (Get-Random -Minimum -$C2Jitter -Maximum $C2Jitter) / 100 + 1
    Start-Sleep -Seconds $C2Interval
}
Until ($TimeNow -ge $RunEnd)
