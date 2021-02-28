### Conda Install/config notes:

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


### Pyinstaller

- conda activate base/apps pyinstaller34
- on build copy 'whatever is missing' folder to dist folder
- make sure you are running 64bit python for admin elevation to work. 32bit fails silently
- don't use onefile as to avoid being flagged as a virus
- Checkout onedir too
- am using 3.5, but fails

```pyinstaller --noconsole --uac-admin --windowed --icon=app_icon.ico app.py```
