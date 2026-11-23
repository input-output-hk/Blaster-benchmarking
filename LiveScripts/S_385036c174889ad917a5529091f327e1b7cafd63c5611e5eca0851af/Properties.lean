import LiveScripts.Shared
import LiveScripts.S_385036c174889ad917a5529091f327e1b7cafd63c5611e5eca0851af.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_385036c174889ad917a5529091f327e1b7cafd63c5611e5eca0851af.script [redeemer, ctx] 10000]
