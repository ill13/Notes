#### Notepad++ add ```"``` to  beginning and end of every line

To add a symbol, such as ```"```, at the **beginning and end of each line**:

- Type ```(.+)``` in the Find what textbox
- Type ```"\1"``` in the Replace with textbox
- Place cursor in the first line of the file to ensure all lines are affected
- Click ```Replace All``` button

Find (change to extended mode):

- Type ```\r\n``` in the Find what textbox
- Type ```, ``` in the Replace with textbox
- Place cursor in the first line of the file to ensure all lines are affected
- Click ```Replace All``` button

#### NP++ How to make all that multiline data into one line

- Open the Replace dialog ( Ctrl + H )
- Check the *Wrap around* option.
- Choose the *Regular expression* search mode.
- Fill in the regex ```(\h*\R)+``` in the Find what: zone.
- Fill in the regex ```\x20``` in the Replace with: zone.
- Click on the *Replace All* button



***
#### Notepad++ add ```some_text``` to every line
1. Press ```Ctrl+H``` to bring up the Find/Replace Dialog.
2. Choose the ```Regular expression``` option near the bottom of the dialog.

To add a word, such as ```some_text```, at the **beginning of each line**:

- Type ```^``` in the Find what textbox
- Type ```some_text``` in the Replace with textbox
- Place cursor in the first line of the file to ensure all lines are affected
- Click ```Replace All``` button

To add a word, such as ```some_text```, at the **end of each line**:

- Type ```$``` in the Find what textbox
- Type ```some_text``` in the Replace with textbox
- Place cursor in the first line of the file to ensure all lines are affected
- Click ```Replace All``` button



***
#### Notepad++ Remove duplicates

To remove duplicate lines. This only sort of works...  

- Press Ctrl + H, 
- Use ```^(.*?)$\s+?^(?=.*^\1$)```
- In search mode check "Regular expression" 
- Choose on replace all

