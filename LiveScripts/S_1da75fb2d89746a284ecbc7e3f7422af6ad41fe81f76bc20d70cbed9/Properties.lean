import LiveScripts.Shared
import LiveScripts.S_1da75fb2d89746a284ecbc7e3f7422af6ad41fe81f76bc20d70cbed9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1da75fb2d89746a284ecbc7e3f7422af6ad41fe81f76bc20d70cbed9.script [datum, redeemer, ctx] 10000]
