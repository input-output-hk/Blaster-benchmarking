import LiveScripts.Shared
import LiveScripts.S_730d04da38ffb7756072340338098c04413e75fedfb5669289e7c7bf.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_730d04da38ffb7756072340338098c04413e75fedfb5669289e7c7bf.script [datum, redeemer, ctx] 10000]
