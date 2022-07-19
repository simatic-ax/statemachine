NAMESPACE Simatic.Ax.StateFramework    
    /// AND Guard 
    ///   Lhs : IGuard;
    ///   Rhs : IGuard;
    /// Rhs and Lhs must be TRUE that the Check()-Method returns true
    {axcode:docs-v0:@simatic-ax/statemachine:AndGuard.md}
    CLASS AndGuard IMPLEMENTS IGuard
        VAR PUBLIC
            Lhs : IGuard;
            Rhs : IGuard;
        END_VAR
        
        METHOD PUBLIC Check : BOOL
            Check := Lhs.Check() AND Rhs.Check();
        END_METHOD

        METHOD PUBLIC Reset
            Lhs.Reset();
            Rhs.Reset();
        END_METHOD

    END_CLASS
END_NAMESPACE