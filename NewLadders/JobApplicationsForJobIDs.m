//
//  JobApplicationsForJobIDs.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/24/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JobApplicationsForJobIDs.h"
#import "JobIDs.h"

@implementation JobApplicationsForJobIDs

-(JobApplicationsForJobIDs*)init{
    self = [super init];
    aDictionary = [[NSMutableDictionary alloc]init];
    return self;
}

- (JobApplications*)getJobApplicationsForJobID:(IDentifer*)jobID{

    return [aDictionary objectForKey:jobID];
}

- (void)setJobApplicatons:(JobApplications*)jobApplications forJobID:(IDentifer*)jobID{

    [aDictionary setObject:jobApplications forKey:jobID];
}

//- (void)setValue:(id)value forKey:(NSString *)key{
//    [aDictionary setValue:value forKey:key];
//}
- (NSUInteger)count{
    return [aDictionary count];
}
-(NSArray*)allJobIDs{
    return [aDictionary allKeys];
}
@end
