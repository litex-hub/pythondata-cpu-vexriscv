SRC := ${shell find . -type f -name \*.scala}

all: VexRiscv.v VexRiscv_Debug.v VexRiscv_Lite.v VexRiscv_LiteDebug.v VexRiscv_IMAC.v VexRiscv_IMACDebug.v VexRiscv_Min.v VexRiscv_MinDebug.v VexRiscv_Full.v VexRiscv_FullDebug.v VexRiscv_FullCfu.v VexRiscv_FullCfuDebug.v VexRiscv_Linux.v VexRiscv_LinuxDebug.v VexRiscv_LinuxNoDspFmax.v VexRiscv_Secure.v VexRiscv_SecureDebug.v VexRiscv_SlimCfu.v VexRiscv_SlimCfuDebug.v VexRiscv_Fomu.v VexRiscv_FomuCfu.v VexRiscv_PerfCfu.v VexRiscv_PerfCfuDebug.v VexRiscv_SlimPerfCfu.v VexRiscv_SlimPerfCfuDebug.v

VexRiscv.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault"

VexRiscv_Debug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault -d --outputFile VexRiscv_Debug"

VexRiscv_Lite.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --iCacheSize 2048 --dCacheSize 0 --mulDiv true --singleCycleShift false --singleCycleMulDiv false  --outputFile VexRiscv_Lite"

VexRiscv_LiteDebug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault -d --iCacheSize 2048 --dCacheSize 0 --mulDiv true --singleCycleShift false --singleCycleMulDiv false --outputFile VexRiscv_LiteDebug"

VexRiscv_IMAC.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --csrPluginConfig all --atomics true --compressedGen true --outputFile VexRiscv_IMAC"

VexRiscv_IMACDebug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --csrPluginConfig all --atomics true --compressedGen true -d --outputFile VexRiscv_IMACDebug"

VexRiscv_Min.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --iCacheSize 0 --dCacheSize 0 --mulDiv false --singleCycleShift false --singleCycleMulDiv false --bypass false --prediction none --outputFile VexRiscv_Min"

VexRiscv_MinDebug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault -d --iCacheSize 0 --dCacheSize 0 --mulDiv false --singleCycleShift false --singleCycleMulDiv false --bypass false --prediction none --outputFile VexRiscv_MinDebug"

VexRiscv_Fomu.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --safe false --iCacheSize 2048 --dCacheSize 0 --csrPluginConfig mcycle --mulDiv true --singleCycleShift true --singleCycleMulDiv true --bypass false --prediction none --hardwareDiv false --outputFile VexRiscv_Fomu"

VexRiscv_FomuCfu.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --safe false --cfu true --iCacheSize 2048 --dCacheSize 0 --csrPluginConfig mcycle --mulDiv true --singleCycleShift true --singleCycleMulDiv true --bypass false --prediction none --hardwareDiv false --outputFile VexRiscv_FomuCfu"

VexRiscv_Full.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --csrPluginConfig all --outputFile VexRiscv_Full"

VexRiscv_FullDebug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --csrPluginConfig all -d --outputFile VexRiscv_FullDebug"

VexRiscv_FullCfu.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --dCacheSize 8192 --iCacheSize 8192 --csrPluginConfig all --cfu true --outputFile VexRiscv_FullCfu"

VexRiscv_FullCfuDebug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --dCacheSize 8192 --iCacheSize 8192 --csrPluginConfig all -d --cfu true --outputFile VexRiscv_FullCfuDebug"

VexRiscv_PerfCfu.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --dCacheSize 8192 --iCacheSize 8192 --csrPluginConfig all --cfu true --perfCSRs 8 --outputFile VexRiscv_PerfCfu"

VexRiscv_PerfCfuDebug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --dCacheSize 8192 --iCacheSize 8192 --csrPluginConfig all -d --cfu true --perfCSRs 8 --outputFile VexRiscv_PerfCfuDebug"

VexRiscv_Slim.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --dCacheSize 4096 --iCacheSize 2048 --csrPluginConfig all --outputFile VexRiscv_Slim"

VexRiscv_SlimCfu.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --dCacheSize 4096 --iCacheSize 2048 --csrPluginConfig all --cfu true --outputFile VexRiscv_SlimCfu"

VexRiscv_SlimCfuDebug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --dCacheSize 4096 --iCacheSize 2048 --csrPluginConfig all -d --cfu true --outputFile VexRiscv_SlimCfuDebug"

VexRiscv_SlimPerfCfu.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --dCacheSize 4096 --iCacheSize 2048 --csrPluginConfig all --cfu true --perfCSRs 8 --outputFile VexRiscv_SlimPerfCfu"

VexRiscv_SlimPerfCfuDebug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --dCacheSize 4096 --iCacheSize 2048 --csrPluginConfig all -d --cfu true --perfCSRs 8 --outputFile VexRiscv_SlimPerfCfuDebug"

VexRiscv_Linux.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --csrPluginConfig linux-minimal --outputFile VexRiscv_Linux"

VexRiscv_LinuxDebug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --csrPluginConfig linux-minimal -d --outputFile VexRiscv_LinuxDebug"

VexRiscv_LinuxNoDspFmax.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --csrPluginConfig linux-minimal --singleCycleMulDiv=false --relaxedPcCalculation=true --prediction=none --outputFile VexRiscv_LinuxNoDspFmax"

VexRiscv_Secure.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --pmpRegions 16 --pmpGranularity 256 --csrPluginConfig secure --outputFile VexRiscv_Secure"

VexRiscv_SecureDebug.v: $(SRC)
	sbt compile "runMain vexriscv.GenCoreDefault --pmpRegions 16 --pmpGranularity 256 --csrPluginConfig secure -d --outputFile VexRiscv_SecureDebug"
