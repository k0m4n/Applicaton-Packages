DisplayFusion MSI Deployment README
-----------------------------------

When deploying via Active Directory Group Policy, you must use the included .MST file on the Modifications tab in the Group Policy Software Package.

Since the MSI Installer has changed between DisplayFusion 3.4.1 and 4.0, it is recommended that you choose the "Uninstall the existing package, then install the upgrade package" option if you'll be using Group Policy to upgrade from DisplayFusion 3.4.1 to 4.0 or higher.

If you prefer create your own .MST file, be sure to include the following properties, otherwise the installation will fail:
- CUSTOM1=/VERYSILENT
- LAUNCHAFTER=0
- STARTUPALL=1

For the complete list of available properties for the MSI Installer, see the following article: http://www.displayfusion.com/KB/SilentInstallation#msiinstall

As always, make sure to test thoroughly before deploying into production.

If you have any questions at all regarding the MSI Installer, feel free to contact us: http://www.displayfusion.com/Support/#contact