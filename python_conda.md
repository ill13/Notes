
#### On Lambda:

Lambda is basically a *one line function*

Effectively, these two exmaples do the same thing"

```python
rot13 = lambda s : codecs.getencoder("rot-13")(s)[0]
```
```python
def rot13 (string):
    string= codecs.getencoder("rot-13")(string)[0]
    return string
```


***
Conda Install/config notes:

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
