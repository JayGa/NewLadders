//
//  JReqJobApplication.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/17/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

@protocol IJobApplication;
@protocol IReportStringGenerator;
#import "IJobApplication.h"
#import "JobApplicationCoreFields.h"
#import "JobAppliedDateResume.h"
#import "IReportStringGenerator.h"
#import "IReportGenerator.h"

@class JobAppliedDateResume;
@interface JReqJobApplication : NSObject <IJobApplication>{
    
    JobApplicationCoreFields *gJobApplicationCoreFields;
    JobAppliedDateResume *gJobAppliedDateResume;
}

-(JReqJobApplication*)initWithCoreFields:(JobApplicationCoreFields*)jobApplicationCoreFields withJobAppliedDateResumeID:(JobAppliedDateResume*)jobAppliedDateResume;
-(void)callUpdateJobApplicationModel;
-(NSString*)prepareJobApplicationReport;
-(void)callToAppendJobSeekerToJobApplicationReport:(id<IReportGenerator>)iReportGenerator;
-(void)callToAppendJobToJobApplicationReport:(id<IReportGenerator>)iReportGenerator;
-(void)callToAppendJobToAggregrateJobApplicationReport;
-(void)appendToReportString:(NSString*)reportSubString;
@end
