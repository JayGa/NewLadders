//
//  ATSJobApplication.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/17/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "IJobApplication.h"
#import "JobApplicationCoreFields.h"
#import "IDentifer.h"
#import "JobAppliedDateResume.h"

@interface ATSJobApplication : NSObject <IJobApplication>{
    JobApplicationCoreFields *gjobApplicationCoreFields;
    JobAppliedDateResume *gJobAppliedDateResume;
}

-(ATSJobApplication*)initWithCoreFields:(JobApplicationCoreFields*)jobApplicationCoreFields withJobAppliedDateResumeID:(JobAppliedDateResume*)jobAppliedDateResume;
-(NSString*)appendJobApplicationReportRecordTo:(NSString*)reportString;
-(void)callUpdateJobApplicationModel;
-(NSString*)prepareJobApplicationReport;
@end
