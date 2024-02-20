@echo off
echo ******************************************************************************
echo *         Created by Jainil Jakasaniya^<^jainiljakasaniya@gmail.com^>        *
echo ******************************************************************************
echo[
echo[
echo ------------------------------------------------------------------------------
echo VGA
echo ------------------------------------------------------------------------------
wmic path win32_VideoController get name, adapterram, PNPDeviceID
echo ------------------------------------------------------------------------------
echo RAM
echo ------------------------------------------------------------------------------
wmic MEMORYCHIP get BankLabel, DeviceLocator, Capacity, serialnumber, manufacturer
systeminfo | findstr /C:"Total Physical Memory"
echo ------------------------------------------------------------------------------
echo CPU
echo ------------------------------------------------------------------------------
wmic cpu get name, numberofcores, maxclockspeed, serialnumber, architecture, description, currentclockspeed, L2CacheSize, L3CacheSize
echo ------------------------------------------------------------------------------
echo Motherboard
echo ------------------------------------------------------------------------------
wmic baseboard get product, Manufacturer, version, serialnumber
echo ------------------------------------------------------------------------------
echo Disk
echo ------------------------------------------------------------------------------
wmic diskdrive get size, caption, serialnumber
echo ------------------------------------------------------------------------------
echo Network Adapters
echo ------------------------------------------------------------------------------
wmic nic get caption, speed, MACAddress
echo ------------------------------------------------------------------------------
echo Operating System
echo ------------------------------------------------------------------------------
wmic os get caption, version, installdate, lastbootuptime
echo ------------------------------------------------------------------------------
echo System Uptime
echo ------------------------------------------------------------------------------
systeminfo | findstr /C:"System Boot Time"
echo ------------------------------------------------------------------------------
echo Installed Software
echo ------------------------------------------------------------------------------
wmic product get name, version, vendor
echo ------------------------------------------------------------------------------
echo User Accounts
echo ------------------------------------------------------------------------------
wmic useraccount get name, fullname, description
echo ------------------------------------------------------------------------------
echo System Services
echo ------------------------------------------------------------------------------
net start
echo ------------------------------------------------------------------------------
echo Battery Information
echo ------------------------------------------------------------------------------
powercfg /batteryreport
echo ------------------------------------------------------------------------------
echo Network Configuration
echo ------------------------------------------------------------------------------
ipconfig /all
echo ------------------------------------------------------------------------------
echo USB Devices
echo ------------------------------------------------------------------------------
wmic path win32_pnpsigneddriver where "drivertype=3" get devicename, manufacturer, description
echo ------------------------------------------------------------------------------
echo Printers
echo ------------------------------------------------------------------------------
wmic printer get name, portname, drivername
echo ------------------------------------------------------------------------------
echo Installed Hotfixes/Updates
echo ------------------------------------------------------------------------------
wmic qfe get hotfixid, description
echo ------------------------------------------------------------------------------
echo System Environment Variables
echo ------------------------------------------------------------------------------
set | more
echo ------------------------------------------------------------------------------
echo Monitor
echo ------------------------------------------------------------------------------
powershell.exe -ExecutionPolicy ByPass -noexit -file ".\monitor.ps1"

pause
