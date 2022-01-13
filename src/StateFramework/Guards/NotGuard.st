NAMESPACE Simatic.Ax.StateFramework    
    CLASS NotGuard IMPLEMENTS IGuard
        VAR PUBLIC
            Guard : IGuard;
        END_VAR
        
        METHOD PUBLIC Check : BOOL
            Check := NOT(Guard.Check());
        END_METHOD

        METHOD PUBLIC Reset
            Guard.Reset();
        END_METHOD

    END_CLASS
END_NAMESPACE