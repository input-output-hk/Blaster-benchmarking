import LiveScripts.Shared
import LiveScripts.S_d9dcca86fdf2ca927ae6bf3dc4f5c8e81804700f4a9bf4d7b1cfa6a1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d9dcca86fdf2ca927ae6bf3dc4f5c8e81804700f4a9bf4d7b1cfa6a1.script [ctx] 10000]
