### WordPress and JQuery

##### Setup your JQuery/ javascript external file

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

##### Now edit your child-theme's ```functions.php``` and add:

```php

function add_my_script() {
    wp_enqueue_script(
        'my_script', // name your script so that you can attach other scripts and de-register, etc.
        '/my_script.js', // this is the location of your script file
        array() // this array lists the scripts upon which your script depends
    );
}
```

##### Finally,  there's (at least) two ways that you can add your script to a page

To add to all WordPress pages:

```add_action( 'wp_enqueue_scripts', 'add_my_script' );```

To add only to certain WordPress pages:

```add_shortcode( 'my_script', 'add_my_script' ); ```

When adding to only certain pages

- Open the WP page you'd like to edit in text mode.
- Edit the WordPress page where you want the javascript to run,
- Add the shortcode like this ```[my_script]``` 

I see a use case for ```shortcodes``` when using random internet scripts to do different things or testing. So, keep in mind for that when using the  shortcode option, you'll need to add a new function to ```functions.php``` for every new script you add. 
