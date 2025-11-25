import psutil

cpu_percent=psutil.cpu_percent(interval=1)

print(f"Total CPU: {cpu_percent}%")
