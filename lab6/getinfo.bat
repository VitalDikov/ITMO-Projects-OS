wmic os get Caption > Caption.txt
wmic os get FreePhysicalMemory > Memory.txt
wmic os get TotalVisibleMemorySize >> Memory.txt
wmic logicaldisk get name, description > DisksInfo.txt