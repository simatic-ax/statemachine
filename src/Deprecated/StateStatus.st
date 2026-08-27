NAMESPACE Simatic.Ax.StatePattern

    // Legacy runtime status structure used by the deprecated state context.
    TYPE StateStatus : 
        STRUCT
            isRunning : Bool;
            activeTime : TIME;
            remainingTime : LTIME;
        END_STRUCT;
    END_TYPE

END_NAMESPACE

