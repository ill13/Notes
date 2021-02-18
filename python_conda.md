





#### On Lambda:

Lambda is basically an *inline function*

Effectively, these two exmaples do the same thing"

```python
rot13 = lambda string : codecs.getencoder("rot-13")(string)[0]
```
```python
def rot13 (string):
    string= codecs.getencoder("rot-13")(string)[0]
    return string
```

So if we want to break down the following lambda:

```python
rot13 = lambda string : codecs.getencoder("rot-13")(string)[0]
```
We will see that

```lambda string``` **string** refers to the input variable(s) that are ALSO returned

```:``` the **:** separates the *input* from the *output function* part. Whatever the result of the *output function* is returned as ```lambda string``` 

Anyway if you want to be fancy, use ```lambda```. On the other hand, if you want to get stuff done and be easily readable, just use a function

#### Conda Install/config notes:

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
