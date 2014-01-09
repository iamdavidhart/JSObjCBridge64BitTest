//
//  DHViewController.m
//  JSObjCBridge64BitTest
//
//  Created by David Hart on 1/9/14.
//
//

#import "DHViewController.h"
#import <JavascriptCore/JavascriptCore.h>

@class DHPoint;
@protocol DHPointJSExports <JSExport>
@property CGFloat x;
@property CGFloat y;
+(DHPoint*)point;
@end

@interface DHPoint : NSObject <DHPointJSExports>
@property CGFloat x;
@property CGFloat y;
+(DHPoint*)point;
@end

@implementation DHPoint
- (id) init {
    self = [super init];
    if (!self) return nil;
    _x = 42;
    _y = 24;
    return self;
}
+(DHPoint*)point { return [self new]; }
-(NSString*)description { return [NSString stringWithFormat:@"<DHPoint: %p> x:%f y:%f", self, _x, _y]; }
@end

@interface DHViewController ()

@end

@implementation DHViewController
{
    JSContext* _jsContext;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    DHPoint* p = [DHPoint point];
    NSLog(@"point (ObjC): %@", p);
    _jsContext = [JSContext new];

    __weak DHViewController* WeakSelf = self;
    _jsContext[@"log"] = ^(NSString* string) { [WeakSelf log:string]; };
    _jsContext[@"DHPoint"] = [DHPoint class];
    
    NSString* testScriptPath = [[NSBundle mainBundle] pathForResource:@"TestScript" ofType:@"js"];
    NSString* testScript = [NSString stringWithContentsOfFile:testScriptPath encoding:NSUTF8StringEncoding error:nil];
    [_jsContext evaluateScript:testScript];
}

- (void) log:(NSString*)string {
    NSLog(@"%@", string);
    UITextView* textView = (UITextView*)self.view;
    [textView insertText:string];
    [textView insertText:@"\n"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)prefersStatusBarHidden { return YES; }

@end
