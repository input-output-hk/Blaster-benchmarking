import LiveScripts.Shared
import LiveScripts.S_895be52862a9769112f0ccd8d0cd5de1adfe5e03562422782c24b394.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_895be52862a9769112f0ccd8d0cd5de1adfe5e03562422782c24b394.script [datum, redeemer, ctx] 10000]
