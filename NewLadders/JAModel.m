//
//  JAModel.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/19/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JAModel.h"
#import "MutableArrayWrap.h"

static JAModel *sharedInstance;
@implementation JAModel
+(JAModel*)sharedInstance{
    if(!sharedInstance){
        sharedInstance = [[JAModel alloc] init];
    }
    return sharedInstance;
}

//-(BOOL)jobAppliation:(id<IJobApplication>)jobApplication WithJobID:(IDentifer *)jobID{
//    
//    return true;
//}
-(MutableArrayWrap*)getApplicationForJobID:(IDentifer *)jobID{
    
    return [self.jobIDApplicationsMutableDict objectForKey:jobID];
}
-(MutableArrayWrap*)getApplicationForDate:(JobPostedDate *)jobPostedDate{
    
    return [self.dayApplicationsMutableDict objectForKey:jobPostedDate];
}
@end
