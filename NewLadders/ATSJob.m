//
//  ATSJob.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/13/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "ATSJob.h"
#import "EmployerModel.h"
@implementation ATSJob


-(id<IJob>)initWithIDName:(JobIDName*)jobIDName AndMetaData:(JobMetaData*)jobMetaData{
    self = [super init];
    gjobIDName = jobIDName;
    gjobMetaData = jobMetaData;
    return self;
}

-(NSString*)appendJobDisplayName{
    
    return [gjobIDName appendJobDisplayName];
}

-(void)callToAppendJobToJobApplicationReport:(id<IReportGenerator>)iReportGenerator{
    [gjobIDName callToAppendJobToJobApplicationReport:iReportGenerator];
}

-(void)callToAppendJobToJobAggregrateJobApplicationReport{
    [gjobIDName callToAppendJobToJobAggregrateJobApplicationReport];
}
-(void)callToAppendJobToEmployerAggregrateJobApplicationReport{
    [gjobIDName callToAppendJobToEmployerAggregrateJobApplicationReport];
}

@end