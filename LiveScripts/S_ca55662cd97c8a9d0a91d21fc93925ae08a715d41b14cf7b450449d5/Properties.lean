import LiveScripts.Shared
import LiveScripts.S_ca55662cd97c8a9d0a91d21fc93925ae08a715d41b14cf7b450449d5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ca55662cd97c8a9d0a91d21fc93925ae08a715d41b14cf7b450449d5.script [ctx] 10000]
