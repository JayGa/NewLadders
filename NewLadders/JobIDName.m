//
//  JobIDName.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/23/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JobIDName.h"

@implementation JobIDName


- (JobIDName*)initWithJobID:(IDentifer*)jobID AndName:(NSString*)jobName{
    
    self = [super init];
    ijobID = jobID;
    ijobName = jobName;
    return self;
}
@end
