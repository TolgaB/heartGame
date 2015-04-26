//
//  ViewController.m
//  heartGame
//
//  Created by Tolga Beser on 4/26/15.
//  Copyright (c) 2015 Tolga Beser. All rights reserved.
//

#import "ViewController.h"
#import "ColorChangingImageView.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIView *viewthing;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tintHeart];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) tintHeart
{
    ColorChangingImageView *iv = [[ColorChangingImageView alloc] initWithFrame:_viewthing.bounds];
    [iv setBackgroundColor:[UIColor redColor]]; // might not need this, not sure.
    [iv setImage:[UIImage imageNamed:@"Untitled-2.png"]];
    [iv setColorToChangeInto:[UIColor blueColor]];
}


@end
