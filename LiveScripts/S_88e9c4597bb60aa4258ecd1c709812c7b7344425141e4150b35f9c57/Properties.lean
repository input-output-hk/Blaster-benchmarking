import LiveScripts.Shared
import LiveScripts.S_88e9c4597bb60aa4258ecd1c709812c7b7344425141e4150b35f9c57.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_88e9c4597bb60aa4258ecd1c709812c7b7344425141e4150b35f9c57.script [ctx] 10000]
