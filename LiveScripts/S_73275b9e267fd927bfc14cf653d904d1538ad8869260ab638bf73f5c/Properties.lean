import LiveScripts.Shared
import LiveScripts.S_73275b9e267fd927bfc14cf653d904d1538ad8869260ab638bf73f5c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_73275b9e267fd927bfc14cf653d904d1538ad8869260ab638bf73f5c.script [datum, redeemer, ctx] 10000]
