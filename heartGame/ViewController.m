//
//  ViewController.m
//  heartGame
//
//  Created by Tolga Beser on 4/26/15.
//  Copyright (c) 2015 Tolga Beser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *heart;

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
    _heart.image = [_heart.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [_heart setTintColor:[UIColor redColor]];
}

@end
