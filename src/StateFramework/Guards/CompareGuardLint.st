NAMESPACE Simatic.Ax.StateFramework

    TYPE 
        Condition : (GT, EQ, LT, NE, GE, LE);
    END_TYPE

    CLASS CompareGuardLint IMPLEMENTS IGuard
        VAR PUBLIC
            _value : REF_TO LINT;
            _compareToValue : LINT;
            _condition : Condition;
        END_VAR
        
        METHOD PUBLIC Config
            VAR_INPUT
                value : REF_TO LINT;
                compareToValue : LINT;
                condition : Condition;                
            END_VAR
            _value := value;
            _compareToValue := compareToValue;
            _condition := condition;
        END_METHOD
        
        // ---------------- IMPLEMENT IGuard---------------------------
        METHOD PUBLIC Check : BOOL

            CASE _condition OF
                Condition#GT : Check := _value^ > _compareToValue;
                Condition#EQ : Check := _value^ = _compareToValue;
                Condition#LT : Check := _value^ < _compareToValue;
                Condition#GE : Check := _value^ >= _compareToValue;
                Condition#LE : Check := _value^ <= _compareToValue;
            END_CASE
            ;

        END_METHOD

        METHOD PUBLIC Reset
            ;
        END_METHOD
        // ---------------- END IMPLEMENT IGuard---------------------------


    END_CLASS
END_NAMESPACE
