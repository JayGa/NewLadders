//
//  AppliedJobs.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/25/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IJob.h"

@interface AppliedJobs : NSObject{
    
    NSMutableArray *anArray;
}

- (void)addAAppliedJob:(id<IJob>)job;
- (NSUInteger)count;
- (id<IJob>)appliedJobAtIndex:(NSUInteger)index;

@end
