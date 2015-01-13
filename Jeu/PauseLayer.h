//
//  PauseLayer.h
//  Jeu
//
//  Created by Enzo on 08/08/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MenuLayer.h"
@class HelloWorldLayer;
@interface PauseLayer : CCLayer <CCTargetedTouchDelegate>{
    
}
@property(nonatomic,strong) CCSprite* pause;
@property(nonatomic,retain) CCMenu* pMenu;
@property(nonatomic,readwrite) BOOL paused;
@property(nonatomic,retain)CCScene *scene;
@property (nonatomic,retain) HelloWorldLayer* game;
-(void)PauseMenu;
-(void) menuTapped :(id)sender;
-(void) resumeTapped :(id)sender;
-(id)initWithGlayer:(HelloWorldLayer*)gl;
@end
