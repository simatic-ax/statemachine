NAMESPACE Simatic.Ax.StateFramework

    /// Condition
    /// GT: Greater than compareValue
    /// EQ: Equal to compareValue
    /// LT: Less than compareValue
    /// NE: Is not equal to compareValue
    /// GE: Greater or equal to compareValue
    /// LE: Less or equal to compareValue
    TYPE 
        Condition : (GT, EQ, LT, NE, GE, LE);
    END_TYPE

    CLASS CompareGuardLint IMPLEMENTS IGuard
        VAR PUBLIC
            // Referenced runtime value that is compared against CompareToValue.
            Value : REF_TO LINT;
            // Constant comparison target.
            CompareToValue : LINT;
            // Selected comparison operator.
            Condition : Condition;
        END_VAR
        
        METHOD PUBLIC Config
            VAR_INPUT
                countValue : REF_TO LINT;
                compareValue : LINT;
                compareCondition : Condition;                
            END_VAR
            // Config stores the referenced value, threshold and comparison mode.
            Value := countValue;
            CompareToValue := compareValue;
            Condition := compareCondition;
        END_METHOD
        
        METHOD PUBLIC Check : BOOL
            // The referenced value is evaluated with the configured comparison operator.
            CASE Condition OF
                Condition#GT : Check := Value^ > CompareToValue;
                Condition#EQ : Check := Value^ = CompareToValue;
                Condition#LT : Check := Value^ < CompareToValue;
                Condition#GE : Check := Value^ >= CompareToValue;
                Condition#LE : Check := Value^ <= CompareToValue;
            END_CASE
            ;

        END_METHOD

        METHOD PUBLIC Reset
            // CompareGuardLint is stateless and therefore does not need a reset action.
            ;
        END_METHOD


    END_CLASS
END_NAMESPACE
