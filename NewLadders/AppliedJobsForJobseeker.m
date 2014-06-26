//
//  AppliedJobsForJobseeker.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/24/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "AppliedJobsForJobseeker.h"

@implementation AppliedJobsForJobseeker

-(AppliedJobsForJobseeker*)init{
    self = [super init];
    aDictionary = [[NSMutableDictionary alloc]init];
    return self;
}

- (AppliedJobs*)getAppliedJobForJobseekerWithID:(IDentifer*)jobSeekerID{

    return [aDictionary objectForKey:jobSeekerID];
}

- (void)setAppliedJobs:(AppliedJobs*)appliedJobs forJobseekerWithID:(IDentifer*)jobSeekerID{

    [aDictionary setObject:appliedJobs forKey:jobSeekerID];
}

//- (void)setValue:(id)value forKey:(NSString *)key{
//    [aDictionary setValue:value forKey:key];
//}

@end