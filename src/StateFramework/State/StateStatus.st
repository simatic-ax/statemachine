NAMESPACE Simatic.Ax.StateFramework
    // Runtime status of a state instance inside the controller.
    TYPE
        StateStatus : (
            IDLE,
            ACTIVE
        ) := IDLE;
    END_TYPE
END_NAMESPACE