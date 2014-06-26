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
#import "DisplayName.h"
#import "IJobApplication.h"
#import "SavedJobs.h"
#import "JobApplications.h"
#import "Resumes.h"

@interface Jobseeker : NSObject{
    
    //@property BOOL hasResume;
}
@property(atomic, strong) IDentifer *jobseekerID;
@property(atomic, strong) Resumes *resumeArray;
-(void)applyForJob:(id<IJobApplication>)jobApplication WithResume:(Resume *)resume;
-(void) saveJob:(IDentifer *)jobID;
-(SavedJobs*) seeSavedJobs;
-(JobApplications*) seeAppliedJobs;
@end
