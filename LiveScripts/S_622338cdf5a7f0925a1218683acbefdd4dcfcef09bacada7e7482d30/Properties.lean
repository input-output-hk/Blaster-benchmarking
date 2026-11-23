import LiveScripts.Shared
import LiveScripts.S_622338cdf5a7f0925a1218683acbefdd4dcfcef09bacada7e7482d30.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_622338cdf5a7f0925a1218683acbefdd4dcfcef09bacada7e7482d30.script [datum, redeemer, ctx] 10000]
