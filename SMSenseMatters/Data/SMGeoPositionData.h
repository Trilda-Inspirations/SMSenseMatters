//
//  SMGeoPositionData.h
//  SMSenseMatters
//
//  Created by Alex Blundell on 27/03/2016.
//  Copyright © 2016 Alex Blundell. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <SMSenseMatters/SMSenseMatters.h>

@interface SMGeoPositionData : SMSensorData

@property (nonatomic) CLLocationDegrees latitude;

@property (nonatomic) CLLocationDegrees longitude;

@property (nonatomic) CLLocationDistance altitude;

- (id)initWithPosition:(CLLocationCoordinate2D)position altitude:(CLLocationDistance)altitude;


@end
