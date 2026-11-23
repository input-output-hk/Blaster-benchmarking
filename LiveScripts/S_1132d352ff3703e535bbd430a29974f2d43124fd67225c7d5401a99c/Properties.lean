import LiveScripts.Shared
import LiveScripts.S_1132d352ff3703e535bbd430a29974f2d43124fd67225c7d5401a99c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1132d352ff3703e535bbd430a29974f2d43124fd67225c7d5401a99c.script [ctx] 10000]
