NAMESPACE Simatic.Ax.StateFramework    
    CLASS OrGuard IMPLEMENTS IGuard
        VAR PUBLIC
            Lhs : IGuard;
            Rhs : IGuard;
        END_VAR
        
        METHOD PUBLIC Check : BOOL
            Check := Lhs.Check() OR Rhs.Check();
        END_METHOD

        METHOD PUBLIC Reset
            Lhs.Reset();
            Rhs.Reset();
        END_METHOD

    END_CLASS
END_NAMESPACE