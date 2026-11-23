import LiveScripts.Shared
import LiveScripts.S_d7d0964207f768325a00450a99e947ce750f6dc066d0880ce14d04e9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d7d0964207f768325a00450a99e947ce750f6dc066d0880ce14d04e9.script [ctx] 10000]
