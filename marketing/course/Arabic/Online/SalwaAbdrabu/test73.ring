/*
	Application : Ring Lessons
	Author      : Salwa Abdrabu
*/

aFiles = dir("D:\Ring Project\My Folder")
# Get *.ring file
	aList = []
	for afile in aFiles
		if right(aFile[1],5) = ".ring"
		aList + aFile[1]
		ok
	next
# Sort aList
	aList = sort(aList)
	
# Print File As A List
	x = 1
	for cFile in aList 
		? "("+ x + ") "+ cFile
		 x++
	next
# Get The File Number
	see "Enter File Number :" +nl
	give cNumber
	nNumber = 0 + cNumber
	nNumber = floor(nNumber)
	 
	if nNumber > 0 and nNumber <= len(aList) and isnumber(nNumber) = 1
		? read(aList[nNumber])
	else 
	? "Invalid Number"
	ok
