//
//  PauseLayer.m
//  Jeu
//
//  Created by Enzo on 08/08/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "PauseLayer.h"
#import "HelloWorldLayer.h"

@implementation PauseLayer
-(id)initWithGlayer:(HelloWorldLayer*)gl
{   if(self=[super init])
    {
        
        CCMenuItemImage *pauseButton = [CCMenuItemImage
                                         itemFromNormalImage:@"Icon-Small.png"
                                         selectedImage:@"Icon-Small.png"
                                         target:self
                                         selector:@selector(PauseMenu)];
        pauseButton.position=ccp(-220,145);
        CCMenu *menu =[CCMenu menuWithItems:pauseButton, nil];
        [self addChild:menu];
        [self setIsTouchEnabled:YES];
        _paused=NO;
        _game=gl;
    }
    return self;
    
}



-(void)PauseMenu
{ //_scene = [CCScene node];
    [_game onExit];
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    // Menu Window
    CCSprite* window=[CCSprite spriteWithFile:@"PauseMenu copy.png"];
    window.position=ccp(winSize.width/2,winSize.height/2);
    [self addChild:window z:-1 tag:15];
    
    //Restart Button
    CCMenuItemImage *resumeButton = [CCMenuItemImage
                                    itemFromNormalImage:@"ResumeButton.png"
                                    selectedImage:@"ResumeButtonSelected.png"
                                    target:self
                                    selector:@selector(resumeTapped:)];
        resumeButton.position = ccp(0, +35);
    //Go back to Menu button
    CCMenuItemImage *bMenuButton = [CCMenuItemImage
                                    itemFromNormalImage:@"MenuButton.png"
                                    selectedImage:@"MenuButtonSelected.png"
                                    target:self
                                    selector:@selector(menuTapped:)];
        bMenuButton.position=ccp(-12, -50);
    //Pause Menu
    

    
  

    _pMenu=[CCMenu menuWithItems:resumeButton,bMenuButton, nil];
    [self addChild:_pMenu];
    
    //return _scene;
}
-(void) menuTapped :(id)sender
{
    CCScene *scene = [MenuLayer scene];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionZoomFlipX transitionWithDuration:0.5 scene:scene]];
    
}
-(void) resumeTapped :(id)sender
{
    
    [self removeChild:_pMenu cleanup:YES];
    [self removeChildByTag:15 cleanup:YES];
    //[self addChild:_pause];
    [_game onEnter];
    _pMenu=nil;
    _paused=NO;
    
    //[[CCDirector sharedDirector] popScene];
}


@end
