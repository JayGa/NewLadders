//
//  JReqJobApplication.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/17/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "IJobApplication.h"

@interface JReqJobApplication : NSObject <IJobApplication>
@property IDentifer *jobseeker ;
@property IDentifer *jobID;
@property IDentifer *resumeID;
@end
