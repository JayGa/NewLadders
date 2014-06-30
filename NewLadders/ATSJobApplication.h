//
//  ATSJobApplication.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/17/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "IJobApplication.h"
#import "JobApplicationCoreFields.h"

@interface ATSJobApplication : NSObject <IJobApplication>{
    JobApplicationCoreFields *gjobApplicationCoreFields;
    IDentifer *gresumeID;
}
-(void)applyForJob;

-(NSString*)appendJobApplicationReportRecordTo:(NSString*)reportString;
-(ATSJobApplication*)initWithJobseekerId:(IDentifer*)jobSeekerID forJObID:(IDentifer*)jobID withOptionalResumeID:(IDentifer*)resumeID;
-(void)callUpdateJobApplicationModel;
@end
