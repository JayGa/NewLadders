//
//  IJobs.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/16/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDentifer.h"
#import "DisplayName.h"
#import "Resume.h"

@protocol IJob <NSObject>

@property IDentifer *jobID;
@property IDentifer *jobPosterID;
@property NSString *jobName;
@property DisplayName *jobDisplayName;
-(void)applyForJobWithResume:(Resume *)resume;
-(IDentifer*)generateJobID;
@end
