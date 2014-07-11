//
//  PostedJobsForJobID.m
//  NewLadders
//
//  Created by Jay Gaonkar on 7/10/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "PostedJobsForJobID.h"

@implementation PostedJobsForJobID

-(PostedJobsForJobID*)init{
    self = [super init];
    aDictionary = [[NSMutableDictionary alloc]init];
    return self;
}

- (id<IJob>)getPostedJobforJobID:(IDentifer*)jobID{
    
    return [aDictionary objectForKey:jobID];
}

- (void)setPostedJobs:(id<IJob>)postJob forJobWithID:(IDentifer *)jobID{
    
    [aDictionary setObject:postJob forKey:jobID];
}


- (NSUInteger)count{
    return [aDictionary count];
}
@end
