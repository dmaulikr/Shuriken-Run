//
//  BonusManager.h
//  Jeu
//
//  Created by Enzo on 05/08/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import"AppDelegate.h"
@interface BonusManager : CCNode {
    CCSprite* bonusBox;
}

@property(nonatomic,readwrite) double nextBonusSpawn;

-(void) bonusSpawnWithScore:(int)score andWindow:(CGSize) window;
-(void) setInvisible:(CCNode*) node;
-(CCSprite*) getBonusBox;
@end
