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

-(void)callToAppendJobToJobApplicationReport:(id<IReportGenerator>)iReportGenerator{
 
    [gjobName callToAppendJobToApplicationReportElements:iReportGenerator];

}
-(void)callToAppendJobToJobAggregrateJobApplicationReport{
    [gjobName callToAppendJobToAggregrateJobApplicationReport];
}
-(void)callToAppendJobToEmployerAggregrateJobApplicationReport{
    [gjobName callToAppendJobToEmployerAggregrateJobApplicationReport];
}
@end
