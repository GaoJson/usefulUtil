//
//  UIControl+JSControlEventUtil.h
//  addadd
//
//  Created by apple on 2019/11/6.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (JSControlEventUtil)

@end


#pragma mark - TextFieldEditing

typedef void(^JSEditingChangedBlock)(UITextField *editText);
typedef void(^JSEditingDidBeginBlock)(UITextField *editText);
typedef void(^JSEditingDidEndBlock)(UITextField *editText);
typedef void(^JSEditingDidEndOnExitBlock)(UITextField *editText);

@interface UITextField (JSTextFieldOnEditChangeUtil)

@property(nonatomic, copy) JSEditingChangedBlock editingChangedBlock;
@property(nonatomic, copy) JSEditingDidBeginBlock editingDidBeginBlock;
@property(nonatomic, copy) JSEditingDidEndBlock editingDidEndBlock;
@property(nonatomic, copy) JSEditingDidEndOnExitBlock editingDidEndOnExitBlock;

@end


#pragma mark - ButtonEvent

typedef void(^JSEventTouchUpInsideBlock)(UIButton *button);

@interface UIButton (JSButtonTouchEventUtil)

@property(nonatomic, copy) JSEventTouchUpInsideBlock touchUpInsideBlock;

@end

NS_ASSUME_NONNULL_END
