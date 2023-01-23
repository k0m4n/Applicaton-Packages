pushd %~dp0
msiexec /i "sionSetup-3.0.7.msi" TRANSFROMS="ClipboardFusion-GPO-Deployment.mst" LKEYALL="{REDACTED}" CUSTOM1="/SILENT" LAUNCHAFTER=0 STARTUPALL=1 STARTUPUSER=0 /qb!