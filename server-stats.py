import psutil

cpu_percent=psutil.cpu_percent(interval=1)

#Total memory usage (Free vs Used including percantage)
ram=psutil.virtual_memory()

ram_used_percent=ram.percent
ram_used_gb=round(ram.used / (1024**3), 2)

ram_free_percent=100 - ram.percent
ram_free_gb=round(ram.free / (1024**3), 2)



print(f"Total CPU:        {cpu_percent}%")
print(f"Total RAM Used %: {ram_used_percent}%")
print(f"Total RAM Used GB:{ram_used_gb}")
print(f"Total RAM Free %: {ram_free_percent}%")
print(f"Total RAM Free GB:{ram_free_gb}")


