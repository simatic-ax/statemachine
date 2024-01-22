USING System.Timer;
USING Simatic.Ax.StateFramework;
USING AxUnit.Assert;

NAMESPACE Simatic.Ax.StateFramework.Test

    {TestFixture}
    CLASS CountGuardTest
        VAR
            _guard : Simatic.Ax.StateFramework.CountGuard;
            _guardStateless : Simatic.Ax.StateFramework.CountGuard;
        END_VAR

        {TestSetup}
        METHOD PUBLIC MyTestSetup
            // Will be called before each test
            _guard := _guardStateless;
        END_METHOD

        {Test}
        METHOD PUBLIC TestCheck_Two_Times_Expect_TRUE
            _guard.Count := 2;
            Equal(actual := _guard.Check(), expected := FALSE);
            Equal(actual := _guard.Check(), expected := TRUE);
            Equal(actual := _guard.Check(), expected := FALSE);
        END_METHOD

        {Test}
        METHOD PUBLIC TestCheck_Two_Times_With_Reset_Expect_TRUE
            _guard.Count := 2;
            Equal(actual := _guard.Check(), expected := FALSE);
            _guard.Reset();
            Equal(actual := _guard.Check(), expected := TRUE);
            _guard.Reset();
        END_METHOD
    END_CLASS


    {TestFixture}
    CLASS TrueGuardTest
        VAR
            _guard : TrueGuard;
        END_VAR

        {Test}
        METHOD PUBLIC TrueGuard_Expect_AlwaysTrue
            Equal(actual := _guard.Check(), expected := TRUE);
            _guard.Reset();
            Equal(actual := _guard.Check(), expected := TRUE);
            _guard.Reset();
            Equal(actual := _guard.Check(), expected := TRUE);
        END_METHOD

    END_CLASS

    {TestFixture}
    CLASS BoolGuardTest
        VAR
            _guard : BoolGuard;
            _value : BOOL;
        END_VAR

        {Test}
        METHOD PUBLIC BoolGuard_ExpectFalse_WhenValueFalse
            _guard.Value := REF(_value);
            _value := FALSE;
            Equal(actual := _guard.Check(), expected := FALSE);
            _guard.Reset();
            Equal(actual := _guard.Check(), expected := FALSE);
        END_METHOD

        {Test}
        METHOD PUBLIC BoolGuard_ExpectTrue_WhenValueTrue
            _guard.Value := REF(_value);
            _value := TRUE;
            Equal(actual := _guard.Check(), expected := TRUE);
            _guard.Reset();
            Equal(actual := _guard.Check(), expected := TRUE);
        END_METHOD

    END_CLASS

    {TestFixture}
    CLASS AndGuardTest
        VAR
            _guard : AndGuard;
            _bg1 : BoolGuard;
            _bg2 : BoolGuard;
            _b1 : BOOL;
            _b2 : BOOL;
            _q : BOOL;
        END_VAR

        {Test(b1 := FALSE, b2 := FALSE, q := FALSE)}
        {Test(b1 := FALSE, b2 := TRUE, q := FALSE)}        
        {Test(b1 := TRUE, b2 := FALSE, q := FALSE)}        
        {Test(b1 := TRUE, b2 := TRUE, q := TRUE)}        
        METHOD PUBLIC AndGuard_Expect_True_When_b1_and_b2_TRUE
            VAR_INPUT
                b1: BOOL;
                b2: BOOL;
                q : BOOL;
            END_VAR
            _b1 := b1;
            _b2 := b2;
            _q := q;

            _bg1.Value := REF(_b1);
            _bg2.Value := REF(_b2);
            _guard.Lhs := _bg1;
            _guard.Rhs := _bg2;
            

            Equal(actual := _guard.Check(), expected := _q);
            _guard.Reset();
            Equal(actual := _guard.Check(), expected := _q);
            _guard.Reset();
            Equal(actual := _guard.Check(), expected := _q);
        END_METHOD

    END_CLASS

    {TestFixture}
    CLASS OrGuardTest
        VAR
            _guard : OrGuard;
            _bg1 : BoolGuard;
            _bg2 : BoolGuard;
            _b1 : BOOL;
            _b2 : BOOL;
            _q : BOOL;
        END_VAR

        {Test(b1 := FALSE, b2 := FALSE, q := FALSE)}
        {Test(b1 := FALSE, b2 := TRUE, q := TRUE)}        
        {Test(b1 := TRUE, b2 := FALSE, q := TRUE)}        
        {Test(b1 := TRUE, b2 := TRUE, q := TRUE)}        
        METHOD PUBLIC OrGuard_Expect_True_When_b1_OR_b2_TRUE
            VAR_INPUT
                b1: BOOL;
                b2: BOOL;
                q : BOOL;
            END_VAR
            _b1 := b1;
            _b2 := b2;
            _q := q;

            _bg1.Value := REF(_b1);
            _bg2.Value := REF(_b2);
            _guard.Lhs := _bg1;
            _guard.Rhs := _bg2;
            

            Equal(actual := _guard.Check(), expected := _q);
            _guard.Reset();
            Equal(actual := _guard.Check(), expected := _q);
            _guard.Reset();
            Equal(actual := _guard.Check(), expected := _q);
        END_METHOD
    END_CLASS

    {TestFixture}
    CLASS XorGuardTest
        VAR
            _guard : XorGuard;
            _bg1 : BoolGuard;
            _bg2 : BoolGuard;
            _b1 : BOOL;
            _b2 : BOOL;
            _q : BOOL;
        END_VAR

        {Test(b1 := FALSE, b2 := FALSE, q := FALSE)}
        {Test(b1 := FALSE, b2 := TRUE, q := TRUE)}        
        {Test(b1 := TRUE, b2 := FALSE, q := TRUE)}        
        {Test(b1 := TRUE, b2 := TRUE, q := FALSE)}        
        METHOD PUBLIC XorGuard_Expect_True_When_b1_OR_b2_exclusively_TRUE
            VAR_INPUT
                b1: BOOL;
                b2: BOOL;
                q : BOOL;
            END_VAR
            _b1 := b1;
            _b2 := b2;
            _q := q;

            _bg1.Value := REF(_b1);
            _bg2.Value := REF(_b2);
            _guard.Lhs := _bg1;
            _guard.Rhs := _bg2;
            

            Equal(actual := _guard.Check(), expected := _q);
            _guard.Reset();
            Equal(actual := _guard.Check(), expected := _q);
            _guard.Reset();
            Equal(actual := _guard.Check(), expected := _q);
        END_METHOD
    END_CLASS

    {TestFixture}
    CLASS NotGuardTest
        VAR
            _guard : NotGuard;
            _bg1 : BoolGuard;
            _b1 : BOOL;
            _q : BOOL;
        END_VAR

        {Test(b1 := FALSE, q := TRUE)}
        {Test(b1 := TRUE, q := FALSE)}        
        METHOD PUBLIC NotGuard_Expect_True_When_b1_FALSE_And_opposite
            VAR_INPUT
                b1: BOOL;
                q : BOOL;
            END_VAR
            _b1 := b1;
            _q := q;

            _bg1.Value := REF(_b1);
            _guard.Guard := _bg1;          

            Equal(actual := _guard.Check(), expected := _q);
            _guard.Reset();
            Equal(actual := _guard.Check(), expected := _q);
            _guard.Reset();
            Equal(actual := _guard.Check(), expected := _q);
        END_METHOD
    END_CLASS

    {TestFixture}
    CLASS CompareGuardTest
        VAR
            _guard : CompareGuardLint;
            _compareToValue : LINT;
            _value : LINT;
        END_VAR
        
        {Test}    
        METHOD PUBLIC Compare_GT_Check_TRUE
            _compareToValue := 10;
            _value := 12;
                            
            _guard.Condition := Condition#GT;
            _guard.Value := REF(_value);
            _guard.CompareToValue := _compareToValue;
            
            Equal(actual := _guard.Check(), expected := TRUE);

            _guard.CompareToValue := 20;
            Equal(actual := _guard.Check(), expected := FALSE);

        END_METHOD

        
        {Test}    
        METHOD PUBLIC Compare_EQ_Check_TRUE
            _compareToValue := 10;
            _value := 10;
                            
            _guard.Condition := Condition#EQ;
            _guard.Value := REF(_value);
            _guard.CompareToValue := _compareToValue;
            
            Equal(actual := _guard.Check(), expected := TRUE);
            _guard.CompareToValue := 11;
            Equal(actual := _guard.Check(), expected := FALSE);

        END_METHOD
    END_CLASS    

END_NAMESPACE