import LiveScripts.Shared
import LiveScripts.S_1d6cff26bcab91d2061aad0bd259cbb7d76d25ced2eeaed5926a42ad.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1d6cff26bcab91d2061aad0bd259cbb7d76d25ced2eeaed5926a42ad.script [datum, redeemer, ctx] 10000]
