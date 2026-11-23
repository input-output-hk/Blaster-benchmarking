import LiveScripts.Shared
import LiveScripts.S_a6526564c2ce20de13d9d1729862c031555de19ba3a89227939bda89.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a6526564c2ce20de13d9d1729862c031555de19ba3a89227939bda89.script [ctx] 10000]
