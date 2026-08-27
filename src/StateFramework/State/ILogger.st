NAMESPACE Simatic.Ax.StateFramework
    INTERFACE ILogger

        // Writes one log message to the attached logger implementation.
        METHOD WriteLog
            VAR_INPUT
                message : String;
            END_VAR
        END_METHOD
    END_INTERFACE
END_NAMESPACE