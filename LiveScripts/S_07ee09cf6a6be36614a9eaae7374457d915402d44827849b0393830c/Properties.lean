import LiveScripts.Shared
import LiveScripts.S_07ee09cf6a6be36614a9eaae7374457d915402d44827849b0393830c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_07ee09cf6a6be36614a9eaae7374457d915402d44827849b0393830c.script [ctx] 10000]
