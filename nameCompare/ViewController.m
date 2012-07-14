//
//  ViewController.m
//  nameCompare
//
//  No Copyright (c) 2012 - Free to use.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (IBAction)checkPress:(id)sender
{
    
    [inpCorrect resignFirstResponder];
    [inpFalse resignFirstResponder];
    
    input =    inpFalse.text;
    original = inpCorrect.text;
    
    inputLength = input.length;
    originalLength = original.length;
    
    stringParts = [NSMutableArray arrayWithCapacity:100];
    
    
    for (int i = 0; i < original.length; i++) 
    {
        [self prepareNonInvertedCompareWithIndex:i];
        [self prepareInvertedCompareWithIndex:i];
    }
    
    NSLog(@"fehler: %i", abs(inputLength - (originalLength - original.length)  + original.length));
    NSString *errorLblText = [[NSString alloc]initWithFormat:@"%i",abs(inputLength - (originalLength - original.length)  + original.length)];
    errors.text = errorLblText;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [inpCorrect becomeFirstResponder];
}

- (void)prepareNonInvertedCompareWithIndex:(int)index;
{
    NSRange range1 = [input rangeOfString:[self nonInvertedCompare:input:original:index]];
    NSRange range2 = [original rangeOfString:[self nonInvertedCompare:input:original:index]];
    
    if (range2.location != NSNotFound) 
    {
        //original = [original substringFromIndex:range2.location + range2.length];
        
        NSString *subString1 = [original substringToIndex:range2.location];
        NSString *subString2 = [original substringFromIndex:range2.location + range2.length];
        
        //NSLog(@"%@ - %@ original: %@ location: %i", subString1, subString2,original, range2.location);
    }
    
    original = [original stringByReplacingOccurrencesOfString:[self nonInvertedCompare:input:original:index] withString:@""];
    
    if (range1.location != NSNotFound) 
    {
        input = [input substringFromIndex:range1.location + range1.length];
    }
    
   // NSLog(@"new input: %@ new original: %@", input, original);
}

- (void)prepareInvertedCompareWithIndex:(int)index;
{
    NSRange range1 = [input rangeOfString:[self invertedCompare:input:original:index]];
    original = [original stringByReplacingOccurrencesOfString:[self invertedCompare:input:original:index] withString:@""];
    
    if (range1.location != NSNotFound) 
    {
        input = [input substringToIndex:range1.location];
    }

    
   // NSLog(@"new input: %@ new original: %@", input, original);
}

- (NSString *)nonInvertedCompare:(NSString *)compareString: (NSString *)originalTmp:(int)beginIndex
{
    NSString *inpString = compareString;
    NSString *orgString = [originalTmp substringFromIndex:beginIndex];
    int orgLength = orgString.length;
    
    for (int i = 0; i <orgLength; i++) 
    {
        NSString *toCompareString = [orgString substringToIndex:orgLength-i];
        //NSLog(@"%@",toCompareString);
        
        if ([inpString rangeOfString:toCompareString].location != NSNotFound) 
        {
            //NSLog(@"nonInverted: found \"%@\" in the word \"%@\" at index: %i", toCompareString, inpString, [inpString rangeOfString:toCompareString].location);
            return toCompareString;
            i = orgLength;
        }
    }
    
    return @"";
}

- (NSString *)invertedCompare:(NSString *)compareString: (NSString *)originalTmp:(int)beginIndex
{
    NSString *inpString = compareString;
    NSString *orgString = [originalTmp substringFromIndex:beginIndex];
    int orgLength = orgString.length;

   // NSLog(@"original: %@ - %@", orgString, inpString);
    
    for (int i = 0; i <orgLength; i++) 
    {
        NSString *toCompareString = [orgString substringFromIndex:i];
        //NSLog(@"%@",toCompareString);
        
        if ([inpString rangeOfString:toCompareString].location != NSNotFound) 
        {
            //NSLog(@"inverted: found \"%@\" in the word \"%@\" at index: %i", toCompareString, inpString, [inpString rangeOfString:compareString].location);
            return toCompareString;
            i = orgLength;
        }
    }
    
    return @"";    
}

- (void)handleData:(NSMutableArray *)Strings:(NSString *)original
{
    NSMutableArray* subStringArray = Strings;
    NSString *originalString = original;
    
    NSString *combinedString = [[NSString alloc]initWithFormat:@"%@-%@", [subStringArray objectAtIndex:0], [subStringArray objectAtIndex:1]];
    NSLog(@"%@", combinedString);
    originalString = [originalString stringByReplacingOccurrencesOfString:[subStringArray objectAtIndex:0] withString:@""];
    originalString = [originalString stringByReplacingOccurrencesOfString:[subStringArray objectAtIndex:1] withString:@""];
    
    NSLog(@"rest: %@", originalString);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
