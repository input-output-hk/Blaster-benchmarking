import LiveScripts.Shared
import LiveScripts.S_b56838500bfefcba32d69a6dc280ea1887c950a8be4e4d991f8d1415.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b56838500bfefcba32d69a6dc280ea1887c950a8be4e4d991f8d1415.script [datum, redeemer, ctx] 10000]
