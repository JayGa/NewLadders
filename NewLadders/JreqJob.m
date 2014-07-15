//
//  JreqJob.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/13/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JreqJob.h"


@implementation JreqJob


-(id<IJob>)initWithIDName:(JobIDName*)jobIDName AndMetaData:(JobMetaData*)jobMetaData{
    self = [super init];
    gjobIDName = jobIDName;
    gjobMetaData = jobMetaData;
    return self;
}

-(NSString*)appendJobDisplayName{
    
    return [gjobIDName appendJobDisplayName];
}

-(NSString*)appendJobApplicationReportElements:(NSString*)reportString{
    
    return [gjobIDName appendJobDisplayName];
}
@end