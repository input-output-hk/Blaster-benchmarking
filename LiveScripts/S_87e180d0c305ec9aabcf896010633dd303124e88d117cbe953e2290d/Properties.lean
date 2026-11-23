import LiveScripts.Shared
import LiveScripts.S_87e180d0c305ec9aabcf896010633dd303124e88d117cbe953e2290d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_87e180d0c305ec9aabcf896010633dd303124e88d117cbe953e2290d.script [datum, redeemer, ctx] 10000]
