//
//  EmployerModel.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/19/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "EmployerModel.h"
#import "JAModel.h"

static EmployerModel *sharedInstance;

@implementation EmployerModel

+(EmployerModel*)sharedInstance{
    if(!sharedInstance){
        sharedInstance = [[EmployerModel alloc] init];
    }
    return sharedInstance;
}

-(void)postJob:(id<IJob>)job withEmployerID:(IDentifer *)employerID{
    
    if(employerJobMutableDict == nil){
        employerJobMutableDict=[[JobsForEmployers alloc]init];
    }
    PostedJobs *postedJobs = [employerJobMutableDict getJobsPostedByEmployerWithID:employerID];
    if(postedJobs == nil){
        postedJobs = [[PostedJobs alloc]init];
        [employerJobMutableDict postJobs:postedJobs ByEmployerWithID:employerID];
        postedJobs = [employerJobMutableDict getJobsPostedByEmployerWithID:employerID];
    }
    [postedJobs addPostedJob:job];
    
}

-(PostedJobs*)getPostedJobsForEmployerID:(IDentifer *)employerID{
    NSLog(@"In getPostedJobsForEmployerID job array is:%@", [employerJobMutableDict getJobsPostedByEmployerWithID:employerID]);
    return [employerJobMutableDict getJobsPostedByEmployerWithID:employerID];
}

-(JobApplications*)getJobapplicationForJobsID:(IDentifer *)jobID{
    return [[JAModel sharedInstance] getApplicationForJobID:jobID];
}

//-(MutableArrayWrap*)getPostedJobsForEmployerID:(IDentifer *)employerID{
//    return [[self employerJobMutableDict] objectForKey:employerID];
//}
-(PostedJobs*)jobsPostedByEmployerWithID:(IDentifer*)employerID{
    return [employerJobMutableDict getJobsPostedByEmployerWithID:employerID];
}

-(NSUInteger)getNumberOfPostedJobsByEmployerWithId:(IDentifer*)employerID{
    
    if([employerJobMutableDict getJobsPostedByEmployerWithID:employerID] == nil || [employerJobMutableDict getJobsPostedByEmployerWithID:employerID] == NULL){
        return 0;
    }
    return [[employerJobMutableDict getJobsPostedByEmployerWithID:employerID] count];
}

-(void)reset{
    employerJobMutableDict = nil;
}
@end
