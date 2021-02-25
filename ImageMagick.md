#### Using ImageMagick to make a product box

https://linuxconfig.org/how-to-install-imagemagick-7-on-ubuntu-18-04-linux

https://linoxide.com/tools/install-imagemagick-on-debian/

### Install older version of ImageMagick: 
- Install WSL
- 6.8.3.9 or 6.7.6.10 or 6.8.2-10 should work
- find the version you want here: 
  - https://sourceforge.net/projects/imagemagick/files/old-sources/6.x/
```wget https://sourceforge.net/projects/imagemagick/files/old-sources/6.x/6.8/ImageMagick-6.8.2-10.tar.gz/download```
- rename the file called 'download' to 'ImageMagick-6.8.2-10.tar.gz'

```bash
tar -xzvf ImageMagick-6.8.2-10.tar.gz
cd ImageMagick-6.8.2-10
sudo .configure
sudo make
sudo make install
sudo ldconfig /usr/local/lib
```


```identify -list format``` check that PNG ability exists

```sudo apt-get install bc``` install calculator

```export PATH=$PATH:$PWD``` make current directory a part of PATH so scripts (in the directory) can work
	
Make an image that has the (as you are facing) the left side and the front


### Box making command
Keep:

```./3dcover  -s 279 -o 10 -m g -u 60 -p 6 -l .75 -F 80,50 -d 100 -r 75 -g 0.010 -v '#fff'  -b '#fff' -P 48  sf2.png out.png```
```
-s 	279: 	where the 'side' ends
-o	10		vertical white line separating the side from the front
-m	g		(g)round shadow
-u	60		umbra: gray level for the dark part	of the shadow
-p	6		penumbra: gray level for the light part of the shadow
-l	0.75	shadow length
-F	80,30	fade spine from 80% dark to 30% light 			
-d 	100		diamter of vignette
-r	75		ramp of vignette
-g	0.010	gamma of vignette
-b none		(b)ackground set to none. Using PNG for transparency
-P	48		pad with 48 pixels all around

sf.png		input file
out.png		output file
```



adjust H/S in ps: set to +48, +50, -2



***















#### Bash
```bash
# Generate a Spine Image
convert -size 200x40 xc:skyblue \
  -pointsize 20 -gravity north -annotate +5+0 'IM Examples' \
  -pointsize 10 -gravity south -annotate +0+0 'ImageMagick' \
  -stroke blue -strokewidth 2 -draw 'line 30,0 30,40' \
  -rotate -90 box_spine.jpg

# generate the front cover
convert -size 150x200 xc:skyblue \
  -fill black -pointsize 20 -gravity north -annotate +0+5 'IM Examples' \
  -fill blue -pointsize 15 -gravity northeast -annotate +5+28 'Box Set' \
  -fill black -pointsize 15 -gravity south -annotate +0+5 'ImageMagick' \
  -stroke blue -strokewidth 2 -draw 'line 0,169 150,169' \
  \( logo.gif -resize 100x100 \) \
  -gravity center -compose multiply -composite box_front.jpg

# Distort both images and merge using common points.
convert \
  \( box_spine.jpg -alpha set -virtual-pixel transparent \
     +distort Perspective \
         '0,0 -30,20  0,200 -30,179  40,200 0,200  40,0 0,0' \) \
  \( box_front.jpg -alpha set -virtual-pixel transparent \
     +distort Perspective \
         '0,0 0,0  0,200  0,200  150,200 100,156  150,0 100,30' \) \
  \
  -background black -compose plus -layers merge  +repage \
  -bordercolor black -compose over -border 15x2    box_set.jpg
 ```
 
 #### Powershell
 
 - Make sure there's a space on each side of every ```(``` and ```)```
 - Convert all ```'``` to ```"```
 - Use *Find/Replace* with  ```(\h*\R)+``` and ```\x20``` to convert all commands to single line
 - Don't forget to delete all the leftover ```\```'s
  
 ```powershell
# Generate a Spine Image

convert -size 200x40 xc:skyblue -pointsize 20 -gravity north -annotate +5+0 "IM Examples" -pointsize 10 -gravity south -annotate +0+0 "ImageMagick" -stroke blue -strokewidth 2 -draw "line 30,0 30,40" -rotate -90 box_spine.jpg

# generate the front cover
 
convert -size 150x200 xc:skyblue -fill black -pointsize 20 -gravity north -annotate +0+5 "IM Examples" -fill blue -pointsize 15 -gravity northeast -annotate +5+28 "Box Set" -fill black -pointsize 15 -gravity south -annotate +0+5 "ImageMagick" -stroke blue -strokewidth 2 -draw "line 0,169 150,169" ( rect10.png -resize 100x100 ) -gravity center -compose multiply -composite box_front.jpg

# Distort both images and merge using common points.

convert ( box_spine.jpg -alpha set -virtual-pixel transparent +distort Perspective "0,0 -30,20  0,200 -30,179  40,200 0,200  40,0 0,0" ) ( box_front.jpg -alpha set -virtual-pixel transparent +distort Perspective "0,0 0,0  0,200  0,200  150,200 100,156  150,0 100,30" )  -background black -compose plus -layers merge  +repage -bordercolor black -compose over -border 15x2 box_set.jpg
 
 
