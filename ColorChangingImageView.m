//
//  UIView+ColorChangingImageView.m
//  heartGame
//
//  Created by Kevin Frans on 4/26/15.
//  Copyright (c) 2015 Tolga Beser. All rights reserved.
//

#import "ColorChangingImageView.h"

@implementation ColorChangingImageView

@synthesize image = _image;
@synthesize colorToChangeInto = _colorToChangeInto;

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextScaleCTM(context, 1, -1);
    CGContextTranslateCTM(context, 0, -rect.size.height);
    
    CGImageRef maskImage = [self.image CGImage];
    CGContextClipToMask(context, rect, maskImage);
    
    [_colorToChangeInto setFill];
    CGContextFillRect(context, rect);
    
    //blend mode overlay
    CGContextSetBlendMode(context, kCGBlendModeOverlay);
    
    //draw the image
    CGContextDrawImage(context, rect, _image.CGImage);
}
@end
