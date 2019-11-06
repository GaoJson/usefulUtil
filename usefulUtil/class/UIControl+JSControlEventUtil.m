//
//  UIControl+JSControlEventUtil.m
//  addadd
//
//  Created by apple on 2019/11/6.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UIControl+JSControlEventUtil.h"
#import <objc/runtime.h>

@implementation UIControl (JSControlEventUtil)

@end

#pragma mark - TextFieldOnEdit

static NSString *changedStrKey = @"JSEditingChanged";
static NSString *didBeginStrKey = @"JSEditingDidBegin";
static NSString *didEndStrKey = @"JSEditingDidEnd";
static NSString *didEndOnExitStrKey = @"JSEditingDidEndOnExit";

@implementation UITextField (JSTextFieldOnEditChangeUtil)

// ** EditingChanged
- (void)setEditingChangedBlock:(JSEditingChangedBlock)editingChangedBlock {
    objc_setAssociatedObject(self, &changedStrKey, editingChangedBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(TextFieldOnEditChange:) forControlEvents:UIControlEventEditingChanged];
}

-(JSEditingChangedBlock )editingChangedBlock {
    return objc_getAssociatedObject(self, &changedStrKey);
}

- (void)TextFieldOnEditChange:(UITextField *)text {
    if (self.editingChangedBlock) self.editingChangedBlock(self);
}

// ** EditingDidBegin
- (void)setEditingDidBeginBlock:(JSEditingDidBeginBlock)editingDidBeginBlock {
    objc_setAssociatedObject(self, &didBeginStrKey, editingDidBeginBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(TextFieldOnEditingDidBegin:) forControlEvents:UIControlEventEditingDidBegin];
}

-(JSEditingDidBeginBlock )editingDidBeginBlock {
    return objc_getAssociatedObject(self, &didBeginStrKey);
}

- (void)TextFieldOnEditingDidBegin:(UITextField *)text {
    if (self.editingDidBeginBlock) self.editingDidBeginBlock(self);
}

// ** EditingDidEnd

- (void)setEditingDidEndBlock:(JSEditingDidEndBlock)editingDidEndBlock {
    objc_setAssociatedObject(self, &didEndStrKey, editingDidEndBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(TextFieldOnEditingDidEnd:) forControlEvents:UIControlEventEditingDidEnd];
}

-(JSEditingDidEndBlock )editingDidEndBlock {
    return objc_getAssociatedObject(self, &didEndStrKey);
}

- (void)TextFieldOnEditingDidEnd:(UITextField *)text {
    if (self.editingDidEndBlock) self.editingDidEndBlock(self);
}

// ** EditingDidEndOnExit
- (void)setEditingDidEndOnExitBlock:(JSEditingDidEndOnExitBlock)editingDidEndOnExitBlock {
    objc_setAssociatedObject(self, &didEndOnExitStrKey, editingDidEndOnExitBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(TextFieldOnEditChange:) forControlEvents:UIControlEventEditingDidEndOnExit];
}

-(JSEditingDidEndOnExitBlock )editingDidEndOnExitBlock {
    return objc_getAssociatedObject(self, &changedStrKey);
}

- (void)TextFieldOnEditingDidEndOnExit:(UITextField *)text {
    if (self.editingDidEndOnExitBlock) self.editingDidEndOnExitBlock(self);
}

@end

#pragma mark - ButtonEvent

static NSString *upInsideStrKey = @"JSTouchUpInside";

@implementation UIButton (JSButtonTouchEventUtil)

- (void)setTouchUpInsideBlock:(JSEventTouchUpInsideBlock)touchUpInsideBlock {
    objc_setAssociatedObject(self, &upInsideStrKey, touchUpInsideBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(buttonOnEventTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
}

-(JSEventTouchUpInsideBlock )touchUpInsideBlock {
    return objc_getAssociatedObject(self, &upInsideStrKey);
}

- (void)buttonOnEventTouchUpInside:(UIButton *)button {
    if (self.touchUpInsideBlock) self.touchUpInsideBlock(self);
}

@end
