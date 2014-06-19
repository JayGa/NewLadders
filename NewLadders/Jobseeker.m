//
//  Jobseeker.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/4/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "Jobseeker.h"
#import "JReqJobApplication.h"

@implementation Jobseeker

-(BOOL) saveJob:(IDentifer *)jobID{
//    Insert the jobID into DB, in saved field for the given jobseeker.
    
    BOOL saveStatus = true;//True if saving is sucecessful
    return saveStatus;
}

-(NSArray*) seeSavedJobs{
//    Fetch from DB, where joobseekerId= jobseekerID;
    NSArray *jobList = [NSArray new];

    return jobList;
//    return the array to UI
    
}

-(BOOL)applyForJob:(id<IJobApplication>)jobApplication WithResume:(Resume *)resume{
    
    if (resume!=nil) {
        [(JReqJobApplication*)jobApplication setResumeID:resume.resumeID];
    }
    //  Do DB operations to insert an entry OR pass the object for validation.
    BOOL dataBaseReturnStatus = true; //True if post successful.
    return dataBaseReturnStatus;
}

-(NSArray *) seeAppliedJobs{
    //    Fetch from DB, where joobseekerId= jobseekerID;
    NSArray *appliedJobList = [NSArray new];
    
    return appliedJobList;
    //    return the array to UI
}


@end
