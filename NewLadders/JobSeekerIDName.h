//
//  JobSeekerIDName.h
//  NewLadders
//
//  Created by Jay Gaonkar on 7/2/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDentifer.h"
#import "UserDisplayName.h"
#import "IJobApplication.h"
#import "IJob.h"
#import "SavedJobs.h"
//#import "JobApplications.h"

@class JobApplications;
@interface JobSeekerIDName : NSObject{
    
    IDentifer *gjobSeekerID;
    UserDisplayName *gjobSeekerName;
}
-(JobSeekerIDName*)initWithID:(IDentifer*)jobSeekerID andName:(UserDisplayName*)jobSeekerDisplayName;

-(void) saveJob:(id<IJob>)job;
-(SavedJobs*) seeSavedJobs;
-(JobApplications*) seeAppliedJobs;
-(UserDisplayName*)getJobSeekerDisplayName;
-(NSString*)appendJobApplicationReportElements:(NSString*)reportString;
@end
