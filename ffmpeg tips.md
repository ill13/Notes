


Blur
Combine videos for side-by-side sync
Concat N videos into one
Convert webm to mp4	
Crop
Cut/Trim Video with NO re-encoding
Cut/Trim Video with Re-encode [for wonky video/keyframe]
Cut/Trim Video with Re-encode and Upscale
Keying by color
Make a scroll text video for overlay
Merge Audio with video [add soundtrack]
Overlay Videos
Overlay centering
Overlay with Video and and PNG Image
Overlay with Video and two PNG Images and Scrolling Text
Remove silence
Reverse video
Scale/resize video DOWN
Scale/resize video UP
Scale with black borders and video centered
Scroll Text L to R
Using a text file script


**Reverse video:**
	```ffmpeg -i input.mp4 -vf reverse output_reversed.mp4```

**Concat N videos into one:**
	Create file with names of videos to concatenate called 'vid_list.txt'
		file output.mp4
		file output_reversed.mp4
	Execute:	
		```ffmpeg -f concat -i vid_list.txt -c copy output_concat.mp4```

**Combine videos for side-by-side sync**
	```ffmpeg -i input.mp4 -i input2.mp4 -filter_complex hstack output_hstack.mp4```

Scale/resize video DOWN:
	```ffmpeg -i input.mp4  -vf scale="iw/2:ih/2" output_downscaled_hlf.mp4 ```
	
Scale/resize video UP:
	```ffmpeg -i input.mp4  -vf scale="iw*2:ih*2" output_upscaled_dbl.mp4```
	
Rescale with black borders and video centered:
	```ffmpeg -i input.mp4 -vf "pad=width=512:height=512:x=-1:y=-1:color=black" output_centered.mp4```

Remove silence:
	```ffmpeg -i input.mp3 -af silenceremove=start_periods=1:stop_periods=1:detection=peak output_remove_silence.mp3```
	
Cut/Trim Video with NO re-encoding:
	```ffmpeg -i input.mp4 -ss 00:00:13 -codec copy -t 6 output_trim_no_reencode.mp4```
		
**Cut/Trim Video with Re-encode [for wonky video/keyframe]:**	
	```ffmpeg -i input.mp4 -ss 00:00:01 -t 7 output_trim_reencoded.mp4```
	
Cut/Trim Video with Re-encode and Upscale
	```ffmpeg -i input.webm -ss 00:00:13 -t 6 -filter:v scale=3840:-1 output_trim_encode_scaled.mp4```
	
Crop:
	```ffmpeg -i input.mp4 -filter:v "crop=512:512:0:0" output_crop.mp4```	
	
	out_w is the width of the output rectangle
    out_h is the height of the output rectangle
    x and y specify the top left corner of the output rectangle

Convert webm to mp4	
	```ffmpeg -i input.webm -c:v copy -strict experimental output_convert.mp4```	

Scroll Text L to R:
	```ffmpeg -y -i input.mp4 -vf "drawtext=fontcolor=white:fontsize=40:fontfile=Poppins-Bold.ttf:textfile=scroll.txt:reload=1:y=h-line_h-52:x=w-(mod(20*n\,w+tw)-tw/40)" output_ticker.mp4```


Using a text file script"
	Save this as 'ffmpeg_0.txt':
		[0]overlay=0:0[out];
		[out][2]overlay=0:0[ov];
		[ov]drawtext=fontcolor=white:fontsize=40:fontfile=Poppins-Bold.ttf:textfile=scroll.txt:reload=1:y=h-line_h-38:x=w-(mod(20*n\,w+tw)-tw/40)[final]
	
	Execute this:
		```ffmpeg -i input.mp4 -i img.png -i btm.png -filter_complex_script ffmpeg_0.txt -map "[final]" output_script.mp4```
		
		```ffmpeg -i img0.png -i img1.jpg -i img2.jpg -filter_complex_script kburns_fx.txt -map "[final]" output_script.mp4```


