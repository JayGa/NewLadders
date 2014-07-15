//
//  IJobApplication.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/4/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDentifer.h"
#import "IReportStringGenerator.h"
#import "JobApplicationCoreFields.h"
#import "JobAppliedDateResume.h"
@class JobApplicationCoreFields;


@protocol IJobApplication <NSObject>

-(id<IJobApplication>)initWithCoreFields:(JobApplicationCoreFields*)jobApplicationCoreFields withJobAppliedDateResumeID:(JobAppliedDateResume*)jobAppliedDateResume;
-(NSString*) appendJobApplicationReportRecordTo:(id<IReportStringGenerator>)reportString;
-(void) callUpdateJobApplicationModel;
-(NSString*)prepareJobApplicationReport;
@end
