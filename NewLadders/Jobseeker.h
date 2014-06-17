//
//  Jobseeker.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/4/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Resume.h"
#import "IDentifer.h"
#import "DisplayName.h"

@interface Jobseeker : NSObject{
    
    //@property BOOL hasResume;
    IDentifer *jobseekerID;
    DisplayName *jobseekerDisplayName;
    NSArray *resumeArray;
}
-(BOOL)applyForJobWithResume:(Resume *)resume;
@end
