# Image Manipulation
We will be using [Processing](https://processing.org/) to go through this code, so if you don't have it you may want to download and install that. All the code in this repo should work on Processing 2, so you should not have any issues if you don't have version 3 yet.

### Processing
- Processing uses Java
- A default sketch has
	- setup function
	- draw function
- You can add event listeners
	- keyPressed()
	- mousePressed()
	- mouseDragged()
	- mouseReleased()

#### Inside Setup
Setup gets called once at the beginning so we naturally do everything we need to setup. In our case we will be drawing everything once so we will manipulate the pixels once and then draw them to the screen.
- loadImage: returns PImage
- image: draws the PImage to the screen.


#### ColorEffects.pde
This is where we have the bulk of the pixel manipulation going on. The main thing to note is that all the functions use `for` loops to iterate through the pixels in the image. Processing stores this array as one long array of colors, with which it fills the screen starting from the top left and working down row by row. Below, in the double `for` loop, the `i` can be thought of as the row and the `j` as the column.
```java
for (int i=0; i < img.height; ++i) {
    for (int j=0; j < img.width; ++j) {  
      int loc = i*img.width + j;
      color currentColor = img.pixels[loc];
   
   	  // Manipulate the color here.
 
    }
  }
```
The `loc` variable is row and column info converted back to the pixel location in the array.

Here are some links that were used to create the some of the effects.
- [Instagram Photoshop Filter](http://mashable.com/2013/10/20/photoshop-instagram-filters/#NwiZhWpIHgqo)
- [Brightness Adjustments](http://www.dfstudios.co.uk/articles/programming/image-programming-algorithms/image-processing-algorithms-part-4-brightness-adjustment/)
- [Contrast Adjustments](http://www.dfstudios.co.uk/articles/programming/image-programming-algorithms/image-processing-algorithms-part-5-contrast-adjustment/)
- Blend: Result Color = (Top Color) * (Bottom Color) /255
- [Level Adjustments](http://www.dive.snoack.de/tutorials/e_Basics_01.html)
- [Level Adjustments in Shaders](http://http.developer.nvidia.com/GPUGems/gpugems_ch22.html)
- [Pixel Sort](https://github.com/jeffThompson/PixelSorting/blob/master/SortByHighestRGBValue/SortByHighestRGBValue.pde)

#### Helpers.pde
This was just a place to put functions and classes that were more like tool or repetitive math functions. Like `clamp` which isn't built into processing. Clamp takes a value and if its our of range it will give it the lower or higher value.

