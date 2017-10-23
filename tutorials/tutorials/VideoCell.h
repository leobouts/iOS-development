//
//  VideoCell.h
//  tutorials
//
//  Created by Leonidas on 23/10/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Video;

@interface VideoCell : UITableViewCell
-(void)updateUI:(nonnull Video*)video;
@end
