//
//  UserDisplayName.m
//  NewLadders
//
//  Created by Jay Gaonkar on 7/9/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "UserDisplayName.h"

@implementation UserDisplayName{
    
    NSString* gReportString;
}

-(UserDisplayName*)initWithFirstName:(NSString *)firstname andLastName:(NSString *)lastname{
    
    self = [super init];
    gdisplayName = [NSString stringWithFormat:@"%@ %@",[lastname uppercaseString], firstname];
    return self;
}

-(void )callToAppendJobSeekerToApplicationReport:(JobSeekerIDName*)jobSeekerIDName{

    [jobSeekerIDName appendToReportString:gdisplayName];
}
-(NSString*)appendUserDisplayNameString{
    NSString *reportString = @"";
    return [reportString stringByAppendingString: gdisplayName];
}
@end
