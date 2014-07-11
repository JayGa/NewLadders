//
//  JobsModel.h
//  NewLadders
//
//  Created by Jay Gaonkar on 7/10/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PostedJobsForJobID.h"

@interface JobsModel : NSObject{
    PostedJobsForJobID *postedJobsForJobID;
}
+(JobsModel*)sharedInstance;
-(void)reset;
-(id<IJob>)fetchJobWithID:(IDentifer*)jobID;

-(void)addJob:(id<IJob>)job withJobID:(IDentifer*)jobID;
@end
