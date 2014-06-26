//
//  AppliedJobsForJobseeker.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/24/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "AppliedJobsForJobseeker.h"
#import "JobApplications.h"

@implementation AppliedJobsForJobseeker

-(AppliedJobsForJobseeker*)init{
    self = [super init];
    aDictionary = [[NSMutableDictionary alloc]init];
    return self;
}

- (JobApplications*)getAppliedJobForJobseekerWithID:(IDentifer*)jobSeekerID{

    return [aDictionary objectForKey:jobSeekerID];
}

- (void)setAppliedJobs:(JobApplications*)jobApplications forJobseekerWithID:(IDentifer*)jobSeekerID{

    [aDictionary setObject:jobApplications forKey:jobSeekerID];
}

//- (void)setValue:(id)value forKey:(NSString *)key{
//    [aDictionary setValue:value forKey:key];
//}

@end