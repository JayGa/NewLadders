//
//  JobApplicationsForADay.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/25/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JobApplicationDate.h"
#import "JobApplications.h"

@interface JobApplicationsForADay : NSObject{
    
    NSMutableDictionary *aDictionary;
}
- (JobApplications*)getJobApplicationsForDay:(JobApplicationDate*)jobApplicationDate;
- (void)setJobApplications:(JobApplications*)jobApplications forJobApplicationDate:(JobApplicationDate*)jobApplicationDate;
//- (void)setValue:(id)value forKey:(NSString *)key;
-(NSString*)stringFromJobApplicationDate:(JobApplicationDate*)jobApplicationDate;
@end
