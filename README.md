# Objective-C Crash: Dangling Pointer from Strong Delegate Reference

This repository demonstrates a common Objective-C memory management bug involving strong delegate references and its solution using weak references.

## The Problem

A `ViewController` holds a strong reference to its delegate. If the delegate object is deallocated before the `ViewController`, accessing the delegate results in a crash because the pointer is now dangling.

## The Solution

The solution involves changing the delegate property to a `weak` reference. This prevents the `ViewController` from retaining the delegate, allowing the delegate to be deallocated normally.

## How to Reproduce

1. Clone the repository.
2. Open the project in Xcode.
3. Run the project. You should observe the crash in the original implementation.
4. Switch to the solution branch to see how the issue is resolved.