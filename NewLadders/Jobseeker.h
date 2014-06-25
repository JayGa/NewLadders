//
//  Jobseeker.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/4/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Resume.h"
#import "IDentifer.h"
#import "DisplayName.h"
#import "IJobApplication.h"
#import "MutableArrayWrap.h"

@interface Jobseeker : NSObject{
    
    //@property BOOL hasResume;
}
@property(nonatomic, strong) IDentifer *jobseekerID;
@property(nonatomic, strong) MutableArrayWrap *resumeArray;
-(NSString*)applyForJob:(id<IJobApplication>)jobApplication WithResume:(Resume *)resume;
-(NSString*) saveJob:(IDentifer *)jobID;
-(MutableArrayWrap*) seeSavedJobs;
-(MutableArrayWrap *) seeAppliedJobs;
@end
