LogFusion MSI Deployment README
-----------------------------------

When deploying via Active Directory Group Policy, you must use the included .MST file on the Modifications tab in the Group Policy Software Package.

If you prefer to create your own .MST file, be sure to include the following properties, otherwise the installation will fail:
- CUSTOM1=/VERYSILENT
- LAUNCHAFTER=0

For the complete list of available properties for the MSI Installer, see the following article: http://www.logfusion.ca/KB/SilentInstallation#msiinstall

As always, make sure to test thoroughly before deploying into production.

If you have any questions at all regarding the MSI Installer, feel free to contact us: http://www.logfusion.ca/Support/#contact