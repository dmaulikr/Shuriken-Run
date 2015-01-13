//
//  GameOverLayer.m
//  Jeu
//
//  Created by Enzo on 24/07/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "GameOverLayer.h"
#import"HelloWorldLayer.h"

@implementation GameOverLayer

+(CCScene *) sceneWithScore:(int)score {
    CCScene *scene = [CCScene node];
    GameOverLayer *layer = [[GameOverLayer alloc] initWithScore:score] ;
    [scene addChild: layer];
    return scene;
}
- (id)initWithScore:(int)score{
    if ((self = [super init])) {
        
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        /*CCLabelTTF * label = [CCLabelTTF labelWithString:@"GAME OVER" fontName:@"Marker Felt" fontSize:32];
        label.color = ccc3(0,0,0);
        label.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:label];*/
        _background=[CCSprite spriteWithFile:@"GameOver.png"];
        _background.position=ccp(winSize.width/2,winSize.height/2);
        [self addChild:_background z:-7];
        //score
        
        CCLabelTTF* Score = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Score : %d",score] fontName:@"Marker Felt" fontSize:27];
        Score.color=ccc3(255,0,0);
        Score.position=ccp(winSize.width/2,winSize.height/2+50);
        [self addChild:Score];
        //Restart Button
        /*CCLabelBMFont * restart = [CCLabelTTF labelWithString:@"Restart" fontName:@"Marker Felt" fontSize:26];
        restart.color = ccc3(0,0,0);*/
        CCMenuItemImage *restartButton = [CCMenuItemImage
                                        itemFromNormalImage:@"RetryButton.png"
                                        selectedImage:@"RetryButtonSelected.png"
                                        target:self
                                        selector:@selector(restartTapped:)];
       restartButton.position = ccp(winSize.width/2-90, winSize.height/2-50);
        //Go back to Menu button
        /*CCLabelBMFont * bMenu = [CCLabelTTF labelWithString:@"Menu" fontName:@"Marker Felt" fontSize:26];
        bMenu.color = ccc3(0,0,0);*/
        CCMenuItemImage *bMenuButton = [CCMenuItemImage
                                        itemFromNormalImage:@"MenuButton.png"
                                        selectedImage:@"MenuButtonSelected.png"
                                        target:self
                                        selector:@selector(menuTapped:)];
        bMenuButton.position=ccp(winSize.width/2+90, winSize.height/2-50);
        
        //Game Over Menu
       /* CCMenuItemLabel* restartItem = [ CCMenuItemLabel itemWithLabel:restart target:self selector:@selector(restartTapped:)];
        restartItem.position = ccp(winSize.width/2-90, winSize.height/2-50);
        
        CCMenuItemLabel* bMenuItem = [ CCMenuItemLabel itemWithLabel:bMenu target:self selector:@selector(menuTapped:)];
        bMenuItem.position=ccp(winSize.width/2+90, winSize.height/2-50);*/

        CCMenu *menu = [CCMenu menuWithItems:restartButton,bMenuButton, nil];
        menu.position = CGPointZero;
        [self addChild:menu z:10];
        
    }
    return self;
}

-(void) restartTapped:(id)sender{
    CCScene *scene = [HelloWorldLayer scene];
   [[CCDirector sharedDirector] replaceScene:[CCTransitionZoomFlipX transitionWithDuration:0.5 scene:scene]];
    
    
}
-(void) menuTapped :(id)sender
{
    CCScene *scene = [MenuLayer scene];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionZoomFlipX transitionWithDuration:0.5 scene:scene]];

}
@end
