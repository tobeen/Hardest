//
//  WNXStage20DiceView.m
//  Hardest
//
//  Created by sfbest on 16/5/23.
//  Copyright © 2016年 维尼的小熊. All rights reserved.
//

#import "WNXStage20DiceView.h"
#import "WNXDiceView.h"

@interface WNXStage20DiceView ()
{
    int _count;
    int _diceView1Num1;
    int _diceView1Num2;
    int _diceView1Num3;
    
    int _diceView2Num1;
    int _diceView2Num2;
    int _diceView2Num3;
    
    int _diceView3Num1;
    int _diceView3Num2;
    int _diceView3Num3;
}

@property (nonatomic, strong) WNXDiceView *dice1;
@property (nonatomic, strong) WNXDiceView *dice2;
@property (nonatomic, strong) WNXDiceView *dice3;

@end

@implementation WNXStage20DiceView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.dice1 = [WNXDiceView viewFromNib];
        [self addSubview:self.dice1];
        
        self.dice2 = [WNXDiceView viewFromNib];
        self.dice2.frame = CGRectMake(ScreenWidth / 3, 0, ScreenWidth / 3, self.dice2.frame.size.height);
        [self addSubview:self.dice2];
        
        self.dice3 = [WNXDiceView viewFromNib];
        self.dice3.frame = CGRectMake(ScreenWidth / 3 * 2, 0, ScreenWidth / 3, self.dice3.frame.size.height);
        [self addSubview:self.dice3];
    }
    
    return self;
}

