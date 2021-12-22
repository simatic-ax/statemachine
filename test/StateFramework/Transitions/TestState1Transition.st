USING Simatic.Ax.Stateframework;
USING AxUnit.Assert;

NAMESPACE Simatic.Ax.StateFramework.Test
    {TestFixture}
    CLASS TestTransition1
        VAR
            state1 : State1Transition := (StateId := 99, StateName := 'blabla');
            trans : Transition;
        END_VAR

        {Test}
        METHOD PUBLIC  TransitionCount_Expect_0
            Equal(expected := UINT#0, actual := state1.TransitionCount());            
        END_METHOD

        
        {Test}
        METHOD PUBLIC  TransitionCount_Expect_1
            state1.Transition1 := trans;
            Equal(expected := UINT#1, actual := state1.TransitionCount());            
        END_METHOD
        
        

        {Test}
        METHOD PUBLIC StateID_Expect_5
            state1.StateID := 5;
            state1.StateName := 'Testing';
            Equal(expected := 5, actual := state1.GetStateID());            
            Equal(expected := 'Testing', actual := state1.GetStateName());            
        END_METHOD

        {Test}
        METHOD PUBLIC  GetTransition_1_and_expect_NULL
            state1.Transition1 := trans;
            Equal(expected := NULL, actual := state1.GetTransition(UINT#1));            
            Equal(expected := trans, actual := state1.GetTransition(UINT#0));            
        END_METHOD
        {Test}

        METHOD PUBLIC  GetTransition_0_and_expect_NULL
            state1.Transition1 := NULL;
            Equal(expected := NULL, actual := state1.GetTransition(UINT#0));            
            Equal(expected := NULL, actual := state1.GetTransition(UINT#1));            
        END_METHOD

    END_CLASS
END_NAMESPACE