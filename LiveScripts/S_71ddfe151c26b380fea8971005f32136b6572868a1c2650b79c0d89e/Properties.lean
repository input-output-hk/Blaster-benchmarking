import LiveScripts.Shared
import LiveScripts.S_71ddfe151c26b380fea8971005f32136b6572868a1c2650b79c0d89e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_71ddfe151c26b380fea8971005f32136b6572868a1c2650b79c0d89e.script [ctx] 10000]
