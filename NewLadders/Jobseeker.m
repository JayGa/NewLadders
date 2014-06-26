//
//  Jobseeker.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/4/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "Jobseeker.h"
#import "JReqJobApplication.h"
#import "JSModel.h"
#import "IJob.h"

@implementation Jobseeker

-(void) saveJob:(id<IJob>)job{

    [[JSModel sharedInstance] saveJob:job withJobseekerID:jobseekerID];
}

-(SavedJobs*) seeSavedJobs{

    return [[JSModel sharedInstance] getSavedJobsForJobseekerID:jobseekerID];
}

-(void)applyForJob:(id<IJobApplication>)jobApplication WithResume:(Resume *)resume{
    
    if (resume!=nil) {
        [(JReqJobApplication*)jobApplication setResumeID:resume->resumeID];
    }
    [[JSModel sharedInstance]applyJob:jobApplication withJobseekerID:jobseekerID];
//    return returnStatus;
}

-(JobApplications *) seeAppliedJobs{

    return [[JSModel sharedInstance] getAppliedJobsForJobseekerID:jobseekerID];
}


@end
