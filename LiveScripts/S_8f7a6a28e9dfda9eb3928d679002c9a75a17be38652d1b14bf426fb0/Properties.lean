import LiveScripts.Shared
import LiveScripts.S_8f7a6a28e9dfda9eb3928d679002c9a75a17be38652d1b14bf426fb0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8f7a6a28e9dfda9eb3928d679002c9a75a17be38652d1b14bf426fb0.script [ctx] 10000]