Blur:
	ffmpeg.exe -i input.mp4 -vf boxblur=1.5:1:cr=0:ar=0,noise=c0s=20:c0f=t+u -c:v libx264 output_blur.mp4```

Merge / Overlay Videos:
	ffmpeg.exe -i input.mp4 -i input2.mp4 -filter_complex "[0]format=rgba,colorchannelmixer=aa=1.0[fg]; [1][fg]overlay[out]" -map [out] -pix_fmt yuv420p -c:v libx264 -crf 18 output_merge_alpha.mp4```
	
	```ffmpeg -y -i input.mp4 -i img.png -filter_complex "[0]overlay=0:0[out]" -map [out] -map 0:a? output.mp4```
	
	```ffmpeg -y -i input.mp4 -i img.png -filter_complex "[0]overlay=0:0[out]" -map [out] output_merge_easy.mp4```

Centering overlay
	```ffmpeg -i input.mp4 -i logo.png -filter_complex "overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -codec:a copy output_overlay_centered.mp4```

Merge Audio with video [add soundtrack]
	```ffmpeg -i input.mp4 -i news-corporate-8307.mp3 -filter_complex "[1:a]volume=0.30,apad[A];[0:a][A]amerge[out]" -c:v copy -map 0:v -map [out] -y output_mergedAV.mp4```

Color Key:
	```ffmpeg -i background.png -i input.mp4 -filter_complex "[1:v]colorkey=0x3BBD1E:0.3:0.2[ckout];[0:v][ckout]overlay[out]" -map "[out]" output_colorkeyed.mp4```
	
Keying and Overlay:
	```ffmpeg -i input.mp4 -i input2.mp4 -filter_complex "[1:v]colorkey=0x0fe100:0.3:0.1[ckout];[0:v][ckout]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2+28[out]" -map [out] -map 1:a -c:a copy output_colorkeyed2.mp4```

	...plus noise!:
	```ffmpeg -i input.mp4 -i input2.mp4 -filter_complex "[1:v]colorkey=0x0fe100:0.3:0.1[ckout];[0:v][ckout]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2+28[out];[out]boxblur=0.9:1:cr=0:ar=0,noise=c0s=20:c0f=t+u[final]" -map [final] -map 1:a -c:a copy output.mp4```
	
Overlay with Video and and PNG Image:
		```ffmpeg -y -i input.mp4 -i img.png - -filter_complex "[0]overlay=0:0[out];[out][2]overlay=0:0[final]" -map [final] -map 0:a? output_vid_and_img.mp4```
		

Make a scroll text video for overlay:
	```ffmpeg -y -f lavfi -i color=size=1810x51:duration=12:rate=30:color=black -vf "drawtext=fontcolor=white:fontsize=40:fontfile=Poppins-Bold.ttf:textfile=scroll.txt:reload=1:y=h-line_h-6:x=w-(mod(20*n\,w+tw)-tw/40)" output_vid_with_ticker.mp4```	

	
Overlay with Video and two PNG Images and Scrolling Text:
		```ffmpeg -y -i input.mp4 -i img.png -i btm.png -filter_complex "[0]overlay=0:0[out];[out][2]overlay=0:0[ov];[ov]drawtext=fontcolor=white:fontsize=40:fontfile=Poppins-Bold.ttf:textfile=scroll.txt:reload=1:y=h-line_h-38:x=w-(mod(20*n\,w+tw)-tw/40)[final]" -map [final] -map 0:a? output_vid_and_2_imgs.mp4```
		
