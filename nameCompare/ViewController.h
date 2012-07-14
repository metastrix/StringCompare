//
//  ViewController.h
//  nameCompare
//
//   No Copyright (c) 2012 - Free to use.
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
