//
//  IDentifer.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/13/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IDentifer : NSObject <NSCopying>{
    
    NSString *gIdentifier;
}
-(IDentifer*)initWithString:(NSString *)identifier;
-(void)printID;
@end
