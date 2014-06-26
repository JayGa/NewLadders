//
//  JobsForEmployers.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/23/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JobsForEmployers.h"
#import "IDentifer.h"

@implementation JobsForEmployers

-(JobsForEmployers*)init{
    self = [super init];
    aDictionary = [[NSMutableDictionary alloc]init];
    return self;
}
- (PostedJobs*)getJobsPostedByEmployerWithID:(IDentifer*)employerID{
    
    return [aDictionary objectForKey:employerID];
}
- (void)postJobs:(PostedJobs*)postedJobs ByEmployerWithID:(IDentifer*)employerID{
    
    [aDictionary setObject:postedJobs forKey:employerID];
}

//- (void)setValue:(id)value forKey:(NSString *)key{
//    [aDictionary setValue:value forKey:key];
//}


@end
