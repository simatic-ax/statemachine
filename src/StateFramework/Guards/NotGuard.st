NAMESPACE Simatic.Ax.StateFramework    
    CLASS NotGuard IMPLEMENTS IGuard
        VAR PUBLIC
            Guard : IGuard;
        END_VAR
        
        METHOD PUBLIC Check : BOOL
            IF (Guard = NULL) THEN
                Check := FALSE;
            ELSE
                Check := NOT(Guard.Check());
            END_IF;
        END_METHOD

        METHOD PUBLIC Reset
            IF (Guard <> NULL) THEN
                Guard.Reset();
            END_IF;
        END_METHOD

    END_CLASS
END_NAMESPACE