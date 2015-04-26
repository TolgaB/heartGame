//
//  UIView+ColorChangingImageView.h
//  heartGame
//
//  Created by Kevin Frans on 4/26/15.
//  Copyright (c) 2015 Tolga Beser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorChangingImageView : UIView
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) UIColor *colorToChangeInto;
@end