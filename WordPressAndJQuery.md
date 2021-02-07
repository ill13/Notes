### WordPress and JQuery

#### Setup your JQuery/ javascript external file

I'm not exactly sure how this works, I think it loads a separate copy of JQuery into memory, regardless, just encapsulate your JQuery like below and save it

- Copy everything between ```<script>``` and ```</script>```
- Add it to a new ```.js``` file 
- Insert ```var $=jQuery.noConflict();``` as the first line of your new ```.js``` file
- Save your new ```.js``` file to the root of your WordPress site.


```javascript

var $=jQuery.noConflict();

$(document).ready(function () {
    //console.log( 'ready!' );
    
  });

````

Your new file should look like above, (with your code inside) 

In this snippet, I've put my script called ```my_script.js``` at the root of my website; i.e., the same folder as ```wp-config.php```

####Now edit your child-theme's ```functions.php``` and add:

```php

function add_my_script() {
    wp_enqueue_script(
        'my_script', // name your script so that you can attach other scripts and de-register, etc.
        '/my_script.js', // this is the location of your script file
        array() // this array lists the scripts upon which your script depends
    );
}
```

####There's (at least) two ways that you can add your script to a page

To add to all WordPress pages:

```add_action( 'wp_enqueue_scripts', 'add_my_script' );```

To add only to certain WordPress pages:

```add_shortcode( 'my_script', 'add_my_script' ); ```

When adding to only certain pages

- Open the WP page you'd like to edit in text mode.
- Edit the WordPress page where you want the javascript to run,
- Add the shortcode like this ```[my_script]``` 

I see a use case for ```shortcodes``` when using random internet scripts to do different things or testing. So, keep in mind for that when using the  shortcode option, you'll need to add a new function to ```functions.php``` for every new script you add. 



####Finally, (a) wrong way to add javascript

Too lazy to add another file? Well just tack this onto the end of your ```functions.php```

```php

function include_inline_script() {
    echo '<script type="text/javascript">
            // Document ready
            jQuery(document).ready(function(){
                alert("hello!");
            });
            // OR window load
            jQuery(window).load(function(){
                alert("hello!");
            });
            </script>';
}

```

Depending where you need it to load choose ether of these options:

```add_action( 'wp_head', 'include_inline_script' );```
```add_action( 'wp_footer', 'include_inline_script' );```


We can use that to include some CCS too!

```php

function include_inline_style() {
    echo "<style type='text/css'>
        .h1 { 
            font-family: 'Abril Fatface' !important;
        };
        </style>";
}

add_action( 'wp_head', 'include_inline_style' );

```

However you should really just include that in your ```styles.css```


#### Bootstrap

To remove extra ```<p>```'s from WordPress default layouts

```php
remove_filter('the_content','wpautop';
remove_filter('the_excerpt','wpautop';

```
