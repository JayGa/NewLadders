//
//  JreqJob.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/13/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JreqJob.h"
#import "JobIDName.h"
#import "JobMetaData.h"

@implementation JreqJob


-(id<IJob>)initWithIDName:(JobIDName*)jobIDName AndMetaData:(JobMetaData*)jobMetaData{
    self = [super init];
    ijobIDName = jobIDName;
    ijobMetaData = jobMetaData;
    return self;
}
@end