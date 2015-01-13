//
//  ScoreLayer.h
//  Jeu
//
//  Created by Enzo on 25/07/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import"AppDelegate.h"
@interface ScoreLayer : CCLayer {
    
}
@property(nonatomic,strong) CCLabelBMFont* scoreLabel;
@property(nonatomic,readwrite) int score;

-(void) setScore:(int) s;
-(void) updateScore;
-(void) increaseScore;
-(int) getScore;
@end
