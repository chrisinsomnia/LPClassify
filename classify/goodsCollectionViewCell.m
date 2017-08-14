//
//  goodsCollectionViewCell.m
//  classify
//
//  Created by Chris Xu on 2017/8/12.
//  Copyright © 2017年 Chris Xu. All rights reserved.
//

#import "goodsCollectionViewCell.h"
#import "Macros.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@interface goodsCollectionViewCell()

/* imageView */
@property (strong , nonatomic)UIImageView *goodsImageView;
/* label */
@property (strong , nonatomic)UILabel *goodsTitleLabel;

@end
@implementation goodsCollectionViewCell

#pragma mark - Intial
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpUI];
    }
    return self;
}
#pragma mark - UI
- (void)setUpUI
{
    self.backgroundColor = DCBGColor;
    _goodsImageView = [[UIImageView alloc] init];
    _goodsImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_goodsImageView];
    
    _goodsTitleLabel = [[UILabel alloc] init];
    _goodsTitleLabel.font = PFR13Font;
    _goodsTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_goodsTitleLabel];
    
}
#pragma mark - 布局
- (void)layoutSubviews
{
    [_goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        [make.top.mas_equalTo(self)setOffset:5];
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width * 0.6, self.frame.size.width * 0.6));
    }];
    
    [_goodsTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(_goodsImageView.mas_bottom)setOffset:5];
        make.width.mas_equalTo(self);
        make.centerX.mas_equalTo(self);
    }];
}


#pragma mark - Setter Getter Methods
- (void)setGoodsItem:(collectionViewItem *)goodsItem
{
    _goodsItem = goodsItem;
    
    if ([goodsItem.image_url containsString:@"http"]) {
        [self.goodsImageView sd_setImageWithURL:[NSURL URLWithString:[goodsItem valueForKey:@"image_url"]]];
    }else{
        self.goodsImageView.image = [UIImage imageNamed:[goodsItem valueForKey:@"image_url"]];
    }
    self.goodsTitleLabel.text = [[goodsItem valueForKey:@"title"] stringByAppendingString:[goodsItem valueForKey:@"price"]];
}


@end
