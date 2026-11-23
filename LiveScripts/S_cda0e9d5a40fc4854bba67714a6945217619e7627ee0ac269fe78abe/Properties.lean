import LiveScripts.Shared
import LiveScripts.S_cda0e9d5a40fc4854bba67714a6945217619e7627ee0ac269fe78abe.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cda0e9d5a40fc4854bba67714a6945217619e7627ee0ac269fe78abe.script [datum, redeemer, ctx] 10000]
