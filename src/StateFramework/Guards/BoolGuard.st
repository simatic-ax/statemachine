NAMESPACE Simatic.Ax.StateFramework    
    /// BOOL Guard 
    /// Value : REF_TO BOOL
    /// Check()-Method returns true when REF_TO value is TRUE
    CLASS BoolGuard IMPLEMENTS IGuard
        VAR PUBLIC
            Value : REF_TO BOOL;
        END_VAR
        
        METHOD PUBLIC Check : BOOL
            // A missing BOOL reference is treated as FALSE.
            IF (Value = NULL) THEN
                Check := FALSE;
            ELSE
                Check := Value^;
            END_IF;
        END_METHOD

        METHOD PUBLIC Reset
            // BoolGuard is level-based and therefore has no internal state to reset.
            ;
        END_METHOD

    END_CLASS
END_NAMESPACE