#!/bin/bash

set -eu pipefail

get_cpu_snapshot() {
	awk '/^cpu /{
	idle = $5
	total = 0
	for(i=2;i<=NF;i++){
		total += $i
	}
	print idle, total
	}' /proc/stat
}

read -r idle1 total1 < <(get_cpu_snapshot)
sleep 1
read -r idle2 total2 < <(get_cpu_snapshot)

cpu_usage=$(awk -v i1="$idle1" -v t1="$total1" -v i2="$idle2" -v t2="$total2" 'BEGIN{
	idle_delta = i2 - i1;
	total_delta = t2 - t1;
	if(total_delta < 0){
		print 0;
		exit;
	}
	usage = (1 - idle_delta / total_delta) * 100;
	printf "%.1f", usage;	
}')
echo "CPU Usage: ${cpu_usage}%"
