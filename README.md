# SMSenseMatters

[![Build Status](https://travis-ci.org/spikeyfish2/SMSenseMatters.svg?branch=master)](https://travis-ci.org/spikeyfish2/SMSenseMatters)

A library for accessing sensors on an iOS device in a unified way, using the callback methodology.

---

**Problem:** In order to access different sensors using built-in iOS classes, there are many API's and techniques that need to be adopted.

**Solution:** This library creates a common API between your code and the sensors on an iOS device so that you can access the data you need easier.

---

The following sensors are currently supported (providing the device you're targetting also supports it):

* Accelerometer
* Battery
* Bluetooth
* Magnetometer
* Proximity
* Steps

## Installation
To install, download this repository to your computer, and copy the .xcodeproj file into your Xcode workspace. You can then add the `libSMSenseMatters.a` static library as a dependency of your project in the *Project Settings* menu under the *General* tab.


## Usage 

### Documentation
Documentation can be found [here](http://smsensematters.alexblundell.com).

### Example

#### Accelerometer
The following example will subscribe to updates from the accelerometer, with a time interval of 30 seconds.

```
#import <SMSenseMatters/SMSenseMatters.h>

...

_sensor = [[SMAccelerometerSensor alloc] initWithSenseCallback:^(SMSensorData *senseData) {
        SM3DMotionSensorData *accData = (SM3DMotionSensorData *)senseData;
        NSLog(@"Data received: %f, %f, %f", accData.xAxis, accData.yAxis, accData.zAxis);
    } timeInterval:30.0f];

```


## Troubleshooting
### Not receiving background updates?
If you're having issues with receiving data when your app is in the background, then ensure that the relevant *Background Modes* are enabled for your app. You should also register for background updates in your `applicationDidEnterBackground:` delegate method:

```
- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        NSLog(@"=== Background has expired ===");
    }];
}
```

