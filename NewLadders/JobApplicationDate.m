//
//  JobApplicationDate.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/17/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JobApplicationDate.h"


@implementation JobApplicationDate
@synthesize gJobApplicationDate;
-(JobApplicationDate*)initWithJobApplicationDate:(NSDate*)jobApplicationDate{
    
    gJobApplicationDate = jobApplicationDate;
    return gJobApplicationDate;
}

-(NSString*)prepareJobApplicationDateString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd-mmm-yyyy";
    return [formatter stringFromDate:gJobApplicationDate];
}

-(NSString*)jobApplicationDateKeyString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMdd";
    return [formatter stringFromDate:gJobApplicationDate];
}
@end
