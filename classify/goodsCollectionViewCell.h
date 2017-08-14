//
//  goodsCollectionViewCell.h
//  classify
//
//  Created by Chris Xu on 2017/8/12.
//  Copyright © 2017年 Chris Xu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "collectionViewItem.h"

@class collectionViewItem;


@interface goodsCollectionViewCell : UICollectionViewCell


@property (strong , nonatomic) collectionViewItem *goodsItem;

@end
