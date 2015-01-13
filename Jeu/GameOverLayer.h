//
//  GameOverLayer.h
//  Jeu
//
//  Created by Enzo on 24/07/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import"AppDelegate.h"
#import "MenuLayer.h"
@interface GameOverLayer : CCLayer {

    
}
@property(nonatomic,strong) CCSprite* background;
+(CCScene *) sceneWithScore:(int)score;
- (id)initWitScore:(int)score;
-(void) restartTapped:(id)sender;
-(void) menuTapped :(id)sender;

@end
