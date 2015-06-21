//
//  CDTLamoSettings.m
//  Lamo
//
//  Created by Ethan Arbuckle on 6/5/15.
//  Copyright (c) 2015 CortexDevTeam. All rights reserved.
//

#import "CDTLamoSettings.h"

@implementation CDTLamoSettings

+ (id)sharedSettings {
    
    static dispatch_once_t p = 0;
    __strong static id _sharedObject = nil;
    
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    
    return _sharedObject;
}

- (id)init {
    
    if (self = [super init]) {
        
        //create default settings
        NSDictionary *defaultSettings = @{
                                          isEnabledKey : @YES
                                          };
        
        [[NSUserDefaults standardUserDefaults] registerDefaults:defaultSettings];
        
    }
    
    return self;
}

- (void)saveChanges {
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setEnabled:(BOOL)enabled {
    
    [[NSUserDefaults standardUserDefaults] setBool:enabled forKey:isEnabledKey];
    [self saveChanges];
}

- (BOOL)isEnabled {
    
    return YES;//[[NSUserDefaults standardUserDefaults] boolForKey:isEnabledKey];
}

@end