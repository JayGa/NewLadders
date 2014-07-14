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

@end
