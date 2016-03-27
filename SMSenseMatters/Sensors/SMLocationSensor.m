//
//  SMLocationSensor.m
//  SMSenseMatters
//
//  Created by Alex Blundell on 27/03/2016.
//  Copyright © 2016 Alex Blundell. All rights reserved.
//

#import "SMLocationSensor.h"
#import "SMGeoPositionData.h"

@interface SMLocationSensor ()

@property (nonatomic) CLLocationCoordinate2D lastPosition;

@property (nonatomic) CLLocationDistance altitude;

@property (nonatomic, retain) CLLocationManager *locationManager;

@end


@implementation SMLocationSensor




- (id)initWithSenseCallback:(SenseCallback)callback {
    self = [super initWithSenseCallback:callback];
    if (self) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = [locations lastObject];
    if (location) {
        _lastPosition = location.coordinate;
        _altitude = location.altitude;
    }
}

- (id)initWithSenseCallback:(SenseCallback)callback timeInterval:(NSTimeInterval)secs {
    self = [self initWithSenseCallback:callback];
    if (self) {
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:secs target:self selector:@selector(sense) userInfo:nil repeats:YES];
        [timer fire];
        
    }
    return self;
}

- (void)sense {
    if (self.callback) {
        SMGeoPositionData *data = [[SMGeoPositionData alloc] initWithPosition:_lastPosition altitude:_altitude];
        self.callback(data);
    }
}



@end