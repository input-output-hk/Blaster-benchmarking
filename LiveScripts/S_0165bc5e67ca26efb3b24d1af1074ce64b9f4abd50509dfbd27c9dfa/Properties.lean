import LiveScripts.Shared
import LiveScripts.S_0165bc5e67ca26efb3b24d1af1074ce64b9f4abd50509dfbd27c9dfa.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0165bc5e67ca26efb3b24d1af1074ce64b9f4abd50509dfbd27c9dfa.script [ctx] 10000]
