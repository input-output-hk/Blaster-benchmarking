import LiveScripts.Shared
import LiveScripts.S_c134d839a64a5dfb9b155869ef3f34280751a622f69958baa8ffd29c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c134d839a64a5dfb9b155869ef3f34280751a622f69958baa8ffd29c.script [datum, redeemer, ctx] 10000]
