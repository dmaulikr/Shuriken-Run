//
//  ShurikenManager.h
//  Jeu
//
//  Created by Enzo on 18/07/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import"AppDelegate.h"
@interface ShurikenManager : CCNode {
    
}
@property(nonatomic,strong) CCArray *shurikens;
@property(nonatomic,readwrite) double nextShurikenSpawn;
@property(nonatomic,readwrite) int nextShuriken;
@property(nonatomic,readwrite)float minTime,maxTime,minDuration,maxDuration;
-(void) throwShuriken:(CGSize) window :(int)score;
-(void)setInvisible:(CCNode *)node;
-(CCArray*) getArray;
@end
