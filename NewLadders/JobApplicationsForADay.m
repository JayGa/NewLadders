//
//
//  NewLadders
//
//  Created by Jay Gaonkar on 6/25/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JobApplicationsForADay.h"

@implementation JobApplicationsForADay

-(JobApplicationsForADay*)init{
    self = [super init];
    aDictionary = [[NSMutableDictionary alloc]init];
    return self;
}
- (JobApplications*)getJobApplicationsForDay:(JobApplicationDate*)jobApplicationDate{
    
    return [aDictionary objectForKey:[self stringFromJobApplicationDate:jobApplicationDate]];
}

- (void)setJobApplications:(JobApplications*)jobApplications forJobApplicationDate:(JobApplicationDate*)jobApplicationDate{

    [aDictionary setObject:jobApplications forKey:[self stringFromJobApplicationDate:jobApplicationDate]];
}

//- (void)setValue:(id)value forKey:(NSString *)key{
//    [aDictionary setValue:value forKey:key];
//}

-(NSString*)stringFromJobApplicationDate:(JobApplicationDate*)jobApplicationDate{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMdd";
    return [formatter stringFromDate:jobApplicationDate];
//    return [jobApplicationDate jobApplicationDateKeyString];
}

-(NSString*)jobApplicationDateKeyString:(NSDate*)gJobApplicationDate{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMdd";
    return [formatter stringFromDate:gJobApplicationDate];
}


- (NSUInteger)count{
    return [aDictionary count];
}
@end
