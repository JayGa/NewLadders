//
//  JobIDGenerator.h
//  NewLadders
//
//  Created by Jay Gaonkar on 7/9/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDentifer.h"

@interface JobIDGenerator : NSObject{

    int jreqID;
    int atsID;
    
}
+(JobIDGenerator*)sharedInstance;
-(IDentifer*)generateJReqJobID;
-(IDentifer*)generateATSJobID;
@end
