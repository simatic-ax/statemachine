### AndGuard

The `AndGuard` is a guard, that returns `TRUE`, if both conditions (Lhs `AND` Rhs) are `TRUE`.

Example:
andGuard returns true, after 1.5 seconds AND 5 calls.


```iecst
USING Simatic.Ax.StateFramework;

PROGRAM SampleProgram
    VAR
        andGuard : AndGuard := (Lhs := timeoutGuard1, Rhs := countGuard1);
        timeoutGuard1 : TimeoutGuard := (Timeout := T#1500ms);
        countGuard1 : CountGuard := (Count := LINT#5);
    END_VAR
END_PROGRAM
```