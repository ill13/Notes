

#### NP++ How to make all that multiline data into one line

- Open the Replace dialog ( Ctrl + H )
- Check the *Wrap around* option.
- Choose the *Regular expression* search mode.
- Fill in the regex ```(\h*\R)+``` in the Find what: zone.
- Fill in the regex ```\x20``` in the Replace with: zone.
- Click on the *Replace All* button




#### Notepad++ add ```some_text``` to every line
1. Press ```Ctrl+H``` to bring up the Find/Replace Dialog.
2. Choose the ```Regular expression``` option near the bottom of the dialog.

To add a word, such as ```test```, at the **beginning of each line**:

- Type ```^``` in the Find what textbox
- Type ```test``` in the Replace with textbox
- Place cursor in the first line of the file to ensure all lines are affected
- Click ```Replace All``` button

To add a word, such as ```test```, at the **end of each line**:

- Type ```$``` in the Find what textbox
- Type ```test``` in the Replace with textbox
- Place cursor in the first line of the file to ensure all lines are affected
- Click ```Replace All``` button

