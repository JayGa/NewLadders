//
//  JobMetaData.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/19/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JobMetaData.h"

@implementation JobMetaData


- (JobMetaData*)initWithEmployerID:(IDentifer*)jobPosterID AndName:(JobPostedDate*)jobPostedDate{
    
    self = [super init];
    ijobPosterID = jobPosterID;
    ijobPostedDate = jobPostedDate;
    return self;
}
@end
