//
//  JReqJobApplication.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/17/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "IJobApplication.h"
#import "JobApplicationCoreFields.h"
#import "JobAppliedDateResume.h"

@interface JReqJobApplication : NSObject <IJobApplication>{
    
    JobApplicationCoreFields *gJobApplicationCoreFields;
    JobAppliedDateResume *gJobAppliedDateResume;
}

-(JReqJobApplication*)initWithCoreFields:(JobApplicationCoreFields*)jobApplicationCoreFields withJobAppliedDateResumeID:(JobAppliedDateResume*)jobAppliedDateResume;
-(void)callUpdateJobApplicationModel;
-(NSString*)prepareJobApplicationReport;
-(NSString*) appendJobApplicationReportRecordTo:(id<IReportStringGenerator>)reportString;

@end
