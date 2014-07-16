//
//  JobAppliedDateResume.h
//  NewLadders
//
//  Created by Jay Gaonkar on 7/11/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDentifer.h"
#import "JobApplicationDate.h"
#import "IJobApplication.h"

@class JobApplicationDate;
@interface JobAppliedDateResume : NSObject{
    
    JobApplicationDate *gJobApplicationDate;
    IDentifer *gresumeID;
    
}

-(JobAppliedDateResume*)initWithAppliedDate:(JobApplicationDate*)jobApplicationDate andResumeID:(IDentifer*)resumeID;
-(NSString*)jobApplicationDateReport;
-(NSString*)jobApplicationDateKeyString:(NSDate*)jobApplicationDate;
-(NSString*)prepareJobApplicationDateString:(NSDate*)jobApplicationDate;
-(void)callToappendJobApplicationReportRecordTo:(id<IJobApplication>)jobApplication;
@end

