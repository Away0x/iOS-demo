//
//  SplashImageView.m
//  GeekTime
//
//  Created by 吴彤 on 2021/5/10.
//

#import "SplashImageView.h"

@interface SplashImageView ()

@property(nonatomic, strong, readwrite)UIButton *button;

@end

@implementation SplashImageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"splash"];
        [self addSubview:({
            _button = [[UIButton alloc] initWithFrame:CGRectMake(330, 100, 60, 40)];
            _button.backgroundColor = [UIColor lightGrayColor];
            [_button setTitle:@"跳过" forState:UIControlStateNormal];
            [_button addTarget:self action:@selector(_removeSplashView) forControlEvents:UIControlEventTouchUpInside];
            _button;
        })];
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)_removeSplashView {
    [self removeFromSuperview];
    NSLog(@"splash view removeFromSuperview");
}

@end
