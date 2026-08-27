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
            // Both child guards must exist and evaluate to TRUE.
            IF (Lhs = NULL) OR (Rhs = NULL) THEN
                Check := FALSE;
            ELSE
                Check := Lhs.Check() AND Rhs.Check();
            END_IF;
        END_METHOD

        METHOD PUBLIC Reset
            // Reset is forwarded to both child guards when present.
            IF (Lhs <> NULL) THEN
                Lhs.Reset();
            END_IF;
            IF (Rhs <> NULL) THEN
                Rhs.Reset();
            END_IF;
        END_METHOD

    END_CLASS
END_NAMESPACE