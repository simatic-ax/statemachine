USING Simatic.Ax.Stateframework;

NAMESPACE AxUnit.Assert

    // Helper overload for comparing transition interface references in tests.
    FUNCTION Equal
            VAR_INPUT
		         expected:  ITransition;
		         actual:  ITransition;
	        END_VAR
        // Interface equality is reduced to reference equality.
            Equal(expected := TRUE, actual := expected = actual);
    END_FUNCTION     

END_NAMESPACE