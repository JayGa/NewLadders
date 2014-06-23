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

-(BOOL) saveJob:(id<IJob>)job{

    return [[JSModel sharedInstance] saveJob:job withJobseekerID:self.jobseekerID];
}

-(MutableArrayWrap*) seeSavedJobs{

    return [[JSModel sharedInstance] getSavedJobsForJobseekerID:self.jobseekerID];
}

-(BOOL)applyForJob:(id<IJobApplication>)jobApplication WithResume:(Resume *)resume{
    
    if (resume!=nil) {
        [(JReqJobApplication*)jobApplication setResumeID:resume.resumeID];
    }
    BOOL returnStatus = [[JSModel sharedInstance]applyJob:jobApplication withJobseekerID:self.jobseekerID];
    return returnStatus;
}

-(MutableArrayWrap *) seeAppliedJobs{

    return [[JSModel sharedInstance] getAppliedJobsForJobseekerID:self.jobseekerID];
}


@end
