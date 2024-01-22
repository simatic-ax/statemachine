USING Simatic.Ax.Stateframework;

NAMESPACE AxUnit.Assert

    
    FUNCTION Equal
            VAR_INPUT
		         expected:  ITransition;
		         actual:  ITransition;
	        END_VAR
            Equal(expected := TRUE, actual := expected = actual);
    END_FUNCTION     

END_NAMESPACE