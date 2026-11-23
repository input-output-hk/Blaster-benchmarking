import LiveScripts.Shared
import LiveScripts.S_70e391854b61ee115de9a00a2492771026fffaa92169cc58b5c4641e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_70e391854b61ee115de9a00a2492771026fffaa92169cc58b5c4641e.script [ctx] 10000]
