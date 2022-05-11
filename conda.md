### 2202-05-11

Conda stil not working in PowerShell

- From start menu, fire up *Anaconda PowerShell*
- Start VSCode in the nw PS terminal with ```code``` + ```enter```
- Once VSCode starts, try to execute any python script [to start a PS terminal window]
- In the new PS window type ```conda init```
- Restart VSCode

You may need to create a ```profile.ps1``` file in  *C:\Users\[USER]\Documents\PowerShell\profile.ps1* with the contents of:

```powershell
#region conda initialize
# !! Contents within this block are managed by 'conda init' !!
(& "C:\Users\ill13\anaconda3\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | Invoke-Expression
#endregion
```



### 2022-02-26

## Conda new install

```
conda create -n gfx
conda activate gfx
conda install Pillow
```

If VSCode won't start conda then:

- Start the conda powershell shortcut from start menu and enter:
```
conda init powershell
```
- If that still gives you trouble, start up the same short as Admin and run:
```
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```

If 

```
conda install PACKAGENAME
```

doesn't work, then install from forge with:

```
conda install -c conda-forge PACKAGENAME
```

### 2021-11-11
## Conda cleaning

Backup your conda installs with:
```conda env export > env_name.yml ```

Clean up some conda extras [couple of gigs]
```conda clean --all```

####Start blastin'

Rename the ```anaconda3``` folder to ```anaconda3_backup```

Rebuild your conda environments:
```conda env create -f env_name.yml```

### 20210919
### Working with PySide6
```powershell
conda create -n pyside python=3.7.2
activate pyside
conda install -c conda-forge pyside6  [doesn't work]
pip install pyside6 [does work]
conda install -c conda-forge pyinstaller
```
```pyinstaller --noconfirm main.py```

Execute via CLI so you can see errors...Be sure to copy qml folders and files [see your runtime errors]

After exe is able to be run without errors, do this:

```pyinstaller --windowed --noconfirm main.py```

Should be done?

***

### 20210705
- Build your own pyinstaller
- Use 4.2 or 3.6
- Pyinstaller spec files have an “excludes” field, or something like that name - I recommend excluding numpy, PIL, and Scipy with pygame.

```
conda activate veritasr
pyinstaller --onefile --uac-admin --windowed --icon=WEBCAM_ON.ico --noconfirm camDown.py
```

***
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

If you get the error ```failed to execute script```:
- Make sure the correct ```conda``` dev environment is active in VSCode
- Compile app within VSCode: ```pyinstaller camDown.py```
- Move to ```dist\app_name``` directory and execut your app via command line 
- ```.\dist\camDown\camDown.exe```
- You should see error on the command line

If ```onefile``` fails
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

