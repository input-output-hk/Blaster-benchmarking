import LiveScripts.Shared
import LiveScripts.S_b80ac637b92af8d0a8bb366e9cbd153ca3ebfdb7d1d209a7c0a75b34.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b80ac637b92af8d0a8bb366e9cbd153ca3ebfdb7d1d209a7c0a75b34.script [datum, redeemer, ctx] 10000]
