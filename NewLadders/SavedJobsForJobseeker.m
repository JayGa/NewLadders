//
//  SavedJobsForJobseeker.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/25/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "SavedJobsForJobseeker.h"

@implementation SavedJobsForJobseeker

-(SavedJobsForJobseeker*)init{
    self = [super init];
    aDictionary = [[NSMutableDictionary alloc]init];
    return self;
}

- (SavedJobs*)getSavedJobsForJobseekerWithID:(IDentifer*)jobseekerID{

    return [aDictionary objectForKey:jobseekerID];
}

- (void)setSavedJobs:(SavedJobs*)savedJobs forJobseekerWithID:(IDentifer *)jobseekerID{

    [aDictionary setObject:savedJobs forKey:jobseekerID];
}

//- (void)setValue:(id)value forKey:(NSString *)key{
//    [aDictionary setValue:value forKey:key];
//}
- (NSUInteger)count{
    return [aDictionary count];
}

@end