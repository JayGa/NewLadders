//
//  PostedJobsForJobID.h
//  NewLadders
//
//  Created by Jay Gaonkar on 7/10/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDentifer.h"
#import "IJob.h"

@interface PostedJobsForJobID : NSObject{
 
    NSMutableDictionary *aDictionary;
}
-(PostedJobsForJobID*)init;
- (id<IJob>)getPostedJobforJobID:(IDentifer*)jobID;
- (void)setPostedJobs:(id<IJob>)postJob forJobWithID:(IDentifer *)jobID;
- (NSUInteger)count;
@end
