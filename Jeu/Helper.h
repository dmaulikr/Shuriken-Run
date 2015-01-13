//
//  Helper.h
//  Jeu
//
//  Created by Enzo on 18/07/13.
//
//

#import <Foundation/Foundation.h>
#import"cocos2d.h"
#import "Hero.h"
#import "BackgroundManager.h"
#import "ShurikenManager.h"
#import "GameOverLayer.h"

#import "ScoreLayer.h"
#import"Helper.h"
@interface Helper : NSObject
+ (float)randomValueBetween:(float)low andValue:(float)high;
+ (void)setInvisible:(CCNode *)node;

@end
