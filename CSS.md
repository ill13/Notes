#### CSS notes

||Selector|Example|Explanation|
|:-:|:-:|:-:|:-:|:-:|:-:|
|```*``` is all|```*```|```* {text-align: center;}```|Select all elements|
|Id is ```#```| ```#id``` |```#name {text-decoration:: underline;}```| Select the element with the matching id='name'|
|Class is ```.```|```.class```|```.title {color: red;}```|Selects all elements with matching class="title"|
||```p```|```p {font-weight: bold;}```|Select all \<p> elements|
||```element.class```|```p.intro {font: Arial;}```|Selects only \<p> elements with the class="intro"|
||```element,element...```|```a, h1, p {text-align: center;}```|Group all \<a>,\<h1>,\<p>, elements|


||Selector|Example|Explanation|
|:-:|:-:|:-:|:-:|:-:|:-:|
|```*``` is all|```*```|```* {text-align: center;}```|Select all elements|
|Id is ```#```| ```#id``` |```#name {text-decoration:: underline;}```| Select the element with the matching id='name'|
|Class is ```.```|```.class```|```.title {color: red;}```|Selects all elements with matching class="title"|
||```p```|```p {font-weight: bold;}```|Select all \<p> elements|
||```element.class```|```p.intro {font: Arial;}```|Selects only \<p> elements with the class="intro"|
||```element,element...```|```a, h1, p {text-align: center;}```|Group all \<a>,\<h1>,\<p>, elements|



### Simple email obfuscate


```<div id="dou"></div>```




```css

#dou:before {
    content: "admin";
}

#dou:after {
    content: "@example.com";
}
```

### CSS background overlay

```css
#page { background: rgba(0, 0, 0, 0.7); }
```
