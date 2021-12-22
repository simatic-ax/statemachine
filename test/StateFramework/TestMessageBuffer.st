// USING AxUnit.Assert;
// USING AxUnit.Assert;
// USING Simatic.Ax.Stateframework;
// USING AxUnit.Assert;

// NAMESPACE Simatic.Ax.StateFramework.TestMessageBuffer
//     {TestFixture}
//     CLASS LogMessage
//         VAR PRIVATE
//             _logger : StateLogger;
//         END_VAR
//         {Test}
//         METHOD PUBLIC Enter_some_messages_and_compare_Values
//             _logger.WriteLog('Test1');
//             _logger.WriteLog('Test2');
//             Equal(expected := 'Test1', actual := _logger.MsgBuffer[0].message);
//             Equal(expected := 'Test2', actual := _logger.MsgBuffer[1].message);
//         END_METHOD
//     END_CLASS
// END_NAMESPACE