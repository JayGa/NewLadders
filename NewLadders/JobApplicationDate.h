//
//  JobApplicationDate.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/17/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JobApplicationDate : NSDate{
    JobApplicationDate *gJobApplicationDate;
}
-(JobApplicationDate*)initWithJobApplicationDate:(NSDate*)jobApplicationDate;
@end
