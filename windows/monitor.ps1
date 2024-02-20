Get-CimInstance -Namespace root\wmi -ClassName wmimonitorid | ForEach-Object {
    $Manufacturer = if ($_.ManufacturerName -notmatch '^0$') { ($_.ManufacturerName | ForEach-Object {[char]$_}) -join "" } else { "" }
    $Name = if ($_.UserFriendlyName -notmatch '^0$') { ($_.UserFriendlyName | ForEach-Object {[char]$_}) -join "" } else { "" }
    $Serial = if ($_.SerialNumberID -notmatch '^0$') { ($_.SerialNumberID | ForEach-Object {[char]$_}) -join "" } else { "" }

    New-Object -TypeName psobject -Property @{
        Manufacturer = $Manufacturer
        Name = $Name
        Serial = $Serial
    }
}
