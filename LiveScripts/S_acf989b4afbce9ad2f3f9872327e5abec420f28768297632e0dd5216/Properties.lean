import LiveScripts.Shared
import LiveScripts.S_acf989b4afbce9ad2f3f9872327e5abec420f28768297632e0dd5216.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_acf989b4afbce9ad2f3f9872327e5abec420f28768297632e0dd5216.script [ctx] 10000]
