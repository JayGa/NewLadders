//
//  Resume.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/4/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDentifer.h"

@interface Resume : NSObject{
    
    BOOL gisComplete;
    IDentifer *gresumeID;
}

-(Resume*)initWithID:(IDentifer*)resumeID;

@end
