import LiveScripts.Shared
import LiveScripts.S_7b5d4f9cb7209596c776aafce45a15c9faba1e88bb11d96e16c96f01.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7b5d4f9cb7209596c776aafce45a15c9faba1e88bb11d96e16c96f01.script [ctx] 10000]
