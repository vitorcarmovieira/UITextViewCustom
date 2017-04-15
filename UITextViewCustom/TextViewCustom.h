//
//  TextViewCustom.h
//  UITextViewCustom
//
//  Created by Vitor Vieira on 15/04/17.
//  Copyright © 2017 Vitor Vieira. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface TextViewCustom : UITextView

@property (nonatomic, retain) IBInspectable NSString *placeholder;
@property (nonatomic, retain) IBInspectable UIColor *placeholderColor;
@property (nonatomic, retain) IBInspectable UIColor *borderColor;

-(void)textChanged:(NSNotification*)notification;

@end
