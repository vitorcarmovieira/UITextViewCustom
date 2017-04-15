//
//  TextViewCustom.m
//  UITextViewCustom
//
//  Created by Vitor Vieira on 15/04/17.
//  Copyright © 2017 Vitor Vieira. All rights reserved.
//

#import "TextViewCustom.h"

@interface TextViewCustom ()
@property (nonatomic, retain) UILabel *placeHolderLabel;
@end

@implementation TextViewCustom

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    if (!self.placeholder) {
        [self setPlaceholder:@""];
    }
    
    if (!self.placeholderColor) {
        [self setPlaceholderColor:[UIColor lightGrayColor]];
    }
    
    if (!self.borderColor) {
        [self setBorderColor:[UIColor lightGrayColor]];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
}

- (void)drawRect:(CGRect)rect
{
    //coloca o placeholder no componente
    if( [[self placeholder] length] > 0 )
    {
        if (_placeHolderLabel == nil )
        {
            _placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(8,8,self.bounds.size.width - 16,0)];
            _placeHolderLabel.lineBreakMode = NSLineBreakByWordWrapping;
            _placeHolderLabel.numberOfLines = 0;
            _placeHolderLabel.font = self.font;
            _placeHolderLabel.backgroundColor = [UIColor clearColor];
            _placeHolderLabel.textColor = self.placeholderColor;
            _placeHolderLabel.alpha = 0;
            _placeHolderLabel.tag = 999;
            [self addSubview:_placeHolderLabel];
        }
        
        _placeHolderLabel.text = self.placeholder;
        [_placeHolderLabel sizeToFit];
        [self sendSubviewToBack:_placeHolderLabel];
    }
    
    if( [[self text] length] == 0 && [[self placeholder] length] > 0 )
    {
        [[self viewWithTag:999] setAlpha:1];
    }
    
    //coloca a borda no componente
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 5;
    self.layer.borderColor = self.borderColor.CGColor;
    
    //alinha o texto com o placeholder
    UIEdgeInsets ei = self.textContainerInset;
    ei.left = 5;
    [self setTextContainerInset:ei];
    
    [super drawRect:rect];
}

- (void)textChanged:(NSNotification *)notification
{
    if([[self placeholder] length] == 0) return;
    if([[self text] length] == 0)
        [[self viewWithTag:999] setAlpha:1];
    else
        [[self viewWithTag:999] setAlpha:0];

}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self textChanged:nil];
}

@end
