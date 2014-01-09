JavascriptCore ObjC bridge broken on 64bit ARM devices

the new Javascript-ObjC bridge on iOS7 is broken on 64bit iOS ARM devices when using an exported property declared as a CGFloat from javascript. When accessing the CGFloat property of a bridged ObjC object, the value set or get is wrong, always a (very nearly) zero value.

1. download attached project.
2. notice two targets one 32 bit, the other 64 bit
3. run the 32 bit target on an 64 bit iOS device (i.e.: iPhone5s), NOT the simulator
observe the logged text in the view on screen, the values are reported correctly
4. run the 64 bit target on an 64 bit iOS device
observe the values are wrong

values that get logged should be the same on both architectures

values logged are incorrect

iOS 7.0.4