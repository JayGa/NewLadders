//
//  ATSJob.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/13/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDentifer.h"
#import "DisplayName.h"
#import "IJob.h"
#import "Resume.h"

@interface ATSJob : NSObject <IJob>{
    
    IDentifer *jobID;
    DisplayName *jobDisplayName;
}

@end