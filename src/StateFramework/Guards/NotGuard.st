NAMESPACE Simatic.Ax.StateFramework    
    CLASS NotGuard IMPLEMENTS IGuard
        VAR PUBLIC
            Guard : IGuard;
        END_VAR
        
        METHOD PUBLIC Check : BOOL
            // A missing child guard is treated as FALSE instead of TRUE.
            IF (Guard = NULL) THEN
                Check := FALSE;
            ELSE
                Check := NOT(Guard.Check());
            END_IF;
        END_METHOD

        METHOD PUBLIC Reset
            // Reset is delegated to the wrapped guard.
            IF (Guard <> NULL) THEN
                Guard.Reset();
            END_IF;
        END_METHOD

    END_CLASS
END_NAMESPACE