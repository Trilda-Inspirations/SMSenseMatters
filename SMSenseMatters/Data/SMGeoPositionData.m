//
//  SMGeoPositionData.m
//  SMSenseMatters
//
//  Created by Alex Blundell on 27/03/2016.
//  Copyright © 2016 Alex Blundell. All rights reserved.
//

#import "SMGeoPositionData.h"

@implementation SMGeoPositionData


- (id)initWithPosition:(CLLocationCoordinate2D)position altitude:(CLLocationDistance)altitude {
    self = [self init];
    if (self) {
        _latitude = position.latitude;
        _longitude = position.longitude;
        _altitude = altitude;
    }
    return self;
}


- (id)serialise {
    NSMutableDictionary *data = [[super serialise] mutableCopy];
    [data setObject:[NSNumber numberWithDouble:_latitude] forKey:@"latitude"];
    [data setObject:[NSNumber numberWithDouble:_longitude] forKey:@"longitude"];
    [data setObject:[NSNumber numberWithDouble:_altitude] forKey:@"altitude"];
    return data;
}



@end
