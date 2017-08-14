//
//  collectionSubItem.h
//  classify
//
//  Created by Chris Xu on 2017/8/12.
//  Copyright © 2017年 Chris Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface collectionSubItem : NSObject

/** 商品类题  */
@property (nonatomic, copy ) NSString *goods_title;

/** 商品图片  */
@property (nonatomic, copy ,readonly) NSString *image_url;

@end
