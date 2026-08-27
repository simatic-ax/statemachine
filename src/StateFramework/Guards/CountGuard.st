NAMESPACE Simatic.Ax.StateFramework

    CLASS CountGuard IMPLEMENTS IGuard
        VAR PUBLIC
            Count : LINT;
        END_VAR
        VAR
            _actCount : LINT;
        END_VAR

        METHOD PUBLIC Config
            VAR_INPUT
                countValue : LINT;
            END_VAR
            // Count defines after how many Check calls the guard becomes TRUE once.
            Count := countValue;
        END_METHOD

        METHOD PUBLIC Check : BOOL
            // The counter is incremented on every evaluation and resets after firing.
            _actCount := _actCount + LINT#1;
            IF (_actCount >= Count) THEN                
                _actCount := LINT#0;
                Check := TRUE;
            ELSE
                Check := FALSE;
            END_IF;
            
        END_METHOD

        METHOD PUBLIC Reset
            // CountGuard keeps counting across cycles until it fires.
            ;
        END_METHOD

    END_CLASS




END_NAMESPACE