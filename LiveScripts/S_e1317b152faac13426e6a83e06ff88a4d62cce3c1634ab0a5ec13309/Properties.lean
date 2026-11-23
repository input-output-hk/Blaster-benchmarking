import LiveScripts.Shared
import LiveScripts.S_e1317b152faac13426e6a83e06ff88a4d62cce3c1634ab0a5ec13309.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e1317b152faac13426e6a83e06ff88a4d62cce3c1634ab0a5ec13309.script [datum, redeemer, ctx] 10000]
