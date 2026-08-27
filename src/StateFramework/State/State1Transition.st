USING Simatic.Ax.Stateframework;

NAMESPACE Simatic.Ax.StateFramework
    // Convenience base state for exactly one outgoing transition.
    CLASS State1Transition EXTENDS AbstractState

        METHOD PUBLIC OVERRIDE OnEntry
            // Test helper state with no custom entry behavior.
            ;
        END_METHOD

        METHOD PUBLIC OVERRIDE OnExit
            // Test helper state with no custom exit behavior.
            ;
        END_METHOD

        METHOD PUBLIC OVERRIDE Action
            // Test helper state with no custom action behavior.
            ;
        END_METHOD

    END_CLASS 
    
    
END_NAMESPACE