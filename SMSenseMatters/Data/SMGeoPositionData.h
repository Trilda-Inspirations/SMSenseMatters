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

/**
 *  Latitude position of the geolocation
 */
@property (nonatomic) CLLocationDegrees latitude;


/**
 *  Longitude position of the geolocation
 */
@property (nonatomic) CLLocationDegrees longitude;


/**
 *  Altitude of the geolocation
 */
@property (nonatomic) CLLocationDistance altitude;


/**
 *  Initialises a Geo Position Data structure
 *
 *  @param position Position
 *  @param altitude Altitude (m)
 *
 *  @return instance
 */
- (id)initWithPosition:(CLLocationCoordinate2D)position altitude:(CLLocationDistance)altitude;


@end
