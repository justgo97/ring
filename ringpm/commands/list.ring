/*
	Title :	The Ring Package Manager 
	Date  : 2018.10.18
	Author: Mahmoud Fayed <msfclipper@yahoo.com>
*/

func PrintInstalledPackages
	# Get Files
		Try
			new ListOfFiles {
				aFiles	= ListAllFiles("packages","ring")
			}
		Catch 
			? C_ERROR_CANTGETPACKAGESINFORMATION
			return 
		Done 
	# Get Package Info Files
		aPackagesInfoFiles 	= []
		for cFile in aFiles
			if JustFileName(cFile) = "package.ring"
				aPackagesInfoFiles + cFile 
			ok
		next
	# Print Packages 
		for cFile in aPackagesInfoFiles 
			eval(read(cFile))
			see Style(Width("Package ("+aPackageInfo[:folder]+") ",25),:YellowBlack)+": " +
				 Width(aPackageInfo[:name] + " [" + aPackageInfo[:branch] + "]",30) +
				 " -- " +
				Width("("+aPackageInfo[:version]+ ")",15) 
				if lCheckUpdates 
					see  " -- "  
					See CheckUpdates(aPackageInfo) 
				ok
				see nl
		next 
	# Print message if we don't have packages 
		if len(aPackagesInfoFiles) = 0
			? "No installed packages!"
		ok

func CheckUpdates aLocalPackageInfo
	cPackageName = aLocalPackageInfo[:remotefolder]
	cBranchName = aLocalPackageInfo[:branch]
	cPackageInfo = GetPackageFile(cPackageName,cBranchName)
	try
		eval( cPackageInfo )
	catch
		? C_ERROR_PACKAGEINFOISNOTCORRECT
		? cPackageInfo
		return 
	done 
	if ! islocal(:aPackageInfo)
		? C_ERROR_NOPACKAGEINFO
		return 
	ok
	# Check Update 	
		if aPackageInfo[:version] != aLocalPackageInfo[:version]
			return Style("New Update : (" + aPackageInfo[:version] + ")",:WhiteBlue)
		ok
	return "No Update!"
