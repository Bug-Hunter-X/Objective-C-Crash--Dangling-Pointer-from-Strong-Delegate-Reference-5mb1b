The solution is to use a `weak` reference for the delegate property to prevent the retain cycle and dangling pointer issues.

```objectivec
// ViewController.h
@interface ViewController : UIViewController
@property (nonatomic, weak) id <MyDelegate> delegate; // Weak reference
@end

// ViewController.m
@implementation ViewController
- (void)someMethod {
  if (self.delegate) { //Check for nil before accessing
    [self.delegate myDelegateMethod];
  }
}
@end
```

By making the delegate property `weak`, the `ViewController` no longer retains the delegate object.  The additional `if (self.delegate)` check ensures that we don't try to send messages to a nil object after the delegate has been deallocated.  This prevents the crash and handles the situation gracefully.