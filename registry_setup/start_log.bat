xperf -on base
xperf -start heapsession -heap -pids 0 -stackwalk HeapAlloc+HeapRealloc+HeapCreate+HeapDestroy+HeapFree
