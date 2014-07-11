//
//  JobPostedDate.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/17/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JobPostedDate.h"

@implementation JobPostedDate

-(JobPostedDate*)initByPostedDate:(NSDate*)postedDate{
    
    gJobPostedDate = postedDate;
    return gJobPostedDate;
}
@end
