import LiveScripts.Shared
import LiveScripts.S_bb149f6abbaea4d5e428386a486d379aff5ed835cd7844c06fcd8c9c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_bb149f6abbaea4d5e428386a486d379aff5ed835cd7844c06fcd8c9c.script [ctx] 10000]
