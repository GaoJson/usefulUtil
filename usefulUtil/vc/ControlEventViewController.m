//
//  ControlEventViewController.m
//  usefulUtil
//
//  Created by apple on 2019/11/6.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ControlEventViewController.h"
#import "UIControl+JSControlEventUtil.h"

@interface ControlEventViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ControlEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.textField.editingChangedBlock = ^(UITextField * _Nonnull editText) {
        NSLog(@"editingChanged");
    };
    self.textField.editingDidBeginBlock = ^(UITextField * _Nonnull editText) {
        NSLog(@"editingDidBeginBlock");
    };
    self.textField.editingDidEndBlock = ^(UITextField * _Nonnull editText) {
        NSLog(@"editingDidEndBlock");
    };
    self.textField.editingDidEndOnExitBlock = ^(UITextField * _Nonnull editText) {
        NSLog(@"editingDidEndOnExitBlock");
    };
    
    self.button.touchUpInsideBlock = ^(UIButton * _Nonnull button) {
        NSLog(@"touchUpInsideBlock");
    };
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
