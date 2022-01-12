# Statemachine

This library provides a state framework,to implement simple statemachines easily.
## Install this package

Enter:
```cli
apax add @simatic-ax/statemachine
```

> to install this package you need to login into the GitHub registry. You'll find more information [here](https://github.com/simatic-ax/.github/blob/main/doc/personalaccesstoken.md) 

## Namespace
```
Simatic.Ax.StateFramework
```
## Guards

### Class diagram

```mermaid
classDiagram
    class IGuard {
        <<interface>>
        Check()
        Reset()
    }

    class ConcreteGuard {
        + <ClassInterface>
    }
    IGuard <|-- ConcreteGuard : implements
```

### Available guards

* [AndGuard](#AndGuard)
* [BoolGuard](#BoolGuard)
* [CompareGuardLint](#CompareGuardLint)
* [OrGuard](#OrGuard)
* [TrueGuard](#TrueGuard)
* [XorGuard](#XorGuard)

* [BoolGuard](#BoolGuard)

### AndGuard

The `AndGuard` is a guard, that returns `TRUE`, if both conditions (lhs `AND` rhs) are `TRUE`.

Usage:
```iecst
USING Simatic.Ax.StateFramework;

PROGRAM SampleProgram
    VAR
        guard1 : AndGuard := (lhs := timeoutGuard1, rhs := countGuard1);
        timeoutGuard1 : TimeoutGuard := (timeout := T#1500ms);
        countGuard1 : CountGuard := (count := LINT#5);
    END_VAR
END_PROGRAM
```

### BoolGuard

The `BoolGuard` is a guard, that has a referecne to a boolean variable and returns `TRUE`, when the referenced variable is `TRUE`

> Note: REF_TO IOM varibales is not working in AX

Usage:
```iecst
USING Simatic.Ax.StateFramework;

PROGRAM SampleProgram
    VAR
        bValue : BOOL;
        guard1 : BoolGuard := (value := REF(bValue));
    END_VAR
END_PROGRAM
```

### CompareGuardLint

The `CompareGuardLint` is a guard, compares a LINT variable (value) with a compare value (cv) and returns `TRUE` when the condition is fullfilled.

| Condition   | Description                           |             |
| ----------- | :------------------------------------ | :---------- |
| GT          | variable is greater than value        | value > cv  |
| EQ          | variable is equal to value            | value == cv |
| LT          | variable is less than value           | value < cv  |
| GE          | variable is greater or equal to value | value > cv  |
| LE          | variable is less or equal to value    | value > cv  |

> Note: REF_TO IOM variables is not working in AX

Usage:
```iecst
USING Simatic.Ax.StateFramework;

PROGRAM SampleProgram
    VAR
        value : LINT;
        guard1 : CompareGuardLint := (_value := REF(value), _compareToValue := LINT#500, _condition := Condition#GT);
    END_VAR
END_PROGRAM
```



### OrGuard

The `OrGuard` is a guard, that returns `TRUE`, if at minimum one of both conditions (lhs `OR` rhs) are `TRUE`.

Usage:
```iecst
USING Simatic.Ax.StateFramework;

PROGRAM SampleProgram
    VAR
        guard1 : OrGuard := (lhs := timeoutGuard1, rhs := countGuard1);
        timeoutGuard1 : TimeoutGuard := (timeout := T#1500ms);
        countGuard1 : CountGuard := (count := LINT#5);
    END_VAR
END_PROGRAM
```



### TrueGuard

The `TrueGuard` is a guard, that always returns.

Usage:
```iecst
USING Simatic.Ax.StateFramework;

PROGRAM SampleProgram
    VAR
        guard1 : TrueGuard;
    END_VAR
END_PROGRAM
```

### XorGuard

The `XorGuard` is a guard, that returns `TRUE`, if exactly one condition (lhs `XOR` rhs) is `TRUE`.

Usage:
```iecst
USING Simatic.Ax.StateFramework;

PROGRAM SampleProgram
    VAR
        guard1 : XorGuard := (lhs := timeoutGuard1, rhs := countGuard1);
        timeoutGuard1 : TimeoutGuard := (timeout := T#1500ms);
        countGuard1 : CountGuard := (count := LINT#5);
    END_VAR
END_PROGRAM
```

## Transitions
## States

## Example
## Contribution

Thanks for your interest in contributing. Anybody is free to report bugs, unclear documentation, and other problems regarding this repository in the Issues section or, even better, is free to propose any changes to this repository using Merge Requests.

## License and Legal information

Please read the [Legal information](LICENSE.md)