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
-(Jobseeker*) initWithID:(IDentifer*)jobSeekerID andResumeArray:(Resumes*)resumes{
    
    self = [super init];
    gjobseekerID = jobSeekerID;
    gresumeArray = resumes;
    return self;
}
-(void) saveJob:(id<IJob>)job{

    [[JSModel sharedInstance] saveJob:job withJobseekerID:gjobseekerID];
}

-(SavedJobs*) seeSavedJobs{

    return [[JSModel sharedInstance] getSavedJobsForJobseekerID:gjobseekerID];
}

//-(void)applyForJob:(id<IJobApplication>)jobApplication{
//    
//
//}

-(JobApplications *) seeAppliedJobs{

    return [[JSModel sharedInstance] getAppliedJobsForJobseekerID:gjobseekerID];
}


@end
