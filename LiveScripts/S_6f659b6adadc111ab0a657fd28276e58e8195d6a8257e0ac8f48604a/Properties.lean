import LiveScripts.Shared
import LiveScripts.S_6f659b6adadc111ab0a657fd28276e58e8195d6a8257e0ac8f48604a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6f659b6adadc111ab0a657fd28276e58e8195d6a8257e0ac8f48604a.script [ctx] 10000]
