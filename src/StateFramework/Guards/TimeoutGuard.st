USING System.Timer;

NAMESPACE Simatic.Ax.StateFramework

    CLASS TimeoutGuard IMPLEMENTS IGuard
        VAR PUBLIC
            Timeout : TIME;
        END_VAR
        VAR
            _ton : OnDelay;
        END_VAR

        METHOD PUBLIC Config
            VAR_INPUT
                timeoutValue : TIME;
            END_VAR
            Timeout := timeoutValue;
        END_METHOD

        // ---------------- IMPLEMENT IGuard---------------------------
        METHOD PUBLIC Check : BOOL
            _ton(signal := TRUE, duration := Timeout);
            IF (_ton.output) THEN
                 Check := TRUE;
            ELSE
                Check := FALSE;
            END_IF;
        END_METHOD

        METHOD PUBLIC Reset
            _ton(signal:= FALSE);
        END_METHOD
        // ---------------- END IMPLEMENT IGuard---------------------------

    END_CLASS
END_NAMESPACE