Overlay with Video and two PNG Images and Scrolling Text:
		```ffmpeg -y -i input.mp4 -i img.png -i btm.png -filter_complex "[0]overlay=x=0:y=0[out];[out][2]overlay=x=0:y=0[ov];[ov]drawtext=fontcolor=white:fontsize=40:fontfile=Poppins-Bold.ttf:textfile=scroll.txt:reload=1:y=h-line_h-38:x=w-(mod(20*n\,w+tw)-tw/40)[final]" -map [final] -map 0:a? output.mp4```
		

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Combined:

	```ffmpeg -y -i city_trim_00_720.mp4 -i sync_12-26-05.mp4 -filter_complex "[1:v]colorkey=0x0fe100:0.3:0.1[ckout];[0:v][ckout]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2+28[out];[out]boxblur=1.5:1:cr=0:ar=0,noise=c0s=13:c0f=t+u[final]" -map [final] -map 1:a -c:a copy output.mp4```
	
	```ffmpeg -y -i city_trim_00_720.mp4 -i sync_14-09-47.mp4 -filter_complex "[1:v]colorkey=0x0fe100:0.3:0.1[ckout];[0:v][ckout]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2+28[out];[out]boxblur=1.5:1:cr=0:ar=0,noise=c0s=13:c0f=t+u[final]" -map [final] -map 1:a -c:a copy output.mp4```
	
	
	```ffmpeg -i keying_06.mp4 -i news-corporate-8307.mp3 -filter_complex "[1:a]volume=0.30,apad[A];[0:a][A]amerge[out]" -c:v copy -map 0:v -map [out] -y output.mp4```
	
	```ffmpeg -i key.mp4 -i news-corporate-8307.mp3 -filter_complex "[1:a]volume=0.15,apad[A];[0:a][A]amerge[out]" -c:v copy -map 0:v -map [out] -y output.mp4```















-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Reverse video:
	```ffmpeg -i input2.mp4 -vf reverse reversed2.mp4```

Concat N videos into one:
	Create file with names of videos to concatenate
		file input_vid.mp4
		file reversed.mp4
		
	```ffmpeg -f concat -i vid_list.txt -c copy output_joined2.mp4```

Combine videos for side-by-side sync
	```ffmpeg -i small.mp4 -i small-upscale.mp4 -filter_complex hstack output.mp4```

Scale/resize video DOWN:
	```ffmpeg -i city_trim_00.mp4  -vf scale="iw/2:ih/2" city_trim_00_720.mp4``` 
	
Scale/resize video UP:
	```ffmpeg -i input.mp4  -vf scale="iw*2:ih*2" output_dbl.mp4``` 
	
Rescale with black borders and video centered:
	```ffmpeg -i input.mp4 -vf "pad=width=512:height=512:x=-1:y=-1:color=black" output.mp4```

Remove silence:
	```ffmpeg -i cora.mp3 -af silenceremove=start_periods=1:stop_periods=1:detection=peak OUTPUT.mp3```
	
Cut/Trim Video with NO re-encoding:
	```ffmpeg -i bbc.webm -ss 00:00:13 -codec copy -t 6 bbc_t.mp4```
		
Cut/Trim Video with Re-encode [for wonky video/keyframe]:	
	```ffmpeg -i fox_trim.mp4 -ss 00:00:01 -t 7 fox_trim2.mp4```
	
Cut/Trim Video with Re-encode and Upscale
	```ffmpeg -i bbc.webm -ss 00:00:13 -t 6 -filter:v scale=3840:-1 bbc_t.mp4```
	
Crop:
	```ffmpeg -i grain_00.mp4 -filter:v "crop=512:512:0:0" crop_grain.mp4```	
	
	out_w is the width of the output rectangle
    out_h is the height of the output rectangle
    x and y specify the top left corner of the output rectangle

Convert webm to mp4	
	```ffmpeg -i sbream.webm -c:v copy -strict experimental fox.mp4```	

Scroll Text L to R:
	``````ffmpeg -y -i news.mp4 -vf "drawtext=fontcolor=white:fontsize=40:fontfile=Poppins-Bold.ttf:textfile=scroll.txt:reload=1:y=h-line_h-52:x=w-(mod(20*n\,w+tw)-tw/40)" scroll2.mp4```

Blur:
	```ffmpeg -i input.mp4 -vf boxblur=1.5:1:cr=0:ar=0,noise=c0s=20:c0f=t+u -c:v libx264 output_blurred.mp4```

Merge / Overlay Videos:
	```ffmpeg -i input.mp4 -i input2.mp4 -filter_complex "[0]format=rgba,colorchannelmixer=aa=1.0[fg]; [1][fg]overlay[out]" -map [out] -pix_fmt yuv420p -c:v libx264 -crf 18 output_overlay.mp4```

Centering overlay
	```ffmpeg -i input.mp4 -i logo.png -filter_complex "overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -codec:a copy output.mp4```

Merge Audio with video [add soundtrack]
	```ffmpeg -i keying_05.mp4 -i news-corporate-8307.mp3 -filter_complex "[1:a]volume=0.30,apad[A];[0:a][A]amerge[out]" -c:v copy -map 0:v -map [out] -y output-final.mp4```

