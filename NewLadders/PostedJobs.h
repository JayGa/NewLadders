//
//  PostedJobs.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/25/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IJob.h"

@interface PostedJobs : NSObject{
    
    NSMutableArray *anArray;
}

- (PostedJobs*)init;
- (void)addPostedJob:(id<IJob>)job;
- (id<IJob>)postedJobAtIndex:(NSUInteger)index;
- (NSUInteger)count;
@end
