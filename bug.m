In Objective-C, a common yet subtle error arises when dealing with memory management and object lifecycles, specifically with regards to delegate patterns and weak references.  Consider a scenario where a view controller (ViewController) sets a delegate (MyDelegate) to an object. If the delegate is retained strongly, and the ViewController deallocates earlier than the object holding the delegate, a crash might occur when the ViewController tries to access the (already deallocated) delegate.

```objectivec
// ViewController.h
@interface ViewController : UIViewController
@property (nonatomic, strong) id <MyDelegate> delegate; // Strong reference
@end

// ViewController.m
@implementation ViewController
- (void)someMethod {
  [self.delegate myDelegateMethod]; // Crash if delegate is deallocated
}
@end
```

The problem lies in the strong reference to the delegate.  Even if the object holding the delegate is deallocated, the strong reference from the ViewController prevents its deallocation, leading to a dangling pointer.
