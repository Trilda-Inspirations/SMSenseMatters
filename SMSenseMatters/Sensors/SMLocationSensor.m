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

@property (nonatomic, retain) NSTimer *timer;

@end


@implementation SMLocationSensor




- (id)initWithSenseCallback:(SenseCallback)callback {
    self = [super initWithSenseCallback:callback];
    if (self) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = kCLDistanceFilterNone;
        
        
        if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedAlways) {
            [_locationManager requestWhenInUseAuthorization];
        }
        
        [_locationManager startMonitoringSignificantLocationChanges];
        
        [_locationManager startUpdatingLocation];
        
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [_locationManager requestAlwaysAuthorization];
    }
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
        _timer = [NSTimer scheduledTimerWithTimeInterval:secs target:self selector:@selector(sense) userInfo:nil repeats:YES];
        [_timer fire];
        
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
