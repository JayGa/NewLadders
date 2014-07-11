//
//  JobIDGenerator.m
//  NewLadders
//
//  Created by Jay Gaonkar on 7/9/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JobIDGenerator.h"

static JobIDGenerator *sharedInstance;
@implementation JobIDGenerator

+(JobIDGenerator*)sharedInstance{
    
    if (!sharedInstance) {
        sharedInstance = [[JobIDGenerator alloc]init];
    }
    return sharedInstance;
}
-(IDentifer*)generateJReqJobID{
    if(!jreqID){
        jreqID = 135;
    }
    return [[IDentifer alloc]initWithInteger: jreqID++];
}

-(IDentifer*)generateATSJobID{
    if(!atsID){
        atsID = 246;
    }
    return [[IDentifer alloc]initWithInteger:atsID++];
}

@end
