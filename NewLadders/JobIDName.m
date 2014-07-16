//
//  JobIDName.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/23/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JobIDName.h"
#import "UserDisplayName.h"

@implementation JobIDName{
 
    NSString* gReportString;
}

- (JobIDName*)initWithJobID:(IDentifer*)jobID AndName:(JobDisplayName*)jobName{
    
    self = [super init];
    gjobID = jobID;
    gjobName = jobName;
    return self;
}

//-(NSString*)getJobApplicationReportElements{
//    return [gjobName getJobDisplayNameString];
//}

-(NSString*)appendJobDisplayName:(NSString*)reportString{
    
    return [gjobName appendJobDisplayNameString:reportString];
}

-(void)callToAppendJobToJobApplicationReport:(id<IJob>)job{
 
    [gjobName callToAppendJobToApplicationReportElements:self];
    [job appendToReportString:gReportString];
}

-(void)appendToReportString:(NSString*)reportSubString{
//    if(gReportString==nil){
        gReportString = @"";
//    }
    gReportString = [gReportString stringByAppendingString:reportSubString];
}

@end
