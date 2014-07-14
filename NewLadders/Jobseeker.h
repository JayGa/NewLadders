//
//  Jobseeker.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/4/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Resume.h"
#import "IDentifer.h"
#import "IJobApplication.h"
#import "SavedJobs.h"
#import "JobApplications.h"
#import "Resumes.h"
#import "JobSeekerIDName.h"

@interface Jobseeker : NSObject{
    JobSeekerIDName *gjobSeekerIDName;
    Resumes *gresumes;
}
-(Jobseeker*) initWithID:(JobSeekerIDName*)jobSeekerIDName andResumeArray:(Resumes*)resumes;
-(void) applyForJob:(id<IJobApplication>)jobApplication WithResume:(Resume *)resume;
-(void) saveJob:(id<IJob>)job;
-(SavedJobs*) seeSavedJobs;
-(JobApplications*) seeAppliedJobs;
-(Resumes*)getAllResumeForJobseeker;
-(NSString*)getJobApplicationReportElements;
@end
