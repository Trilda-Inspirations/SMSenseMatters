//
//  SMProximitySensor.m
//  SMSenseMatters
//
//  Created by Alex Blundell on 24/09/2015.
//  Copyright © 2015 Alex Blundell. All rights reserved.
//

#import "SMProximitySensor.h"
#import "SMProximityData.h"

@interface SMProximitySensor ()

@property (nonatomic) BOOL proximity;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation SMProximitySensor

+ (BOOL)isAvailable {
    return [UIDevice currentDevice].proximityMonitoringEnabled;
}

- (id)initWithSenseCallback:(SenseCallback)callback {
    self = [super initWithSenseCallback:callback];
    if (self) {
        [[UIDevice currentDevice] setProximityMonitoringEnabled:YES];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(proximityChanged:) name:UIDeviceProximityStateDidChangeNotification object:nil];
        _proximity = [[UIDevice currentDevice] proximityState];
    }
    return self;
}

- (void)proximityChanged:(NSNotification *)note {
    _proximity = [[UIDevice currentDevice] proximityState];
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
    SMProximityData *data = [[SMProximityData alloc] initWithProximity:_proximity];
    if (self.callback) {
        self.callback(data);
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
