//
//  IJobApplication.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/4/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IReportStringGenerator.h"

@class JobAppliedDateResume;
@class IDentifer;
@class JobApplicationCoreFields;


@protocol IJobApplication <NSObject>

-(id<IJobApplication>)initWithCoreFields:(JobApplicationCoreFields*)jobApplicationCoreFields withJobAppliedDateResumeID:(JobAppliedDateResume*)jobAppliedDateResume;
-(NSString*) appendJobApplicationReportRecordTo:(id<IReportStringGenerator>)reportString;
-(void) callUpdateJobApplicationModel;
-(NSString*)prepareJobApplicationReport;
@end
