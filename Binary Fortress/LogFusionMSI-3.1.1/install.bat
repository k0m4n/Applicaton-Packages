@echo off 
Pushd %~dp0
msiexec /i "LogFusionSetup-3.1.1.msi" TRANSFROMS="LogFusion-GPO-Deployment.mst" LKEYALL="{REDACTED}" CUSTOM1="/SILENT" LAUNCHAFTER=0 STARTUPALL=1 STARTUPUSER=0 /qb!