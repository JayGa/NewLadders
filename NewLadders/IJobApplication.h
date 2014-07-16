//
//  IJobApplication.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/4/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

@protocol IReportGenerator;
@protocol IReportStringGenerator;
#import <Foundation/Foundation.h>
#import "JobApplications.h"
#import "JAModel.h"
@class JobAppliedDateResume;
@class IDentifer;
@class JobApplicationCoreFields;


@protocol IJobApplication <NSObject>

-(id<IJobApplication>)initWithCoreFields:(JobApplicationCoreFields*)jobApplicationCoreFields withJobAppliedDateResumeID:(JobAppliedDateResume*)jobAppliedDateResume;
-(void)callToAppendJobSeekerToJobApplicationReport:(id<IReportGenerator>)iReportGenerator;
-(void)callToAppendJobToJobApplicationReport:(id<IReportGenerator>)iReportGenerator;
-(void)callToAppendJobToAggregrateJobApplicationReport;
-(void)callUpdateJobApplicationModel;
-(NSString*)prepareJobApplicationReport;
-(void)appendToReportString:(NSString*)reportSubString;
@end
