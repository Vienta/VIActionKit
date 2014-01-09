//
//  SSAction.h
//  SSAnimation
//
//  Created by vienta on 13-12-25.
//  Copyright (c) 2013年 Candy. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CAAnimation (times)

@property (nonatomic, assign) NSInteger times;

@end



@interface SSAction : CAAnimation

@end


@interface SSMove : SSAction

/**
 *	move 移动
 *
 *	@param	duration	时间
 *	@param	fp	起点
 *	@param	tp	终点
 *
 *	@return	action
 */
+ (id)actionWithDuration:(CFTimeInterval)duration from:(CGPoint)fp to:(CGPoint)tp;

- (id)initWithDuration:(CFTimeInterval)duration from:(CGPoint)fp to:(CGPoint)tp;


/**
 *	move 移动
 *
 *	@param	duration	时间
 *	@param	path	路径
 *
 *	@return	action
 */
+ (id)actionWithDuration:(CFTimeInterval)duration path:(CGPathRef)path;

- (id)initWithDuration:(CFTimeInterval)duration path:(CGPathRef)path;

@end


@interface SSRotate : SSAction

/**
 *	rotate 旋转
 *
 *	@param	duration	时间
 *	@param	degree	角度 example:45 表示顺时针45°旋转 145 表示逆时针45°旋转
 *
 *	@return	action
 */
+ (id)actionWithDuration:(CFTimeInterval)duration degree:(float)degree;

- (id)initWithDuration:(CFTimeInterval)duration degree:(float)degree;

@end

@interface SSScale : SSAction

/**
 *	scale 缩放
 *	@param	duration	时间
 *	@param	s 缩放比例
 *
 *	@return	action
 */
+ (id)actionWithDuration:(CFTimeInterval)duration scale:(float)s;

- (id)initWithDuration:(CFTimeInterval)duration scale:(float)s;

+ (id)actionWithDuration:(CFTimeInterval)duration scaleX:(float)sx;

- (id)initWithDuration:(CFTimeInterval)duration scaleX:(float)sx;

+ (id)actionWithDuration:(CFTimeInterval)duration scaleY:(float)sy;

- (id)initWithDuration:(CFTimeInterval)duration scaleY:(float)sy;


@end

@interface SSFade : SSAction

/**
 *	fade 透明度
 *	@param	duration	时间
 *	@param	op	透明度
 *
 *	@return	action
 */
+ (id)actionDuration:(CFTimeInterval)duration opacity:(float)op;

- (id)initWithDuration:(CFTimeInterval)duration opacity:(float)op;

@end

@interface SSFadeIn : SSAction

/**
 *	fade in 透明度 current opactiy->1
 *
 *	@param	duration	时间
 *
 *	@return	action
 */
+ (id)actionWithDuration:(CFTimeInterval)duration;

- (id)initWithDuration:(CFTimeInterval)duration;

@end

@interface SSFadeOut : SSAction

/**
 *	fade out 透明度 current opacity->0
 *
 *	@param	duration	时间
 *
 *	@return	action
 */
+ (id)actionWithDuration:(CFTimeInterval)duration;

- (id)initWithDuration:(CFTimeInterval)duration;

@end


@interface SSDelayTime : SSAction

/**
 *	delaytime 延迟时间
 *
 *	@param	duration 时间
 *
 *	@return	action
 */
+ (id)actionWithDuration:(CFTimeInterval)duration;

- (id)initWithDuration:(CFTimeInterval)duration;

@end


@interface SSSequence : SSAction

+ (id)actions:(SSAction *)action1, ... NS_REQUIRES_NIL_TERMINATION;
+ (id)actionWithArray: (NSArray*) arrayOfActions;
@end

@interface SSRepeat : SSAction

+ (id)actionWithAction:(SSAction *)action times:(NSUInteger)times;

- (id)initWithAction:(SSAction *)action times:(NSUInteger)times;

@end


@interface SSSpawn : SSAction

+ (id)actions:(SSAction *)action1, ... NS_REQUIRES_NIL_TERMINATION;
+ (id)actionWithArray: (NSArray*) arrayOfActions;

@end







