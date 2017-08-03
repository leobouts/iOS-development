//
//  Person.h
//  properties
//
//  Created by Leonidas on 03/08/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    BOOL isInsecure;
}
@property (nonatomic,strong) NSString *firstName;
@property (nonatomic,strong) NSString *lastName;


@end
