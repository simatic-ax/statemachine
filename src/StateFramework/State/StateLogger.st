NAMESPACE Simatic.Ax.StateFramework
    CLASS StateLogger IMPLEMENTS ILogger
        VAR PUBLIC
            MsgBuffer : Array[0..BUF_SIZE - 1] OF LogMessage;
        END_VAR
        VAR PROTECTED
            
        END_VAR
        VAR PRIVATE
            _pos : INT;
        END_VAR
        VAR CONSTANT PRIVATE
            BUF_SIZE : INT := 100;
        END_VAR

    
        METHOD PUBLIC WriteLog
            VAR_INPUT
                message : STRING;
            END_VAR
            VAR_TEMP
                _data : REF_TO LogMessage;
                _timestamp : DATE_AND_TIME;
            END_VAR
            _data := REF(MsgBuffer[_pos]);
            _data^.message := message;
            _data^.timestamp := _timestamp;        
            _pos := (_pos + 1) MOD BUF_SIZE;
        END_METHOD

    END_CLASS

    TYPE
        LogMessage : STRUCT
            timestamp : DATE_AND_TIME;
            message : String;
        END_STRUCT;
    END_TYPE



END_NAMESPACE