//
//  JobAppliedDateResume.m
//  NewLadders
//
//  Created by Jay Gaonkar on 7/11/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JobAppliedDateResume.h"

@implementation JobAppliedDateResume

- (JobAppliedDateResume*)initWithAppliedDate:(JobApplicationDate*)jobApplicationDate andResumeID:(IDentifer*)resumeID{
    
    self = [super init];
    gJobApplicationDate = jobApplicationDate;
    gresumeID = resumeID;
    return self;
}

-(NSString*)jobApplicationDateReport{
    return [self prepareJobApplicationDateString:gJobApplicationDate];
}

-(NSString*)jobApplicationDateKeyString:(NSDate*)jobApplicationDate{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMdd";
    return [formatter stringFromDate:jobApplicationDate];
}

-(NSString*)prepareJobApplicationDateString:(NSDate*)jobApplicationDate{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd-MM-yyyy";
    return [formatter stringFromDate:jobApplicationDate];
}

-(void)callToAppendJobApplicationReportElements:(id<IReportGenerator>)iReportGenerator{
    
    [gJobApplicationDate callToAppendJobApplicationReportElements:iReportGenerator];
}


@end
