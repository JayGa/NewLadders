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

@interface ATSJobApplication : NSObject <IJobApplication>{
    JobApplicationCoreFields *gjobApplicationCoreFields;
    IDentifer *gresumeID;
}

-(ATSJobApplication*)initWithCoreFields:(JobApplicationCoreFields*)jobApplicationCoreFields withOptionalResumeID:(IDentifer*)resumeID;
-(NSString*)appendJobApplicationReportRecordTo:(NSString*)reportString;
-(void)callUpdateJobApplicationModel;
@end