Color Key:
	```ffmpeg -i background.png -i video.mp4 -filter_complex "[1:v]colorkey=0x3BBD1E:0.3:0.2[ckout];[0:v][ckout]overlay[out]" -map "[out]" output.mp4```
	
Keying and Overlay:
	```ffmpeg -i city_trim_00_720.mp4 -i sync_12-26-05.mp4 -filter_complex "[1:v]colorkey=0x0fe100:0.3:0.1[ckout];[0:v][ckout]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2+28[out]" -map [out] -map 1:a -c:a copy keying_03.mp4```

	...plus noise!:
	```ffmpeg -i city_trim_00_720.mp4 -i sync_12-26-05.mp4 -filter_complex "[1:v]colorkey=0x0fe100:0.3:0.1[ckout];[0:v][ckout]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2+28[out];[out]boxblur=0.9:1:cr=0:ar=0,noise=c0s=20:c0f=t+u[final]" -map [final] -map 1:a -c:a copy keying_05.mp4```
	
Overlay with Video and two PNG Images:
		``````ffmpeg -y -i news.mp4 -i pip.png - -filter_complex "[0]overlay=0:0[out];[out][2]overlay=0:0[final]" -map [final] -map 0:a? test.mp4```
		

Make a scroll text video for overlay:
	``````ffmpeg -y -f lavfi -i color=size=1810x51:duration=12:rate=30:color=black -vf "drawtext=fontcolor=white:fontsize=40:fontfile=Poppins-Bold.ttf:textfile=scroll.txt:reload=1:y=h-line_h-6:x=w-(mod(20*n\,w+tw)-tw/40)" output.mp4```	

	
Overlay with Video and two PNG Images and Scrolling Text:
		``````ffmpeg -y -i news.mp4 -i pip.png -i btm.png -filter_complex "[0]overlay=0:0[out];[out][2]overlay=0:0[ov];[ov]drawtext=fontcolor=white:fontsize=40:fontfile=Poppins-Bold.ttf:textfile=scroll.txt:reload=1:y=h-line_h-38:x=w-(mod(20*n\,w+tw)-tw/40)[final]" -map [final] -map 0:a? test.mp4```
		
Overlay with Video and two PNG Images and Scrolling Text:
		``````ffmpeg -y -i news.mp4 -i pip.png -i btm.png -filter_complex "[0]overlay=x=0:y=0[out];[out][2]overlay=x=0:y=0[ov];[ov]drawtext=fontcolor=white:fontsize=40:fontfile=Poppins-Bold.ttf:textfile=scroll.txt:reload=1:y=h-line_h-38:x=w-(mod(20*n\,w+tw)-tw/40)[final]" -map [final] -map 0:a? test.mp4```
		

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Combined:

	``````ffmpeg -y -i city_trim_00_720.mp4 -i sync_12-26-05.mp4 -filter_complex "[1:v]colorkey=0x0fe100:0.3:0.1[ckout];[0:v][ckout]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2+28[out];[out]boxblur=1.5:1:cr=0:ar=0,noise=c0s=13:c0f=t+u[final]" -map [final] -map 1:a -c:a copy keying_06.mp4```
	
	``````ffmpeg -y -i city_trim_00_720.mp4 -i sync_14-09-47.mp4 -filter_complex "[1:v]colorkey=0x0fe100:0.3:0.1[ckout];[0:v][ckout]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2+28[out];[out]boxblur=1.5:1:cr=0:ar=0,noise=c0s=13:c0f=t+u[final]" -map [final] -map 1:a -c:a copy keying_06.mp4```
	
	
	```ffmpeg -i keying_06.mp4 -i news-corporate-8307.mp3 -filter_complex "[1:a]volume=0.30,apad[A];[0:a][A]amerge[out]" -c:v copy -map 0:v -map [out] -y output-final.mp4```
	
	```ffmpeg -i key.mp4 -i news-corporate-8307.mp3 -filter_complex "[1:a]volume=0.15,apad[A];[0:a][A]amerge[out]" -c:v copy -map 0:v -map [out] -y output-final.mp4```


















