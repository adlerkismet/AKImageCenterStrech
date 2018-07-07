## AKImageCenterStrech
* An easy way to strech image centosymmetric.

## Contents
* How to install：
    * Drag All files in the `AKImageCenterStrech` folder to project
    * Import the main file：`#import "UIImage+RelativeCenterStretch.h"`
* How to use：
```objectivec
//horizon strech:
UIImage *horizonStrechImage = 
[originImage stretchWithFinalWidth:240 leftCapInset:40 leftStretchSpacing:2 rightCapInset:40 rightStretchSpacing:2];
//Vertical strech:
UIImage *verticalStrechImage = [originImage stretchWithFinalHeight:240 topCapInset:40 topStretchSpacing:2 bottomCapInset:40 bottomStretchSpacing:2];
//center Strech:
UIImage *horizonStrechedImage = [originImage stretchWithFinalWidth:240 leftCapInset:40 leftStretchSpacing:2 rightCapInset:40 rightStretchSpacing:2];
UIImage *centerStrechImage = [horizonStrechedImage stretchWithFinalHeight:240 topCapInset:40 topStretchSpacing:2 bottomCapInset:40 bottomStretchSpacing:2];
```
* orgin image:
![AKImageCenterStrech-tenArrow.png](http://kisscu.com/wp-content/uploads/2018/07/AKImageCenterStrech-tenArrow.png)

* strech image:
![AKImageCenterStrech-demo.png](http://kisscu.com/wp-content/uploads/2018/07/AKImageCenterStrech-demo-473x1024.png)


