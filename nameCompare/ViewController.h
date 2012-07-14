//
//  ViewController.h
//  nameCompare
//
//  Created by Markus Dietl on 12.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UITextField *inpCorrect;
    IBOutlet UITextField *inpFalse;
    
    IBOutlet UILabel *errors;
    
    NSMutableArray *stringParts;
    NSString *original;
    NSString *input;
    int inputLength;
    int originalLength;
}
- (void)handleData:(NSMutableArray *)Strings:(NSString *)original;
- (NSString *)nonInvertedCompare:(NSString *)compareString: (NSString *)originalTmp:(int)beginIndex;
- (NSString *)invertedCompare:(NSString *)compareString: (NSString *)originalTmp:(int)beginIndex;
- (void)prepareNonInvertedCompareWithIndex:(int)index;
- (void)prepareInvertedCompareWithIndex:(int)index;

- (IBAction)checkPress:(id)sender;

@end
