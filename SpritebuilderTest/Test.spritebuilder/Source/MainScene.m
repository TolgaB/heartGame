#import "MainScene.h"

@implementation MainScene
{
    CCSprite* heart;
}

- (void)didLoadFromCCB {
    // tell this scene to accept touches
    self.userInteractionEnabled = TRUE;
    
    [heart setColor:[CCColor blueColor]];
}


- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    int r = arc4random_uniform(4);
    if(r == 0)
    {
        [heart setColor:[CCColor blueColor]];
    }
    if(r == 1)
    {
        [heart setColor:[CCColor redColor]];
    }
    if(r == 2)
    {
        [heart setColor:[CCColor greenColor]];
    }
    if(r == 3)
    {
        [heart setColor:[CCColor yellowColor]];
    }
}



@end
