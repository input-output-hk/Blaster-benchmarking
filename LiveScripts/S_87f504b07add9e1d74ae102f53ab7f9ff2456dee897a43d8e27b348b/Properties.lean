import LiveScripts.Shared
import LiveScripts.S_87f504b07add9e1d74ae102f53ab7f9ff2456dee897a43d8e27b348b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_87f504b07add9e1d74ae102f53ab7f9ff2456dee897a43d8e27b348b.script [datum, redeemer, ctx] 10000]
