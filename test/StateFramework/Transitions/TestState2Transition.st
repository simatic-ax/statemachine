USING Simatic.Ax.Stateframework;
USING AxUnit.Assert;

NAMESPACE Simatic.Ax.StateFramework.Test
    {TestFixture}
    CLASS TestTransition2
        VAR
            state2 : State2Transition;
            state2StateLess : State2Transition;
            trans1 : Transition;
            trans2 : Transition;
        END_VAR

        {TestSetup}
        METHOD PUBLIC MyTestSetup
            // Will be called before each test
            state2 := state2StateLess;
        END_METHOD

        {Test}
        METHOD PUBLIC  Set_no_trans_And_Expect_0
            Equal(expected := UINT#0, actual := state2.TransitionCount());            
        END_METHOD

        
        {Test}
        METHOD PUBLIC  Set_just_trans1_And_Expect_1
            state2.Transition1 := trans1;
            Equal(expected := UINT#1, actual := state2.TransitionCount());            
        END_METHOD
        
        {Test}
        METHOD PUBLIC  Set_just_trans2_And_Expect_1
            state2.transition2 := trans1;
            Equal(expected := UINT#1, actual := state2.TransitionCount());            
        END_METHOD
        {Test}
        METHOD PUBLIC  Set_both_trans_And_Expect_2
            state2.Transition1 := trans1;
            state2.transition2 := trans2;
            Equal(expected := UINT#2, actual := state2.TransitionCount());            
        END_METHOD

        {Test}
        METHOD PUBLIC StateID_Expect_5
            state2.StateID := 5;
            Equal(expected := 5, actual := state2.GetStateID());            
        END_METHOD

        {Test}
        METHOD PUBLIC Get_Transition_0_and_1_and_get_correct_Transition
            state2.Transition1 := trans1;
            state2.Transition2 := trans2;
            Equal(expected := trans1, actual := state2.GetTransition(UINT#0));                      
            Equal(expected := trans2, actual := state2.GetTransition(UINT#1));      
            Equal(expected := NULL, actual := state2.GetTransition(UINT#2));      
                            
        END_METHOD

        {Test}
        METHOD PUBLIC Get_Transition_0_and_get_correct_Transition
            state2.Transition1 := trans1;
            Equal(expected := trans1, actual := state2.GetTransition(UINT#0));                      
            Equal(expected := NULL, actual := state2.GetTransition(UINT#1));      
                            
        END_METHOD
        {Test}
        
        METHOD PUBLIC Get_Transition_0_and_get_correct_Transition2
            state2.transition2 := trans1;
            Equal(expected := trans1, actual := state2.GetTransition(UINT#0));                      
            Equal(expected := NULL, actual := state2.GetTransition(UINT#1));      
                            
        END_METHOD
    END_CLASS
END_NAMESPACE