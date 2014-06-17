//
//  Employer.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/4/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "Employer.h"
#import "IJob.h"
#import "JreqJob.h"


@implementation Employer 

-(void)postJReqJob{
    id<IJob> job = [JreqJob new];
    job. = [job generateJobID];
}
-(void)postATSJob{
    
}

-(NSArray*)seePostedJobListing{
    NSArray *jobList = [NSArray new];
    return jobList;
}
-(NSArray*)seeApplicationsForAjob{
    NSArray *jobList = [NSArray new];
    return jobList;
}
-(NSArray*)seeApplicationsForAjobByDay:(NSDate *)date{
    NSArray *jobList = [NSArray new];
    return jobList;
}
-(NSArray*)seeApplicationsForAjobByJob:(id<IJob>)job{
    NSArray *jobList = [NSArray new];
    return jobList;
}
-(NSArray*)seeApplicationsForAjobByDate:(NSDate *)date ByJob:(id<IJob>)job{
    NSArray *jobList = [NSArray new];
    return jobList;
}
@end
