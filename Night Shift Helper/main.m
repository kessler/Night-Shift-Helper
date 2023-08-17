//
//  main.m
//  Night Shift Helper
//
//  Created by Jim Macintosh Shi on 6/30/19.
//  Copyright © 2019 Creative Sub. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBBlueLightClient.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        CBBlueLightClient* blueLightClient = [[CBBlueLightClient alloc] init];
        
        if (argc == 1) {
            Status status;
            [blueLightClient getBlueLightStatus:(&status)];
            
            if (status.enabled == FALSE) {
                // Enables Night Shift and set temperature automatically.
                float optimalTemperature = 1; //getCurrentOptimalTemperature();
                [blueLightClient setStrength:optimalTemperature commit:YES];
                [blueLightClient setEnabled:YES];
            } else {
                [blueLightClient setEnabled:NO];
            }
            
        } else if (argc == 2) {
            // Enable or disable Night Shift.
            if (strcmp(argv[1], "enable") == 0) {
                [blueLightClient setEnabled:YES];
            } else if (strcmp(argv[1], "disable") == 0) {
                [blueLightClient setEnabled:NO];
            } else {
                printf("The second argument must be \"enable\" or \"disable\"!\n");
            }
        } else if (argc == 3) {
            // Set current Night Shift color temperature.
            if (strcmp(argv[1], "set") != 0) {
                printf("The second argument must be \"set\"!\n");
                return 0;
            }
            
            float newNightShiftTemperature = strtof(argv[2], NULL);
            if ((newNightShiftTemperature > 1.0) || (newNightShiftTemperature < 0.0)) {
                printf("The temperature must be within 0.0 and 1.0!\n");
                return 0;
            }

            [blueLightClient setStrength:newNightShiftTemperature commit:YES];
        }
    }
    return 0;
}
