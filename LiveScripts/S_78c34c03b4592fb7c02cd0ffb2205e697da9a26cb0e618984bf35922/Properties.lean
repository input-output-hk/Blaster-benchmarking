import LiveScripts.Shared
import LiveScripts.S_78c34c03b4592fb7c02cd0ffb2205e697da9a26cb0e618984bf35922.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_78c34c03b4592fb7c02cd0ffb2205e697da9a26cb0e618984bf35922.script [ctx] 10000]
