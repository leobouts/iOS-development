//
//  HTTPService.h
//  tutorials
//
//  Created by Leonidas on 14/10/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^onComplete)(NSArray * _Nullable dataArray, NSString * _Nullable errMessage);

@interface HTTPService : NSObject

+ (id) instance;

- (void) getTutorials:(nullable onComplete)completionHandler;

@end
