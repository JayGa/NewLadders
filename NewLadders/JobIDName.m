//
//  JobIDName.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/23/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JobIDName.h"
#import "UserDisplayName.h"

@implementation JobIDName


- (JobIDName*)initWithJobID:(IDentifer*)jobID AndName:(JobDisplayName*)jobName{
    
    self = [super init];
    gjobID = jobID;
    gjobName = jobName;
    return self;
}

-(NSString*)getJobApplicationReportElements{
    return [gjobName getJobDisplayNameString];
}

-(NSString*)getJobDisplayName{
    
    return [gjobName getJobDisplayNameString];
}

@end