- (int)startShakeDice {
    _count++;
    
    int maxIndex = arc4random_uniform(3);

    if (_count <= 4) {
        [self setDiceNumberRandom1];
        
        if (maxIndex == 0) {            
            while (_diceView1Num1 == _diceView2Num1 || _diceView2Num1 == _diceView3Num1 || _diceView1Num1 == _diceView3Num1 || !(_diceView1Num1 > _diceView2Num1 && _diceView1Num1 > _diceView3Num1)) {
                [self setDiceNumberRandom1];
            }

        } else if (maxIndex == 1) {
            while (_diceView1Num1 == _diceView2Num1 || _diceView2Num1 == _diceView3Num1 || _diceView1Num1 == _diceView3Num1 || !(_diceView2Num1 > _diceView1Num1 && _diceView2Num1 > _diceView3Num1)) {
                [self setDiceNumberRandom1];
            }
        } else if (maxIndex == 2) {
            while (_diceView1Num1 == _diceView2Num1 || _diceView2Num1 == _diceView3Num1 || _diceView1Num1 == _diceView3Num1 || !(_diceView3Num1 > _diceView1Num1 && _diceView3Num1 > _diceView2Num1)) {
                [self setDiceNumberRandom1];
            }
        }
        
        [self.dice1 startShakeDiceWithFirstDiceNumber:_diceView1Num1 secoundDiceNumber:-1 thridDiceNumber:-1];
        [self.dice2 startShakeDiceWithFirstDiceNumber:_diceView2Num1 secoundDiceNumber:-1 thridDiceNumber:-1];
        [self.dice3 startShakeDiceWithFirstDiceNumber:_diceView3Num1 secoundDiceNumber:-1 thridDiceNumber:-1];

    } else if (_count <= 8) {
    
        [self setDiceNumberRandom2];
        
        int sum1 = _diceView1Num1 + _diceView1Num2;
        int sum2 = _diceView2Num1 + _diceView2Num2;
        int sum3 = _diceView3Num1 + _diceView3Num2;
        
        if (maxIndex == 0) {
            while (sum1 == sum2 || sum2 == sum3 || sum1 == sum3 || !(sum1 > sum2 && sum1 > sum3)) {
                [self setDiceNumberRandom2];
                
                sum1 = _diceView1Num1 + _diceView1Num2;
                sum2 = _diceView2Num1 + _diceView2Num2;
                sum3 = _diceView3Num1 + _diceView3Num2;
            }
        } else if (maxIndex == 1) {
            while (sum1 == sum2 || sum2 == sum3 || sum1 == sum3 || !(sum2 > sum1 && sum2 > sum3)) {
                [self setDiceNumberRandom2];
                
                sum1 = _diceView1Num1 + _diceView1Num2;
                sum2 = _diceView2Num1 + _diceView2Num2;
                sum3 = _diceView3Num1 + _diceView3Num2;
            }
        } else if (maxIndex == 2) {
            while (sum1 == sum2 || sum2 == sum3 || sum1 == sum3 || !(sum3 > sum1 && sum3 > sum2)) {
                [self setDiceNumberRandom2];
                
                sum1 = _diceView1Num1 + _diceView1Num2;
                sum2 = _diceView2Num1 + _diceView2Num2;
                sum3 = _diceView3Num1 + _diceView3Num2;
            }
        }
        
        [self.dice1 startShakeDiceWithFirstDiceNumber:_diceView1Num1 secoundDiceNumber:_diceView1Num2 thridDiceNumber:-1];
        [self.dice2 startShakeDiceWithFirstDiceNumber:_diceView2Num1 secoundDiceNumber:_diceView2Num2 thridDiceNumber:-1];
        [self.dice3 startShakeDiceWithFirstDiceNumber:_diceView3Num1 secoundDiceNumber:_diceView3Num2 thridDiceNumber:-1];
        
    } else {
    
        [self setDiceNumberRandom3];
        
        int sum1 = _diceView1Num1 + _diceView1Num2 + _diceView1Num3;
        int sum2 = _diceView2Num1 + _diceView2Num2 + _diceView2Num3;
        int sum3 = _diceView3Num1 + _diceView3Num2 + _diceView3Num3;
        
        if (maxIndex == 0) {
            while (sum1 == sum2 || sum2 == sum3 || sum1 == sum3 || !(sum1 > sum2 && sum1 > sum3)) {
                [self setDiceNumberRandom3];
                
                sum1 = _diceView1Num1 + _diceView1Num2 + _diceView1Num3;
                sum2 = _diceView2Num1 + _diceView2Num2 + _diceView2Num3;
                sum3 = _diceView3Num1 + _diceView3Num2 + _diceView3Num3;
            }
        } else if (maxIndex == 1) {
            while (sum1 == sum2 || sum2 == sum3 || sum1 == sum3 || !(sum2 > sum1 && sum2 > sum3)) {
                [self setDiceNumberRandom3];
                
                sum1 = _diceView1Num1 + _diceView1Num2 + _diceView1Num3;
                sum2 = _diceView2Num1 + _diceView2Num2 + _diceView2Num3;
                sum3 = _diceView3Num1 + _diceView3Num2 + _diceView3Num3;
            }
        } else if (maxIndex == 2) {
            while (sum1 == sum2 || sum2 == sum3 || sum1 == sum3 || !(sum3 > sum1 && sum3 > sum2)) {
                [self setDiceNumberRandom3];
                
                sum1 = _diceView1Num1 + _diceView1Num2 + _diceView1Num3;
                sum2 = _diceView2Num1 + _diceView2Num2 + _diceView2Num3;
                sum3 = _diceView3Num1 + _diceView3Num2 + _diceView3Num3;
            }
        }
        
        [self.dice1 startShakeDiceWithFirstDiceNumber:_diceView1Num1 secoundDiceNumber:_diceView1Num2 thridDiceNumber:_diceView1Num3];
        [self.dice2 startShakeDiceWithFirstDiceNumber:_diceView2Num1 secoundDiceNumber:_diceView2Num2 thridDiceNumber:_diceView2Num3];
        [self.dice3 startShakeDiceWithFirstDiceNumber:_diceView3Num1 secoundDiceNumber:_diceView3Num2 thridDiceNumber:_diceView3Num3];
    }
        
    return maxIndex;
}

- (void)setDiceNumberRandom1 {
    _diceView1Num1 = arc4random_uniform(6) + 1;
    _diceView2Num1 = arc4random_uniform(6) + 1;
    _diceView3Num1 = arc4random_uniform(6) + 1;
}

- (void)setDiceNumberRandom2 {
    [self setDiceNumberRandom1];
    
    _diceView1Num2 = arc4random_uniform(6) + 1;
    _diceView2Num2 = arc4random_uniform(6) + 1;
    _diceView3Num2 = arc4random_uniform(6) + 1;
}

- (void)setDiceNumberRandom3 {
    [self setDiceNumberRandom2];
    
    _diceView1Num3 = arc4random_uniform(6) + 1;
    _diceView2Num3 = arc4random_uniform(6) + 1;
    _diceView3Num3 = arc4random_uniform(6) + 1;
}

@end