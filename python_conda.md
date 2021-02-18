### Lists and Dictionaries

A **list** is just a bunch of items stored in a comma separated, well, list. You use square bracket to encapsulate (start/end) them.

- Uses ```[]``` *square brackets* to start/end a list
- Uses ```,``` *commas* to separate values

So here's a simple list:

```list_of_names = ['Alice','Bob','Chuck']```

Now say you want to *iterate* (which is a fancy word for 'repeat' or 'loop') through that list you would start with something like:

 ```python
for each_name in list_of_names:
    print(each_name)

```
and your terminal output will be:

```shell
Alice
Bob
Chuck
```

You can also store a list inside a list. Lets add some info to our *list_of_names* list:

```python
list_of_names =  [['Alice','23','Green'],['Bob','18','Red'],['Chuck','42','Purple']]
```

And to iterate through those list items

```python
for info in list_of_names:
    print(info)
```

Now the terminal output will be:
```shell
['Alice', '23', 'Green']
['Bob', '18', 'Red']
['Chuck', '42', 'Purple']
```
Neat, right?

#### Trickier Lists

But what if we wanted to iterate and display just the colors from that list?

```python
for info in list_of_names:
    print(info[2])
```
Now we get:
```shell
Green
Red
Purple
```
How does this work? 

Well, the ```[2]``` part of ```print(info[2])``` tells the iteration loop to only print the data contained in the *third field*[^1] 

Try changing your iteration loop to:

```python
for info in list_of_names:
    print(info[1])
```

And see what you get got for output!


So that's pretty next, but our list is unclear. We don't know what the values of *23,18,42* or the colors *Green, Red, Purple* stand for. Are they ages or lucky numbers? What about those colors; are they eye colors or favorite colors?

Well, this is where dictionaries come into play!

### Dictionaries

So lets convert our *list of names* list to a dictionary!

Dictionaries use:

- ```{}``` *curly braces* to define start/end
- ```:``` *colons* to separate keys and values
- ```,``` *commas* to separate key/value pairs

```python


dict_of_name =  {'User Name':'Alice'}
```
To get data out a dictionary we can call it by its *key* or *name*, which must be encapsulated in ```[]``` square brackets. In this case 'User Name' is the *key* and if we do:

```python
print(dict_of_name['User Name'])
```

The terminal will display the **value** of *User Name* which is:

```
Alice
```

|Key/Name|Value|
|-|-|-|
|'User Name'|'Alice'|

Dictionaries are helpful because now you can look up stuff with a name, instead of a number!

#### More useful dictionaries

If we only have a single name and value pair we don't really need a name to find that data. So lets make a more complex dictionary.

```python
dict_of_names =  {'user01':{'User Name':'Alice','Age':'23'}}
```
Our new dictionary now has a *user01* key containing the key/value pairs of ```{'User Name':'Alice','Age':'23'}```


Let's see what we get if we do this:
```python
print(dict_of_names['user01'])
```
Our terminal output is:

```shell
{'User Name': 'Alice', 'Age': '23'}
```
And now try this!

```python
print(dict_of_names['user01']['Age'])
```
Our terminal output is now:
```shell
23
```

#### Dictionary iteration

Neat-o! But how do we iterate a dictionary?

Well, it's similar to **lists** but since there's multiple parts to our dictionary, it's a little more complex!

First, let's add 'Bob', as another user to our dictionary.

```python
dict_of_names =  {'user01':{'User Name':'Alice','Age':'23'},'user02':{'User Name':'Bob','Age':'18'}}
```

If we use *.items* in our iteration loop, we'll get:

```python
for each_user in dict_of_names.items():
    print(each_user)
```
The loop will output all the keys (which are *user01, user02*) and all the data contained in those keys:

```shell
('user01', {'User Name': 'Alice', 'Age': '23'})
('user02', {'User Name': 'Bob', 'Age': '18'})
```
Everything at once, not all that useful...However, lets add another variable called ```info``

```python
for each_user,info in dict_of_names.items():
    print(info['User Name'])
```

Now we get:

```shell
Alice
Bob
```
Lets up the ante here

```python
for each_user,info in dict_of_names.items():
    print(info['User Name'],info['Age'])
```

Now we get:

```shell
Alice 23
Bob 18
```
Another way to extract some data with *.values()*

```python
for each_user in dict_of_names.values():
    print(each_user['Age'])
```

```shell
18
23
```





***
### On Lambda:

Lambda is basically an *inline function*

Effectively, these two examples do the same thing"

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


[^1]:(third because computers start counting from zero. It just is that way, but don't worry it'll make sense *why* much later)

    |||||
    |-|-|-|-|
    |Real World Counting|1|2|3|
    |Computer Counting|0|1|2|
    |list_of_names|Alice|23|Green|

    Anyway just roll with it for now.
