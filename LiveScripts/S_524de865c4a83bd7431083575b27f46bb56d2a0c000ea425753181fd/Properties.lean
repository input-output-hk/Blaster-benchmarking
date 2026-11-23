import LiveScripts.Shared
import LiveScripts.S_524de865c4a83bd7431083575b27f46bb56d2a0c000ea425753181fd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_524de865c4a83bd7431083575b27f46bb56d2a0c000ea425753181fd.script [datum, redeemer, ctx] 10000]
