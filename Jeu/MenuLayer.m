//
//  MenuLayer.m
//  Jeu
//
//  Created by Enzo on 07/08/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "MenuLayer.h"
#import"HelloWorldLayer.h"

@implementation MenuLayer
+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	MenuLayer *layer = [MenuLayer node];
	[scene addChild: layer];
	return scene;
}
-(id) init
{
    if(self=[super init])
    {
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        _background=[CCSprite spriteWithFile:@"GameMenu.png"];
        _background.position=ccp(winSize.width/2,winSize.height/2);
        [self addChild:_background z:-6];

        CCMenuItemImage *startButton = [CCMenuItemImage
                                        itemFromNormalImage:@"PlayOption.png"
                                        selectedImage:@"PlayOptionSelected.png"
                                        target:self
                                        selector:@selector(startGame:)];
        startButton.position=ccp(-25,0);
        
        CCMenu *menu = [CCMenu menuWithItems: startButton, nil];
        [self addChild: menu];
    }
    return self;
}

-(void)startGame : (id)sender
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[HelloWorldLayer scene] withColor:ccBLACK]];

}
@end
