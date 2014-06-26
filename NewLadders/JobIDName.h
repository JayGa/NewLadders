//
//  JobIDName.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/23/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDentifer.h"

@interface JobIDName : NSObject{
    
    IDentifer *ijobID;
    NSString *ijobName;
}
- (JobIDName*)initWithJobID:(IDentifer*)jobID AndName:(NSString*)jobName;
@end
