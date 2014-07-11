//
//  JobApplicationDate.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/17/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JobApplicationDate.h"

@implementation JobApplicationDate
-(JobApplicationDate*)initWithJobApplicationDate:(NSDate*)jobApplicationDate{
    
    gJobApplicationDate = jobApplicationDate;
    return gJobApplicationDate;
}
@end
