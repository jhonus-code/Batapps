import os
import glob

print("Eleminando Archivos Temporales...")
py_files = glob.glob('C:\Windows\Temp\*.*')

for py_file in py_files:
    try:
        os.remove(py_file)
    except OSError as e:
        print(f"Error:{ e.strerror}")
