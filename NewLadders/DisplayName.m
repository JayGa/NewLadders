//
//  DisplayName.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/16/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "DisplayName.h"

@implementation DisplayName

-(DisplayName*)initWithFirstName:(NSString *)firstname andLastName:(NSString *)lastname{
    
    self = [super init];
    gdisplayName = [NSString stringWithFormat:(@"%@ %@",[lastname uppercaseString], firstname)];
    return self;
}

-(DisplayName*)initWithJob:(NSString *)jobName andPoster:(NSString *)postersName{
    self = [super init];
    gdisplayName = [NSString stringWithFormat:(@"%@-%@", jobName, postersName)];
    return self;
}
@end
