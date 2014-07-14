//
//  JobApplicationDate.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/17/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JobApplicationDate : NSObject{
}
@property (nonatomic, strong) NSDate *gJobApplicationDate;
-(JobApplicationDate*)initWithJobApplicationDate:(NSDate*)jobApplicationDate;
-(NSString*)prepareJobApplicationDateString;
-(NSString*)jobApplicationDateKeyString;
@end
