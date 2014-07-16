//
//  JobApplications.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/23/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JobApplications.h"

@implementation JobApplications{
    NSString *gReportString;

}

-(JobApplications*)init{
    self = [super init];
    anArray = [[NSMutableArray alloc]init];
    return self;
}

- (void)addJobApplication:(id<IJobApplication>)jobApplication{
    
    [anArray addObject:jobApplication];
}

- (NSUInteger)count{
    return [anArray count];
}

- (id<IJobApplication>)jobApplicationAtIndex:(NSUInteger)index{

    return [anArray objectAtIndex:index];
}
- (NSString*)generateReportBodyForString:(id<IReportStringGenerator>)reportGeneratorString{

    return @"";
}



@end