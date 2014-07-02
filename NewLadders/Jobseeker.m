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
-(Jobseeker*) initWithID:(JobSeekerIDName*)jobSeekerIDName andResumeArray:(Resumes*)resumes{
    
    self = [super init];
    gjobSeekerIDName = jobSeekerIDName;
    gresumeArray = resumes;
    return self;
}
-(void) saveJob:(id<IJob>)job{

    [gjobSeekerIDName saveJob:job];
}

-(SavedJobs*) seeSavedJobs{

    return [gjobSeekerIDName seeSavedJobs];
}

//-(void)applyForJob:(id<IJobApplication>)jobApplication{
//    
//
//}

-(JobApplications *) seeAppliedJobs{

    return [gjobSeekerIDName seeAppliedJobs];
}


@end
