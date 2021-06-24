### 20210623 Conda install config


- No pandas 
- No numpy
- Using Python 3.7.2
- Default pyinstaller (4.3)
```
conda create -n veritasr python=3.7.2
activate veritasr
conda install -c conda-forge pyinstaller
pyinstaller --uac-admin --windowed --icon=WEBCAM_ON.ico camDown.py
```

If you get the error like ```failed to execute script```:
- Make sure the correct ```conda``` dev environment is active in VSCode
- Compile app within VSCode: ```pyinstaller camDown.py```
- Move to ```dist\app_name``` directory and execut your app via command line 
- ```.\dist\camDown\camDown.exe```
- You should see error on the command line

If ```onefile``` fails"
- Make **sure** you have ```shell=True, stderr=subprocess.PIPE, stdin=subprocess.PIPE```
- ```subprocess.check_output(command, shell=True, stderr=subprocess.PIPE, stdin=subprocess.PIPE).decode('utf-8')```
- Build with: ```pyinstaller --onefile --uac-admin --windowed --icon=WEBCAM_ON.ico --noconfirm camDown.py```

### 202010305 Conda install config


- No systemwide python installed
- No pandas 
- no numpy
- Use 3.6 to 3.7.2
```
conda create -n geofence python=3.7.2
activate geofence
conda install -c conda-forge psutil
pip install woocommerce
conda install -c conda-forge pyinstaller
```
Get an error msg about SSL not working

- Open your miniconda ENV path ```C:\Users\YOUR_NAME\miniconda3\envs\YOUR_ENV``` 
- Open ```C:\Users\YOUR_NAME\miniconda3\envs\YOUR_ENV\Library\bin\```
- Select and copy all files ```libcrypto*``` and ```libssl*```
- Paste selected files into  ```C:\Users\YOUR_NAME\miniconda3\envs\YOUR_ENV\DLLs```


Build it


### Force numpy to use smaller size version under conda

If default ```numpy``` is installed, expect ```pysinstaller``` to create a 650 megabyte executable
```
conda install conda-forge::blas=*=openblas

conda install -c conda-forge numpy
```

```
conda create -n gfx
conda activate gfx
conda install Pillow
```

### ~~Conda Install/config notes:~~

```powershell
conda create -n ENV_NAME python=3.7.3
conda activate ENV_NAME
conda install -c conda-forge PY_MODULE
```

```powershell    
pip install WooCommerce
pip install country_converter # not working
conda install cryptography
conda install python=3.7.2 # not needed
```
    
```powershell
conda create -n geoFence373 python=3.7.3
conda activate geoFence373
conda install -c conda-forge country_converter
conda install -c conda-forge cryptography
pip install WooCommerce
```

