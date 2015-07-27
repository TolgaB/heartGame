//
//  GameViewController.m
//  HeartSeizure
//
//  Created by Tolga Beser on 7/25/15.
//  Copyright (c) 2015 Tolga Beser. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController {
    
    __weak IBOutlet UIButton *heartCollorController;
    __weak IBOutlet UIView *tobBarCollorView;
    UIColor *currentTopCollor;
    UIColor *currentHeartCollor;
    UILabel *youDied;
    int points;
    UIButton *rePlay;
    UILabel *pointCounter;
    int currentLevelNumber;
    NSTimer *theTimer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    points = 0;
    currentLevelNumber = 0;
    // Do any additional setup after loading the view.
    pointCounter = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 50)];
    [pointCounter setText:@"No points scored yet"];
    [self.view addSubview:pointCounter];
    [self setUpLevel:currentLevelNumber];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)setUpLevel:(int)levelNumber {
    [self generateRandomColorForTop];
    if (levelNumber == 0) {
   theTimer = [NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(generateRandomColorForBottom) userInfo:nil repeats:YES];
    
    }
    else {
        [theTimer invalidate];
        int subtractNumber = (5 * levelNumber);
        int number = 100 - subtractNumber;
        double theNumber = (double)number;
        theNumber = (theNumber / 100) + .00000000000000016;
       theTimer =  [NSTimer scheduledTimerWithTimeInterval:theNumber target:self selector:@selector(generateRandomColorForBottom) userInfo:nil repeats:YES];
    }
}


-(void)generateRandomColorForTop {
    int random = arc4random_uniform(5);
    UIColor *theColor;
    if (random == 0) {
        theColor = [UIColor redColor];
    }
    if (random == 1) {
        theColor = [UIColor greenColor];
    }
    if (random == 2) {
        theColor = [UIColor purpleColor];
    }
    if (random == 3) {
        theColor = [UIColor yellowColor];
    }
    if (random == 4) {
        theColor = [UIColor orangeColor];
    }
    if (random == 5) {
        theColor = [UIColor brownColor];
    }
    [tobBarCollorView setBackgroundColor:theColor];
    currentTopCollor = theColor;
}

-(void)generateRandomColorForBottom {
    int random = arc4random_uniform(5);
    UIColor *theColor;
    if (random == 0) {
        theColor = [UIColor redColor];
    }
    if (random == 1) {
        theColor = [UIColor greenColor];
    }
    if (random == 2) {
        theColor = [UIColor purpleColor];
    }
    if (random == 3) {
        theColor = [UIColor yellowColor];
    }
    if (random == 4) {
        theColor = [UIColor orangeColor];
    }
    if (random == 5) {
        theColor = [UIColor brownColor];
    }
    [heartCollorController setBackgroundColor:theColor];
    currentHeartCollor = theColor;
}
- (IBAction)heartPressed:(id)sender {
    if (currentHeartCollor == currentTopCollor) {
        NSLog(@"do it");
        points = points + 100;
        [self reloadPoints];
        currentLevelNumber++;
        [self setUpLevel:currentLevelNumber];
    }
    else {
        NSLog(@"GameOver");
        heartCollorController.hidden = YES;
        tobBarCollorView.hidden = YES;
        youDied = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
        youDied.text = [NSString stringWithFormat:@"You died at level %i", currentLevelNumber];
        rePlay = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 100, 50)];
        [rePlay setTitle:@"Replay" forState:UIControlStateNormal];
        [rePlay setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [rePlay addTarget:self action:@selector(replayPressed) forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:rePlay];
        [self.view addSubview:youDied];
    }
}

-(void)replayPressed {
    NSLog(@"Replay pressed");
    [rePlay removeFromSuperview];
    [youDied removeFromSuperview];
    heartCollorController.hidden = NO;
    tobBarCollorView.hidden = NO;
    points = 0;
    [self reloadPoints];
    
    
}

-(void)reloadPoints {
    pointCounter.text = [NSString stringWithFormat:@"Score: %i", points];
}
@end
