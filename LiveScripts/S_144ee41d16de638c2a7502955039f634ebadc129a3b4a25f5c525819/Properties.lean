import LiveScripts.Shared
import LiveScripts.S_144ee41d16de638c2a7502955039f634ebadc129a3b4a25f5c525819.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_144ee41d16de638c2a7502955039f634ebadc129a3b4a25f5c525819.script [ctx] 10000]
