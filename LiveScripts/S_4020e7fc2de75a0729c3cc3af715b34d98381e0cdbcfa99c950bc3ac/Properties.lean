import LiveScripts.Shared
import LiveScripts.S_4020e7fc2de75a0729c3cc3af715b34d98381e0cdbcfa99c950bc3ac.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4020e7fc2de75a0729c3cc3af715b34d98381e0cdbcfa99c950bc3ac.script [datum, redeemer, ctx] 10000]
