//
//  CBBlueLightClient.h
//  Night Shift Helper
//
//  Created by Jim Macintosh Shi on 6/30/19.
//  Copyright © 2019 Creative Sub. All rights reserved.
//

#ifndef CBBlueLightClient_h
#define CBBlueLightClient_h

#import <Foundation/Foundation.h>

typedef struct {
    int hour;
    int minute;
} Time;

typedef struct {
    Time start;
    Time end;
} Schedule;

typedef struct {
    BOOL active;
    BOOL enabled;
    BOOL sunSchedulePermitted;
    int mode;
    Schedule schedule;
    unsigned long long disableFlags;
    BOOL available;
} Status;


/// This is a partial copy of the CBBlueLightClient interface in the private CoreBrightness framework.
@interface CBBlueLightClient: NSObject
- (BOOL)setStrength:(float)strength commit:(BOOL)commit;
- (BOOL)setEnabled:(BOOL)enabled;
- (BOOL)getBlueLightStatus:(Status *)status;
@end


#endif /* CBBlueLightClient_h */
