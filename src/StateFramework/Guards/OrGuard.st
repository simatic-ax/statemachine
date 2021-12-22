NAMESPACE Simatic.Ax.StateFramework    
    CLASS OrGuard IMPLEMENTS IGuard
        VAR PUBLIC
            lhs : IGuard;
            rhs : IGuard;
        END_VAR
        
        METHOD PUBLIC Check : BOOL
            Check := lhs.Check() OR rhs.Check();
        END_METHOD

        METHOD PUBLIC Reset
            lhs.Reset();
            rhs.Reset();
        END_METHOD

    END_CLASS
END_NAMESPACE