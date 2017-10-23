//
//  Video.h
//  tutorials
//
//  Created by Leonidas on 23/10/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject
@property(nonatomic,strong) NSString *videoTitle;
@property(nonatomic,strong) NSString *videoDescription;
@property(nonatomic,strong) NSString *videoIframe;
@property(nonatomic,strong) NSString *thumbnailUrl;
@end
