//
//  JobSeekersCollection.m
//  NewLadders
//
//  Created by Jay Gaonkar on 7/3/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JobSeekersCollection.h"

@implementation JobSeekersCollection


-(JobSeekersCollection*)init{
    
    self = [super init];
    aDictionary = [[NSMutableDictionary alloc]init];
    return self;
}
-(void)addJobSeeker:(Jobseeker*)jobSeeker forJobseekerID:(IDentifer*)jobSeekerID{
    [aDictionary setObject:jobSeeker forKey:jobSeekerID];
}

-(Jobseeker*)getJobSeekerForJobSeekerID:(IDentifer*)jobSeekerID{
    NSLog(@"In getJobSeekerForJobSeekerID jobseekerID is:%@", jobSeekerID);
    [jobSeekerID printID];
    Jobseeker *jobSeeker = [aDictionary objectForKey:jobSeekerID];
    return jobSeeker;
}
-(Jobseeker*)jobSeekerAtIndex:(NSUInteger)index{
    
    return [[aDictionary allValues]objectAtIndex:index];
}
@end
