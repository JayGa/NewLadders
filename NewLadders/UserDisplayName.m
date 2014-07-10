//
//  UserDisplayName.m
//  NewLadders
//
//  Created by Jay Gaonkar on 7/9/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "UserDisplayName.h"

@implementation UserDisplayName

-(UserDisplayName*)initWithFirstName:(NSString *)firstname andLastName:(NSString *)lastname{
    
    self = [super init];
    gdisplayName = [NSString stringWithFormat:@"%@ %@",[lastname uppercaseString], firstname];
    return self;
}

-(NSString*)getUserDisplayNameString{
    return gdisplayName;
}

@end
