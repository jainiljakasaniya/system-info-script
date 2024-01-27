Get-CimInstance -Namespace root\wmi -ClassName wmimonitorid | foreach {
    $Manufacturer = if ($_.ManufacturerName -notmatch '^0$') { ($_.ManufacturerName | foreach {[char]$_}) -join "" } else { "" }
    $Name = if ($_.UserFriendlyName -notmatch '^0$') { ($_.UserFriendlyName | foreach {[char]$_}) -join "" } else { "" }
    $Serial = if ($_.SerialNumberID -notmatch '^0$') { ($_.SerialNumberID | foreach {[char]$_}) -join "" } else { "" }

    New-Object -TypeName psobject -Property @{
        Manufacturer = $Manufacturer
        Name = $Name
        Serial = $Serial
    }
}
