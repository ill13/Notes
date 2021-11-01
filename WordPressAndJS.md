
https://stackoverflow.com/questions/51341915/how-do-i-import-animejs-into-my-wordpress-theme

#### Add javascript to Elementor:

- Edit the page on which you want to place the js using Elementor.
- Click the ```Edit with Elementor``` button to edit the page with Elementor.
- Drag-and-drop the HTML widget on the page.
- The HTML widget settings panel will display on the left-hand side.
- Insert the js code in the HTML Code field that is available in the HTML widget settings panel.

### WordPress and JQuery

#### Setup your JQuery/ javascript external file

I'm not exactly sure how this works, I think it loads a separate copy of JQuery into memory, regardless, just encapsulate your JQuery like below and save it

- Open your javascript file or the page containing javascript
- Copy everything between ```<script>``` and ```</script>```
- Add it to a new ```.js``` file 
- Insert ```var $=jQuery.noConflict();``` as the first line of your new ```.js``` file
- Save your new ```.js``` file to the root of your WordPress site.


Your new file should look like the following;

```javascript

var $=jQuery.noConflict();

$(document).ready(function () {
    //console.log( 'ready!' );
    
  });

````

except with your code inside. 

#### Next add to Wordpress's functions.php

In this snippet, I've put my javascript file (named  ```my_script.js```) in/at the root of my website; i.e., the same folder as ```wp-config.php```

Now edit your child theme's ```functions.php``` and add:

```php

function add_my_script() {
    wp_enqueue_script(
        'my_script', // name your script so that you can attach other scripts and de-register, etc.
        '/my_script.js', // this is the location of your script file
        array() // this array lists the scripts upon which your script depends
    );
}
```

#### There's (at least) two ways that you can add your javascript to a page

To add to all WordPress pages:

```add_action( 'wp_enqueue_scripts', 'add_my_script' );```

To add only to certain WordPress pages:

```add_shortcode( 'my_script', 'add_my_script' ); ```

When adding to only certain pages

- Open the WP page you'd like to edit in text mode.
- Edit the WordPress page where you want the javascript to run,
- Add the shortcode like this ```[my_script]``` 

I see a use case for ```shortcodes``` when using random internet scripts to do different things or testing. So, keep in mind for that when using the  shortcode option, you'll need to add a new function to ```functions.php``` for every new script you add. 



#### Finally, (a) wrong way to add javascript

Too lazy to add another file? Well just tack this onto the end of your ```functions.php```!

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

However you should really just include the CSS in your ```styles.css```

#### Just ram it in!

Add this to ```functions.php```

```php
function my_formatter($content) {
    $new_content = '';
    $pattern_full = '{(\[raw\].*?\[/raw\])}is';
    $pattern_contents = '{\[raw\](.*?)\[/raw\]}is';
    $pieces = preg_split($pattern_full, $content, -1, PREG_SPLIT_DELIM_CAPTURE);

    foreach ($pieces as $piece) {
        if (preg_match($pattern_contents, $piece, $matches)) {
            $new_content .= $matches[1];
        } else {
            $new_content .= wptexturize(wpautop($piece));
        }
    }

    return $new_content;
}

remove_filter('the_content', 'wpautop');
remove_filter('the_content', 'wptexturize');

add_filter('the_content', 'my_formatter', 99);
```
Now in any page add 

```
[raw]
<script type="text/javascript">
document.write('Im in ur contuntz, running ur skriptz!');
</script>
[/raw]
```

#### Bootstrap

To remove extra ```<p>```'s from WordPress default layouts

```php
remove_filter('the_content','wpautop';
remove_filter('the_excerpt','wpautop';

```

#### Upload extra file types

Add this to your theme's ```functions.php```

```PHP
add_filter('upload_mimes', 'custom_upload_mimes');

function custom_upload_mimes ( $existing_mimes=array() ) {
    // add the file extension to the array
    $existing_mimes['svg'] = 'mime/type';
        // call the modified list of extensions
    return $existing_mimes;
}
```
 

